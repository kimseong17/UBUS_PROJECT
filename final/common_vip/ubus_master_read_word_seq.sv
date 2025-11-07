class ubus_master_read_word_seq extends uvm_sequence #(packet);
	`uvm_object_utils(ubus_master_read_word_seq)
	
	function new(string name = "ubus_master_read_word_seq");
		super.new(name);
	endfunction
	
	virtual task pre_body(); // body 태스크 실행 직전에 호출
        // 현재 시퀀스가 시작된 phase를 가져와 objection을 올립니다.
        	uvm_phase starting_phase = get_starting_phase();
        	if (starting_phase != null) begin
           	 starting_phase.raise_objection(this);
       	 	end
    	endtask

	virtual task body();
	packet req, rsp;
	//for(int i =0; i<4; i++) begin
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

	`uvm_info("MSTR_SEQ", $sformatf("READ : addr = 0x%0h , size = %0d" , rsp.addr, rsp.size), UVM_LOW)
	//end

	endtask

endclass 
