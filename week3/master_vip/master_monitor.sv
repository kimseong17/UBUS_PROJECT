class master_monitor extends uvm_monitor;

	`uvm_component_utils(master_monitor)

	virtual ubus_if vif; // database에서 값을 받아와 저장할 변수

	function new(string name = "master_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual ubus_if)::get(this,"","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
		@(negedge vif.ubus_clock); 

			if (vif.ubus_read == 1'b1 || vif.ubus_write == 1'b1) begin 
            
            		// 🚨 버스에서 포착한 신호를 로그로 출력 🚨
            		`uvm_info("MONITOR", $sformatf("BUS ACTIVITY DETECTED: ADDR=%0h, WRITE=%0b, READ=%0b, DATA=%0h", vif.ubus_addr, vif.ubus_write, vif.ubus_read, vif.ubus_data), UVM_MEDIUM)
            
            // 실제 검증 환경에서는 여기서 packet 객체를 생성하여 데이터 수집 및 분석(Analysis Port)을 진행합니다.
        		end

		end
		@(posedge vif.ubus_clock);
	endtask

endclass
