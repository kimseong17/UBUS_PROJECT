class slave_monitor extends uvm_monitor;

	`uvm_component_utils(slave_monitor)

	virtual ubus_s_if vif; // database에서 값을 받아와 저장할 변수
	packet req;
	
	uvm_analysis_port #(packet) request_aport; //	monitor 안에 내장된 포트
	uvm_analysis_port #(packet) item_collected_port;

	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} monitor_state_e;
	monitor_state_e current_state = IDLE;
	int data_beat_count = 0;

	function new(string name = "slave_monitor", uvm_component parent = null);
		super.new(name, parent);
		request_aport = new("request_aport", this);
		item_collected_port = new("item_collected_port", this); 

	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		if(!uvm_config_db#(virtual ubus_s_if)::get(this,"uvm_test_top.env.s_agent*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
		@(posedge vif.ubus_clock);
			if (vif.ubus_read || vif.ubus_write) begin

				req = packet::type_id::create("req");
				req.addr = vif.ubus_addr;
				
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase
				req.read = vif.ubus_read;
				req.write = vif.ubus_write;
				req.data = new[req.size];
				req.wait_state = new[req.size];
				



				//request_aport.write(req);

				if (req.read) begin
					collect_delayed_read_data(req);
				end else if (req.write) begin
					collect_write_data_immediately(req);
				end
				//item_collected_port.write(req);
				
			end					
		end
	endtask     
			
	task collect_delayed_read_data(packet req);
    // 여러 클록 동안 데이터를 기다릴 수 있음
		request_aport.write(req);

		wait(vif.ubus_wait==0);
			for(int i =0; i<req.size; i++) begin
				@(posedge vif.ubus_clock);
				req.data[i] = vif.ubus_data;
				req.wait_state[i] =vif.ubus_wait; 
				data_beat_count ++;
			end
		
		`uvm_info("SLV_MON", $sformatf("data_beat_count=%0h, data=%0p, addr=0x%0h, read=%0b, write=%0b, size=%0d", data_beat_count, req.data, req.addr, req.read, req.write, req.size),UVM_LOW)


		item_collected_port.write(req);
		
		data_beat_count = 0;
	endtask 





	task collect_write_data_immediately(packet req);
		request_aport.write(req);
		wait(vif.ubus_wait==0);
    		for (int i = 0; i < req.size; i++) begin
				@(posedge vif.ubus_clock);

        		req.data[i] = vif.ubus_data;
				req.wait_state[i] = vif.ubus_wait;

		end

		`uvm_info("SLV_MON", $sformatf("data=%0p, addr=%h, read=%0b, write=%0b, size=%0d", req.data, req.addr, req.read, req.write, req.size),UVM_LOW)
		
		//request_aport.write(req);
		item_collected_port.write(req);




	



		
    		
	endtask	




            		// 🚨 버스에서 포착한 신호를 로그로 출력 🚨
            		//`uvm_info("MONITOR", $sformatf("BUS ACTIVITY DETECTED: ADDR=%0h, WRITE=%0b, READ=%0b, DATA=%0h, size=%0d", vif.ubus_addr, vif.ubus_write, vif.ubus_read, vif.ubus_data, vif.ubus_size), UVM_MEDIUM)
            	
            
        		
endclass 

/*class slave_monitor extends uvm_monitor;

	`uvm_component_utils(slave_monitor)

	virtual ubus_s_if vif; // database에서 값을 받아와 저장할 변수
	packet req;
	
	uvm_analysis_port #(packet) request_aport; //	monitor 안에 내장된 포트
	uvm_analysis_port #(packet) item_collected_port;

	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} monitor_state_e;
	monitor_state_e current_state = IDLE;
	int data_beat_count = 0;
	// 🚨 인코딩/숨겨진 문자 오류를 해결했습니다.
	const int MAX_WAIT_CYCLES = 5000;

	function new(string name = "slave_monitor", uvm_component parent = null);
		super.new(name, parent);
		request_aport = new("request_aport", this);
		item_collected_port = new("item_collected_port", this);

	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		if(!uvm_config_db#(virtual ubus_s_if)::get(this,"uvm_test_top.env.s_agent*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
		@(posedge vif.ubus_clock);
			if (vif.ubus_read || vif.ubus_write) begin

				req = packet::type_id::create("req");
				req.addr = vif.ubus_addr;
				
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase
				req.read = vif.ubus_read;
				req.write = vif.ubus_write;
				req.data = new[req.size];
				req.wait_state = new[req.size];
				
				if (req.read) begin
					collect_delayed_read_data(req);
				end else if (req.write) begin
					collect_write_data_immediately(req);
				end
				
			end					
		end
	endtask
			
	// Note: 이전에 오류를 유발했던 주석 처리된 태스크 블록을 제거했습니다.

	task collect_delayed_read_data(packet req);
		int count = 0;
		request_aport.write(req);

        // 🚨 [타임아웃 로직] DUT가 ubus_wait==1 상태(Busy/Wait)에서 벗어나기를 기다립니다.
		while(vif.ubus_wait == 1) begin
            @(posedge vif.ubus_clock);
            count++;
            
            if (count > MAX_WAIT_CYCLES) begin
                // 🚨 매크로 호출을 한 줄로 정리하여 숨겨진 문자열 오류를 해결했습니다.
                `uvm_fatal("SLV_MON", $sformatf("Monitor timed out waiting for ubus_wait==0 after %0d cycles. Transaction on 0x%0h is stuck.", MAX_WAIT_CYCLES, req.addr))
                return; // 트랜잭션 캡처 포기
            end
        end

        // wait이 풀린 후 (ubus_wait==0) 데이터 비트를 캡처합니다.
		for(int i =0; i<req.size; i++) begin
            bit temp_wait_state; // ICTA 에러 해결을 위한 임시 변수 선언
			@(posedge vif.ubus_clock);
			req.data[i] = vif.ubus_data;
            
            // logic -> bit 할당을 임시 변수를 통해 수행
			temp_wait_state = vif.ubus_wait;
			req.wait_state[i] = temp_wait_state;
			data_beat_count ++;
		end
		
		`uvm_info("SLV_MON", $sformatf("data_beat_count=%0h, data=%0p, addr=0x%0h, read=%0b, write=%0b, size=%0d", data_beat_count, req.data, req.addr, req.read, req.write, req.size),UVM_LOW)

		item_collected_port.write(req);
		data_beat_count = 0;
	endtask


	task collect_write_data_immediately(packet req);
		request_aport.write(req);
    	for (int i = 0; i < req.size; i++) begin
            bit temp_wait_state; // ICTA 에러 해결을 위한 임시 변수 선언
		    @(posedge vif.ubus_clock);

            // ubus_data를 req.data에 올바르게 할당
    	    req.data[i] = vif.ubus_data; 
            
            // logic -> bit 할당을 임시 변수를 통해 수행
            temp_wait_state = vif.ubus_wait; 
		    req.wait_state[i] = temp_wait_state; // 올바른 배열 요소에 할당
		end

		`uvm_info("SLV_MON", $sformatf("data=%0p, addr=%h, read=%0b, write=%0b, size=%0d", req.data, req.addr, req.read, req.write, req.size),UVM_LOW)
		
		item_collected_port.write(req);
	endtask	
endclass */