class slave_sequence extends uvm_sequence #(slave_transfer);
	`uvm_object_utils(slave_sequence)
	`uvm_declare_p_sequencer(slave_sequencer)

	slave_transfer req;
	slave_transfer rsp;

	function new(string name = "slave_sequence");
		super.new(name);
		req = slave_transfer::type_id::create("req");
		rsp = slave_transfer::type_id::create("rsp");
	endfunction: new

	task body();
		forever begin
			p_sequencer.request_fifo.get(req);
			req.print();//
			rsp.copy(req);//
			start_item(req);
			finish_item(req);

			get_response(rsp);
			rsp.print();
		end
	endtask: body
endclass: slave_sequence
