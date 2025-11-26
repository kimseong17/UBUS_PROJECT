class test_base extends uvm_test;
	`uvm_component_utils(test_base)
	
	router_env env;
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		env=router_env::type_id::create("env",this);
	endfunction

	
	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"),UVM_HIGH);
	endfunction

	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		uvm_root::get().print_topology();
		uvm_factory::get().print();
		`uvm_info("TRACE", $sformatf("%m"),UVM_HIGH);

	endfunction
endclass
