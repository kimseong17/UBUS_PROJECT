class ubus_master_read_word_seq extends uvm_sequence #(packet);
	`uvm_object_utils(ubus_master_read_word_seq)

	function new(string name = "ubus_master_read_word_seq");
		super.new(name);
	endfunction

	virtual task body();
	packet req, rsp;
	req = packet::type_id::create("req");
	//req.addr = start_addr;
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

	endtask

endclass 
