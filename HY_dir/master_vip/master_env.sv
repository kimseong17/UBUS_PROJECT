class master_env extends uvm_env;
	ubus_transfer tr;
	master_agent m_agt;

	`uvm_component_utils(master_env)

	
	function new(string name = "master_env", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		tr = ubus_transfer::type_id::create("tr", this);
		m_agt = master_agent::type_id::create("m_agt", this);
	endfunction: build_phase
endclass: master_env
