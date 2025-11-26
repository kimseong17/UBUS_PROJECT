class slave_monitor extends uvm_monitor;

	`uvm_component_utils(slave_monitor)

	virtual ubus_if vif; // database에서 값을 받아와 저장할 변수
	packet req;
	uvm_analysis_port #(packet) request_aport; //	monitor 안에 내장된 포트

	function new(string name = "slave_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		request_aport = new("request_aport", this);
		req = packet::type_id::create("req");
		if(!uvm_config_db#(virtual ubus_if)::get(this,"","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
		@(posedge vif.ubus_clock); 

			 
            		req.addr = vif.ubus_addr ;
			req.size = vif.ubus_size ;
			foreach (req.data[i]) req.data[i] = vif.ubus_data[i] ;
			req.read = vif.ubus_read ;
			req.write = vif.ubus_write ;
			req.error =0;
			request_aport.write(req); 
			
	




            		// 🚨 버스에서 포착한 신호를 로그로 출력 🚨
            		`uvm_info("MONITOR", $sformatf("BUS ACTIVITY DETECTED: ADDR=%0h, WRITE=%0b, READ=%0b, DATA=%0h, size=%0d", vif.ubus_addr, vif.ubus_write, vif.ubus_read, vif.ubus_data, vif.ubus_size), UVM_MEDIUM)
            	
            
        		

		end
		@(posedge vif.ubus_clock);
	endtask

endclass
