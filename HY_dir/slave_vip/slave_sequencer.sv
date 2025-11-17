class slave_sequencer extends uvm_sequencer #(ubus_transfer);
	`uvm_component_utils(slave_sequencer)
	uvm_tlm_analysis_fifo #(ubus_transfer) request_fifo;

	function new(string name = "slave_sequencer", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		request_fifo = new("request_fifo", this);
	endfunction: build_phase

	/*virtual task body();
		repeat (1) begin
			`uvm_do(req);
		end
	endtask: body*/
endclass: slave_sequencer
