class ubus_master_read_word_seq extends uvm_sequence #(ubus_transfer);
	`uvm_object_utils(ubus_master_read_word_seq)

	function new(string name = "ubus_master_read_word_seq");
                super.new(name);
        endfunction: new

	virtual task body();
		ubus_transfer req, rsp;
		req = ubus_transfer::type_id::create("req");

		req.size = 4;
		req.write = 0;
		req.read = 1;
		req.data = new[4];
		req.error = 0;

		start_item(req);
		finish_item(req);

		get_response(rsp);

		`uvm_info("MSTR_SEQ", $sformatf("READ: addr=0x%0h, size=%0d, data=%0p", req.addr, req.size, req.data), UVM_LOW)
	endtask: body
endclass: ubus_master_read_word_seq
