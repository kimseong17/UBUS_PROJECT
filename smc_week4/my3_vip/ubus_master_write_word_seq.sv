class ubus_master_write_word_seq extends uvm_sequence #(packet);
	`uvm_object_utils(ubus_master_write_word_seq)

	function new(string name = "ubus_master_write_word_seq");
		super.new(name);
	endfunction
	
	/*virtual task pre_body(); // body 태스크 실행 직전에 호출
        // 현재 시퀀스가 시작된 phase를 가져와 objection을 올립니다.
        	uvm_phase starting_phase = get_starting_phase();
        	if (starting_phase != null) begin
           	 starting_phase.raise_objection(this);
       	 	end
    	endtask
	*/
	virtual task body();	
		`uvm_do_with(req, {
			req.addr == start_addr;
			req.size == 4;
			req.write == 1;
			req.read == 0;
			req.data.size() == 4;
			req.data[0] == data0;
			req.data[1] == data1;
			req.data[2] == data2;
			req.data[3] == data3;
			req.error ==0;
		})
		`uvm_info("MSTR_SEQ", $sformatf("WRITE : addr = 0x%0h , size = %0d, data = %0p" , req.addr, req.size, req.data), UVM_LOW)
	endtask

	/*virtual task post_body(); // body 태스크 실행 직후에 호출
        // body가 완료되면 objection을 내려 시뮬레이션이 종료될 수 있도록 합니다.
        	uvm_phase starting_phase = get_starting_phase();
       		if (starting_phase != null) begin
            		starting_phase.drop_objection(this);
        	end
    endtask*/

endclass 
