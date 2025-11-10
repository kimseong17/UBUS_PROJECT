class ubus_master_env extends uvm_env;
    // UVM Factory //
    `uvm_component_utils(ubus_master_env)

    // Create System //
    ubus_master_agent master_agent;

    // Constructor //
    function new(string name, uvm_component parent);
	    super.new(name, parent);
    endfunction

    // Build Phase //
    function void build_phase(uvm_phase phase);
	    super.build_phase(phase);
	    master_agent	= master_agent::type_id::create("master_agent", this);
    endfunction
endclass