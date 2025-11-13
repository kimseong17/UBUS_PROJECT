class ubus_read_test extends uvm_test;
    // UVM Factory //
    `uvm_component_utils(ubus_read_test)
    
    // Create Environment //
    my3_vip_environment env;
    
    // Constructor //
    function new(string name, uvm_component parent);
	    super.new(name, parent);
    endfunction
    
    // Component Creation & Configuration //
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = my3_vip_environment::type_id::create("env", this);
        uvm_config_db#(uvm_object_wrapper)::set(this, "env.master_env.master_agent.sequencer.run_phase", "default_sequence", ubus_master_read_word_seq::type_id::get());
        uvm_config_db#(uvm_object_wrapper)::set(this, "env.slave_env.slave_agent.sequencer.run_phase", "default_sequence", slave_sequence::type_id::get());
    endfunction
    
    // Presimulation Configuration //
    function void end_of_elaboration_phase (uvm_phase phase);
	    uvm_top.print_topology();
    endfunction

    // Simulation execution //
    task run_phase(uvm_phase phase);
	`uvm_info("READ_TEST", "Run Phase Check", UVM_MEDIUM)
    endtask

endclass
