class ubus_master_write_word_seq extends uvm_sequence #(ubus_transfer);
	`uvm_object_utils(ubus_master_write_word_seq)

	function new(string name = "ubus_master_write_word_seq");
                super.new(name);
		
        endfunction: new

	virtual task body();
		ubus_transfer req;
		`uvm_do_with(req, {
			req.size == 2'b11;
			req.write == 1;
			req.read == 0;
			req.data.size() == 4;
			req.data[0] == 8'h3A;
                        req.data[1] == 8'hF7;
                        req.data[2] == 8'h19;
                        req.data[3] == 8'hC4;
			req.error == 0;});
		`uvm_info("MSTR_SEQ", $sformatf("WRITE: addr=0x%0h, size=%0d, data=%0p", req.addr, req.size, req.data), UVM_LOW)
	endtask: body
endclass: ubus_master_write_word_seq
