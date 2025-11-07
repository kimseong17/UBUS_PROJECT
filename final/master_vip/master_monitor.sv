class master_monitor extends uvm_monitor;

	`uvm_component_utils(master_monitor)

	virtual ubus_if.MASTER vif; // database에서 값을 받아와 저장할 변수
	packet req;
	uvm_analysis_port #(packet) item_collected_port;

	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} monitor_state_e;
	monitor_state_e current_state = IDLE;
	int data_beat_count = 0;
	
	
	

	function new(string name = "master_monitor", uvm_component parent = null);
		super.new(name, parent);
		item_collected_port= new("item_collected_port", this);
	endfunction



	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual ubus_if.MASTER)::get(this,"*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		
		forever begin
		@(posedge vif.ubus_clock); 
			//req = packet::type_id::create("req");
			//if ((vif.ubus_read || vif.ubus_write) && vif.ubus_wait==0 && vif.ubus_data !== 'z && vif.ubus_data !== 'x ) begin
			if (vif.ubus_read) begin
				req = packet::type_id::create("req");
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase
							
				@(posedge vif.ubus_clock);
				@(posedge vif.ubus_clock);
					if(vif.ubus_bip == 1) begin					
						for(int i=0; i<req.size; i++) begin
							`uvm_info("Master_MONITOR", $sformatf("data_bit_count= %0d, ubus_data = %h, ubus_bip = %b" , data_beat_count, vif.ubus_data,vif.ubus_bip) , UVM_LOW)

							@(posedge vif.ubus_clock);
							data_beat_count++;
						end
					end
			end
					
			if (vif.ubus_write) begin
				//req = packet::type_id::create("req");
				
				//do @(posedge vif.ubus_clock); while(vif.ubus_wait==1'bx ||vif.ubus_wait ==1);	
				packet aaa;
				aaa = packet::type_id::create("aaa");
				req = packet::type_id::create("req");
				req.addr = vif.ubus_addr;
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase

				
				req.write = vif.ubus_write;
				req.read =vif.ubus_write;
				aaa.data = new[req.size];
				for (int i=0; i<req.size; i++) begin
				@(posedge vif.ubus_clock);
										
				aaa.addr = req.addr;
				aaa.size = req.size;
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase
				//`uvm_info("MONITOR", $sformatf("req.size = %d, vif.ubus_size = %b" , req.size, vif.ubus_size) , UVM_LOW)
				aaa.read = req.read;
				aaa.write = req.write;
				aaa.data[i]= vif.ubus_data;
				
				//req.data = new[req.size];
				
				/*for (int i=0; i<req.size; i++) begin


					req.data[i] = vif.ubus_data;
					req.addr=vif.ubus_addr;
					@(posedge vif.ubus_clock); */
					//`uvm_info("MONITOR", $sformatf("MONITOR: %s", req.sprint()), UVM_LOW)
				`uvm_info("MONITOR",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d",aaa.data[i], aaa.addr, aaa.read, aaa.write , aaa.size),UVM_LOW)		
				
				item_collected_port.write(aaa);
				end
			end
			//`uvm_info("MONITOR", $sformatf("MONITOR: addr=0x%0h read=%0b write=%0b size=%0d data=%p",req.addr, req.read, req.write, req.size, req.data), UVM_LOW)
				
			//item_collected_port.write(req);
			end
		//end
	endtask          		

            		// 🚨 버스에서 포착한 신호를 로그로 출력 🚨
            		//`uvm_info("MONITOR", $sformatf("BUS ACTIVITY DETECTED: ADDR=%0h, WRITE=%0b, READ=%0b, DATA=%0h", vif.ubus_addr, vif.ubus_write, vif.ubus_read, vif.ubus_data), UVM_MEDIUM)
            
            // 실제 검증 환경에서는 여기서 packet 객체를 생성하여 데이터 수집 및 분석(Analysis Port)을 진행합니다.
      

endclass
