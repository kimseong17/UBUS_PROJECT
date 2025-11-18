class ubus_virtual_sequencer extends uvm_sequencer;

	`uvm_component_utils(ubus_virtual_sequencer)

	master_sequencer m_sequencer;
	slave_sequencer s_sequencer;
	
	function new(string name = "ubus_virtual_sequencer" , uvm_component parent);
		super.new(name,parent);
	endfunction




endclass
