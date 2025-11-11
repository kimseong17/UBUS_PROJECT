class slave_env extends uvm_env;
    packet tr; 

    // Create System //
    ubus_slave_agent	slave_agent;

    // UVM Factory //
    `uvm_component_utils(ubus_slave_env)
  
    // Constructor //
    function new(string name="ubus_slave_env", uvm_component parent);
	    super.new(name,parent);
    endfunction
    
    // Build Phase //
    function void build_phase(uvm_phase phase);
	    super.build_phase(phase);
    	slave_agent = slave_agent::type_id::create("slave_agent",this);
    endfunction
endclass