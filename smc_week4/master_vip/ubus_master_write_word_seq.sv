class ubus_master_write_word_seq extends uvm_sequence #(packet);
	// UVM Factory //
	`uvm_object_utils(ubus_master_write_word_seq)

	rand bit [15:0]
	function new(string name = "ubus_master_write_word_seq");
		super.new(name);
		if (!uvm_config_db#(int)::get(m_sequencer, "", "num_transactions", num_transactions)) begin
            `uvm_fatal("NO_CONFIG", "Failed to get num_transactions from config_db")
        end
		set_automatic_phase_objection(1);
	endfunction
	
	virtual task body();
		packet req = packet::type_id::create("req");
		
		`uvm_do_with(req, {
			req.addr == 0; //start_addr;
			req.size == 4;
			req.write == 1;
			req.read == 0;
			req.data.size() == 4;
			req.data[0] == data[0];
			req.data[1] == data[1];
			req.data[2] == data[2];
			req.data[3] == data[3];
			req.error ==0;
		})
		`uvm_info("MSTR_SEQ", $sformatf("WRITE : addr = 0x%0h , size = %0d, data = %0p" , req.addr, req.size, req.data), MEDIUM)
	endtask

endclass 
