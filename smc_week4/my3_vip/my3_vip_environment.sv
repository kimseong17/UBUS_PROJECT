`include "../master_vip/master_agent.sv"
class my3_vip_environment extends uvm_env;

	`uvm_component_utils(my3_vip_environment)

	master_agent m_agent;
	slave_agent s_agent;
	ubus_scoreboard scoreboard;	

	function new(string name , uvm_component parent) ;
		super.new(name, parent);
	endfunction



	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		m_agent = master_agent::type_id::create("m_agent",this);
		s_agent = slave_agent::type_id::create("s_agent",this);
		scoreboard =ubus_scoreboard::type_id::create("scoreboard",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		m_agent.monitor.item_collected_port.connect(scoreboard.item_collected_export);
	endfunction
	

	function void start_of_simulation_phase(uvm_phase phase);
		uvm_root::get().print_topology();
	endfunction	

endclass
		
