class slave_sequence extends uvm_sequence #(packet);
	`uvm_object_utils(slave_sequence)
	
	`uvm_declare_p_sequencer(slave_sequencer)

	int unsigned m_mem[int unsigned];

	packet req;
	packet rsp;
	
	function new(string name = "slave_sequence");
		super.new(name);
		req = packet::type_id::create("req");
		rsp = packet::type_id::create("rsp");
		
	endfunction





	virtual task body(); //sequence는 body에 run_phase 코드를 작성
		
		//packet req,rsp;
		forever begin
			p_sequencer.request_fifo.get(req);
			//`uvm_info("SLV_SEQ",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",req.data, req.addr, req.read, req.write , req.size),UVM_LOW)


			rsp = packet::type_id::create("rsp");
			rsp.addr = req.addr;
			rsp.size = req.size;
			rsp.read = req.read;
			rsp.write = req.write;
			rsp.data = new[req.size];
			rsp.error = 0;
			rsp.wait_state= new[req.size];
		
			for (int i=0 ; i< req.size; i++) begin
				rsp.wait_state[i] =1;
				if (req.write) begin
					m_mem[req.addr+i] = req.data[i];
				end
				if (req.read) begin
					if(!m_mem.exists(req.addr + i))
						m_mem[req.addr +i] = $urandom_range(8'h10,8'hFF);
					rsp.data[i] = m_mem[req.addr + i];
				end
			end
			//req.print();
			start_item(rsp);  // ready to transfer
			//`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)
			`uvm_info("SLV_SEQ",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",rsp.data, req.addr, req.read, req.write , req.size),UVM_LOW)

			finish_item(rsp);
                        //`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)


		end
		//`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)
	endtask	
		
	/*virtual task post_body(); // body 태스크 실행 직후에 호출
        // body가 완료되면 objection을 내려 시뮬레이션이 종료될 수 있도록 합니다.
        	uvm_phase starting_phase = get_starting_phase();
       		if (starting_phase != null) begin
            		starting_phase.drop_objection(this);
        	end
   	 endtask*/





endclass 
