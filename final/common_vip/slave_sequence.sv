class slave_sequence extends uvm_sequence #(packet);
	`uvm_object_utils(slave_sequence)
	
	`uvm_declare_p_sequencer(slave_sequencer)

	int unsigned m_mem[int unsigned];

	packet req;
	packet rsp;
	int count=0;

	
	//event all_done;

	function new(string name = "slave_sequence");
		super.new(name);
		req = packet::type_id::create("req");
		rsp = packet::type_id::create("rsp");
		
	endfunction

	/*virtual task pre_body(); // body 태스크 실행 직전에 호출
        // 현재 시퀀스가 시작된 phase를 가져와 objection을 올립니다.
        	uvm_phase starting_phase = get_starting_phase();
        	if (starting_phase != null) begin
           	 starting_phase.raise_objection(this);
       	 	end
    	endtask*/



	virtual task body(); //sequence는 body에 run_phase 코드를 작성
		
		//packet req,rsp;
		forever begin

			p_sequencer.request_fifo.get(req);

			rsp = packet::type_id::create("rsp");
			rsp.addr = req.addr;
			rsp.size = req.size;
			rsp.read = req.read;
			rsp.write = req.write;
			rsp.data = new[req.size];
			rsp.data = req.data;
			rsp.error = 0;
			rsp.wait_state= new[req.size];
		
			for (int i=0 ; i< req.size; i++) begin

				rsp.wait_state[i] =1;
				if (req.write) begin
					m_mem[req.addr+i] = req.data[i];
					//`uvm_info("SLV_SEQ_MEM", $sformatf("WRITE: Addr='h%h, Data='h%h (from req.data[%0d]", req.addr+i, m_mem[req.addr+i], i), UVM_LOW)
				end
				if (req.read) begin
					if(!m_mem.exists(req.addr + i)) begin
						m_mem[req.addr +i] = $urandom_range(8'h10,8'hFF);
					end
					rsp.data[i] = m_mem[req.addr + i];
				end
			end

			start_item(rsp);  // ready to transfer

			if(rsp.write==1 && count==1) begin
			`uvm_info("SLV_SEQ",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",rsp.data, rsp.addr, rsp.read, rsp.write , rsp.size),UVM_LOW)
			count=0;
			end else if (rsp.read==1) `uvm_info("SLV_SEQ",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",rsp.data, rsp.addr, rsp.read, rsp.write , rsp.size),UVM_LOW)
			
			

			finish_item(rsp);


		end

	endtask	
		
	virtual task post_body(); // body 태스크 실행 직후에 호출
        // body가 완료되면 objection을 내려 시뮬레이션이 종료될 수 있도록 합니다.
        	uvm_phase starting_phase = get_starting_phase();
       		if (starting_phase != null) begin
            		starting_phase.drop_objection(this);
        	end
   	 endtask





endclass 
