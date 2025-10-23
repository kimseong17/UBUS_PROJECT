//`include "ubus_env.sv"
class ubus_example_base_test extends uvm_test;

    `uvm_component_utils(ubus_example_base_test)
 
    ubus_env env;

    function new(string name = "ubus_example_base_test", uvm_component parent = null);
	super.new(name, parent);
	//`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction: new

    function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env = ubus_env::type_id::create("env", this);
    endfunction: build_phase

    function void start_of_simulation_phase(uvm_phase phase);
	super.start_of_simulation_phase(phase);
	uvm_root::get().print_topology;
	uvm_factory::get().print();
	if (env != null && env.tr != null) begin
	    for(int i=0; i<4 ; i++) begin
		env.tr.randomize();
		env.tr.print();

	
	    end
	end else begin
	    `uvm_error("NULL", "env.tr is null! Check build_phase")
	end
    endfunction: start_of_simulation_phase

endclass


