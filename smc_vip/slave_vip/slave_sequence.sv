class slave_sequence extends uvm_sequence #(packet);
	// UVM Factory //
	`uvm_object_utils(slave_sequence)

	// Type-Safe p_sequencer Declaration //
	`uvm_declare_p_sequencer(slave_sequencer)

	// Create Environment //
	int unsigned m_mem[int unsigned];
	packet req;
	packet rsp;
	
	// Constructor //
	function new(string name = "slave_sequence");
		super.new(name);
		req = packet::type_id::create("req");
		rsp = packet::type_id::create("rsp");
	endfunction

	// Simulation Execution //
	virtual task body();
		forever begin
			p_sequencer.request_fifo.get(req);
			`uvm_info("SLV_SEQ",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",req.data, req.addr, req.read, req.write , req.size),UVM_MEDIUM)
			rsp.addr		= req.addr;
			rsp.size		= req.size;
			rsp.read		= req.read;
			rsp.write		= req.write;
			rsp.data		= new[req.size];
			rsp.error		= 0;
			rsp.wait_state	= new[req.size];

			for (int i=0 ; i< req.size; i++) begin
				rsp.wait_state[i] = 1;
				if (req.write) begin
					`uvm_info("SLV_SEQ", "Sequence WRITE DATA Bring", UVM_MEDIUM)
					m_mem[req.addr + i] = req.data[i];
				end
				if (req.read) begin
					`uvm_info("SLV_SEQ", "Sequnece READ DATA Bring", UVM_MEDIUM)
					if(!m_mem.exists(req.addr + i)) begin
						m_mem[req.addr +i] = $urandom_range(8'h10, 8'hFF);
						rsp.data[i] = m_mem[req.addr + i];
					end
				end
			end
			start_item(rsp);
			finish_item(rsp);
			`uvm_info("SLV_SEQ", "Sequence Finish Item", UVM_MEDIUM)
		end
		`uvm_info("SLV_SEQ", "RUN Phase Check", UVM_MEDIUM)
	endtask	
endclass 
