class ubus_test extends uvm_test;
	`uvm_component_utils(ubus_test)

	ubus_env env;

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		env = ubus_env::type_id::create("env", this);

		// master sequence 설정 
		//uvm_config_db#(uvm_object_wrapper)::set(this, "env.m_agt.sequencer.run_phase", "default_sequence", ubus_master_read_word_seq::type_id::get());
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.m_agt.sequencer.run_phase",     "default_sequence", ubus_master_write_word_seq::type_id::get());
		
		// slave sequence 설정 
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.s_agt.sequencer.run_phase", "default_sequence", ubus_slave_sequence::type_id::get());
	endfunction: build_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction: end_of_elaboration_phase

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		#1000;
		phase.drop_objection(this);
	endtask: run_phase
endclass: ubus_test
