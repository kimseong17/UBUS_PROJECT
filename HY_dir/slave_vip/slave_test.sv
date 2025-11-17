class slave_test extends uvm_test;
	`uvm_component_utils(slave_test)
	slave_env env;
	slave_sequence seq;
	
	function new(string name = "slave_test", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		env = slave_env::type_id::create("env", this);
		seq = slave_sequence::type_id::create("seq", this);
	endfunction: build_phase
/*
	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		if (env != null && env.tr != null) env.tr.print();
	endfunction: start_of_simulation_phase
*/
	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.s_agt.sequencer.run_phase", "default_sequence", slave_sequence::type_id::get());
	endfunction: end_of_elaboration_phase

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		for (int i=0; i<10; i++) begin
			slave_transfer tr = slave_transfer::type_id::create($sformatf("tr_%0d", i));
			assert(tr.randomize());
			env.s_agt.sequencer.request_fifo.put(tr);
		end
		#100;
		phase.drop_objection(this);
	endtask
endclass: slave_test
