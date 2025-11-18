class master_test extends uvm_test;
	`uvm_component_utils(master_test)
	master_env env;
	master_sequence seq;
	
	function new(string name = "master_test", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		env = master_env::type_id::create("env", this);
		seq = master_sequence::type_id::create("seq", this);
	endfunction: build_phase
/*
	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		if (env != null && env.tr != null) env.tr.print();
	endfunction: start_of_simulation_phase
*/

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		seq.start(env.m_agt.sequencer);
		phase.drop_objection(this);
	endtask
endclass: master_test
