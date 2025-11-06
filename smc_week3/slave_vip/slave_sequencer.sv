class slave_sequencer extends uvm_sequencer #(packet);

	`uvm_component_utils(slave_sequencer)
	uvm_tlm_fifo #(packet) request_fifo;	
	
	function new(string name = "slave_sequencer" , uvm_component parent = null);
		super.new(name,parent);
		request_fifo = new("request_fifo",this);
	endfunction

endclass
