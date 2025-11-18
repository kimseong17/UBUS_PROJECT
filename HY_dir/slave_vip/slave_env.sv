class slave_env extends uvm_env;
	slave_transfer tr;
	slave_agent s_agt;

	`uvm_component_utils(slave_env)

	
	function new(string name = "slave_env", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		tr = slave_transfer::type_id::create("tr", this);
		s_agt = slave_agent::type_id::create("s_agt", this);
	endfunction: build_phase
endclass: slave_env
