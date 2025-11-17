class master_sequencer extends uvm_sequencer #(ubus_transfer);
	`uvm_component_utils(master_sequencer)

	function new(string name = "master_sequencer", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction: build_phase

endclass: master_sequencer
