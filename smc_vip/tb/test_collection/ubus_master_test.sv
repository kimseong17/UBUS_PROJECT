`ifdef ENABLE_TEST_BASE
class test_base extends uvm_test;
    // UVM Factory //
	`uvm_component_utils(test_base)
    my3_vip_environment env;

	// Constructor //
    function new(string name="test_base", uvm_component parent=null);
     super.new(name, parent);
    endfunction

	// Component Creation & Configuration //
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = my3_vip_environment::type_id::create("env", this);
    endfunction

	// Start Simulation Phase //
    function void start_of_simulation_phase(uvm_phase phase);
    	super.start_of_simulation_phase(phase);
    	if (env != null && env.tr != null)
		env.tr.randomize();
		env.tr.print();
    	uvm_root::get().print_topology();
    endfunction
endclass
`endif

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

class ubus_master_test extends uvm_test;
	// UVM Factory //
    `uvm_component_utils(ubus_master_test)
    master_env env;
    master_sequence seq;

	// Constructor //
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

	// Build Phase //
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = master_env::type_id::create("env", this);
		seq = master_sequence::type_id::create("seq", this);
		uvm_top.print_topology();
    endfunction

	// Run Phase //
    task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		seq.start(env.master_agent.sequencer);
		phase.drop_objection(this);
    endtask 

endclass