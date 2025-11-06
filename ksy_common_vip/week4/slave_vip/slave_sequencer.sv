class slave_sequencer extends uvm_sequencer #(packet);

	`uvm_component_utils(slave_sequencer)
	uvm_tlm_analysis_fifo #(packet) request_fifo; // UVM transaction queue class	
	
	function new(string name = "slave_sequencer" , uvm_component parent = null);
		super.new(name,parent);
		//request_fifo = new("request_fifo",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		request_fifo = new("request_fifo", this);
	endfunction

endclass
