class ubus_slave_test extends uvm_test;
    `uvm_component_utils(ubus_slave_test)
    slave_env	        env;
    slave_sequence	    seq;

    function new(string name, uvm_component parent);
	super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = slave_env::type_id::create("env", this);
        seq = slave_sequence::type_id::create("seq", this);
        uvm_top.print_topology();
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.slave_agent.sequencer.run_phase","default_sequence",slave_sequence::type_id::get());
    endfunction

    task run_phase(uvm_phase phase);
	    phase.raise_objection(this);
	    for (int i=0; i < 10; i++) begin
		ubus_transfer tr = packet::type_id::create($sformatf("tr_%d",i));
		assert(tr.randomize());
		tr.print();
		uvm_root::get().print_topology();
		env.slave_agent.sequencer.request_fifo.put(tr);
		`uvm_info("Request Queue", "PUT item from FIFO",UVM_MEDIUM)
	    end
	    #50;
	    phase.drop_objection(this);
        `uvm_info("SLV_TST", "Run Phase Check", UVM_MEDIUM)
    endtask
endclass



