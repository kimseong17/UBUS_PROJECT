class ubus_virtual_sequencer extends uvm_sequencer;
    // UVM Factory //
    `uvm_component_utils(ubus_virtual_sequencer)

    // Create Environment //
    master_sequencer master_sequencer;
    slave_sequencer slave_sequencer;

    // Constructor //
    function new(string name = "ubus_virtual_sequencer", uvm_component parent = null);
        super.new(name);
    endfunction
endclass