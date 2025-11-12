class ubus_write_test extends uvm_test;
	// UVM Factory //
	`uvm_component_utils(ubus_write_test)
	
	// Create Envrionment //
	my3_vip_environment env;

	// Constructor //
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	// Component Create & Configuration //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = my3_vip_environment::type_id::create("env",this);
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.master_env.master_agent.sequencer.run_phase", "default_sequence", ubus_master_write_word_seq::type_id::get());
		uvm_config_db#(uvm_object_wrapper)::set(this,"env.slave_env.slave_agent.sequencer.run_phase","default_sequence", slave_sequence::type_id::get());
	endfunction

	// Pre-Simulation Configuration //
	function void end_of_elaboration_phase (uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	// Simulation Execution //
	task run_phase(uvm_phase phase);
		`uvm_info("WRITE_TEST", "Run Phase Check", UVM_MEDIUM)
	endtask
endclass
