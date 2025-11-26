class ubus_env extends uvm_env;
	`uvm_component_utils(ubus_env)

	master_agent m_agt;
	slave_agent s_agt;
	ubus_scoreboard scoreboard;
	
	function new(string name = "ubus_env", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		m_agt = master_agent::type_id::create("m_agt", this);
		s_agt = slave_agent::type_id::create("s_agt", this);
		scoreboard = ubus_scoreboard::type_id::create("scoreboard", this);
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		m_agt.monitor.item_collected_port.connect(scoreboard.item_collected_export);
	endfunction: connect_phase
endclass: ubus_env
