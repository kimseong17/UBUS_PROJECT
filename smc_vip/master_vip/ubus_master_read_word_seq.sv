class ubus_master_read_word_seq extends uvm_sequence #(packet);
	// UVM Factory //
	`uvm_object_utils(ubus_master_read_word_seq)
	
	// Number of Transactions //
	int num_transactions;

	rand bit [15:0] addr;

	// Constructor //
	function new(string name = "ubus_master_read_word_seq");
		super.new(name);
		if (!uvm_config_db#(int)::get(m_sequencer, "", "num_transactions", num_transactions)) begin
			`uvm_fatal("NO_CONFIG", "Failed to get num_transactions from config_db")
        end
		set_automatic_phase_objection(1);
	endfunction

	// Simulation Execution //
	virtual task body();
		packet req, rsp;
		req = packet::type_id::create("req");
		//rsp = packet::type_id::create("rsp");
		req.addr='0;
		req.size = 4;
		req.write = 0;
		req.read = 1;
		req.data = new[4];
		req.error =0 ;

		start_item(req);
		finish_item(req);
		get_response(rsp);

		`uvm_info("MSTR_SEQ", $sformatf("READ : addr = 0x%0h , size = %0d, data = %0p" , rsp.addr, rsp.size, rsp.data), UVM_LOW)

		// repeat (num_transactions) begin
		// 	`uvm_do_with(req, {
		// 		req.addr 	== local::addr;
		// 		req.write	== 0;
		// 		req.read	== 1;
		// 		req.error	== 0;
		// 	})
		// 	get_response(rsp);
		// 	`uvm_info("MST_READ_SEQ", $sformatf("READ : addr = 0x%0h , size = %0d, data = %0p" , rsp.addr, rsp.size, rsp.data), UVM_MEDIUM)
		// end
	endtask
endclass 
