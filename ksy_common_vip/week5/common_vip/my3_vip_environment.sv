class my3_vip_environment extends uvm_env;
	// UVM Factory //
	`uvm_component_utils(my3_vip_environment)
<<<<<<<< HEAD:ksy_common_vip/week5/common_vip/my3_vip_environment.sv
		
	master_agent m_agent;
	slave_agent s_agent;
	ubus_virtual_sequencer virtual_sequencer;
========

	// Create System //
	master_env master_env;
	slave_env slave_env;
>>>>>>>> 293b6570e7392a26abc1c61ba7e8868fd0be2cfc:smc_vip/tb/my3_vip/my3_vip_environment.sv
	ubus_scoreboard scoreboard;	

	// Constructor //
	function new(string name , uvm_component parent) ;
		super.new(name, parent);
	endfunction

	// Build Phase //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		master_env	= pkg_env::master_env::type_id::create("master_env",this);
		slave_env	= pkg_env::slave_env::type_id::create("slave_env",this);
		scoreboard =ubus_scoreboard::type_id::create("scoreboard",this);
		virtual_sequencer= ubus_virtual_sequencer::type_id::create("virtual_sequencer",this);
		

	endfunction

	// Scoreboard Connection //
	function void connect_phase(uvm_phase phase);
<<<<<<<< HEAD:ksy_common_vip/week5/common_vip/my3_vip_environment.sv
		m_agent.monitor.item_collected_port.connect(scoreboard.item_collected_export);
		
		virtual_sequencer.m_sequencer=m_agent.sequencer;
		virtual_sequencer.s_sequencer=s_agent.sequencer;

========
		super.connect_phase(phase);
		master_env.master_agent.monitor.item_collected_port.connect(scoreboard.master_export);
		slave_env.slave_agent.monitor.item_collected_port.connect(scoreboard.slave_export);
>>>>>>>> 293b6570e7392a26abc1c61ba7e8868fd0be2cfc:smc_vip/tb/my3_vip/my3_vip_environment.sv
	endfunction
	
	// Topology //
	function void start_of_simulation_phase(uvm_phase phase);
		uvm_root::get().print_topology();
	endfunction	
endclass
		
