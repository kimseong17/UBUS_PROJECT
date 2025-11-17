class my3_vip_environment extends uvm_env;
	// UVM Factory //
	`uvm_component_utils(my3_vip_environment)

	// Create System //
	master_env master_env;
	slave_env slave_env;
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
	endfunction

	// Scoreboard Connection //
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		master_env.master_agent.monitor.item_collected_port.connect(scoreboard.master_imp);
		slave_env.slave_agent.monitor.item_collected_port.connect(scoreboard.slave_imp);
	endfunction
	
	// Topology //
	function void start_of_simulation_phase(uvm_phase phase);
		uvm_root::get().print_topology();
	endfunction	
endclass
		
