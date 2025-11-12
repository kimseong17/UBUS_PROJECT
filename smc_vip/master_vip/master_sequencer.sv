class master_sequencer extends uvm_sequencer #(packet);
	// UVM Factory //
	`uvm_component_utils(master_sequencer)
	
	// Constructor //
	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
