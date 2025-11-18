class ubus_slave_sequence extends uvm_sequence #(ubus_transfer);
	`uvm_object_utils(ubus_slave_sequence)
	`uvm_declare_p_sequencer(slave_sequencer)

	int unsigned m_mem[int unsigned];

	ubus_transfer req;
	ubus_transfer rsp;

	function new(string name = "slave_sequence");
		super.new(name);
		req = ubus_transfer::type_id::create("req");
		rsp = ubus_transfer::type_id::create("rsp");
	endfunction: new

	virtual task body();
		forever begin
			p_sequencer.request_fifo.get(req);

			rsp = ubus_transfer::type_id::create("rsp");
			rsp.addr = req.addr;
			rsp.size = req.size;
			rsp.read = req.read;
			rsp.write = req.write;
			rsp.data = new[req.size];
			rsp.error = 0;
			rsp.wait_state = new[req.size];

			for (int i=0; i<req.size; i++) begin
				rsp.wait_state[i] = 1;

				if (rsp.write) begin
					m_mem[req.addr + i] = req.data[i];
				end
				if (rsp.read) begin
					if (!m_mem.exists(req.addr + i)) begin
						m_mem[req.addr + i] = $urandom_range(8'h10, 8'hFF); end
					rsp.data[i] = m_mem[req.addr + i];
				end
			end
			start_item(rsp);
			finish_item(rsp);
		end
	endtask: body
endclass: ubus_slave_sequence
