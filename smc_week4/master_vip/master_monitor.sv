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
			if (vif.ubus_read || vif.ubus_write) begin
				req = packet::type_id::create("req");
				req.addr = vif.ubus_addr;
				case (vif.ubus_size)
					2'b00: req.size =1;
					2'b01: req.size =2;
					2'b10: req.size=4;
					2'b11: req.size =8;
				endcase
				//`uvm_info("MONITOR", $sformatf("req.size = %d, vif.ubus_size = %b" , req.size, vif.ubus_size) , UVM_LOW)
				req.read = vif.ubus_read;
				req.write = vif.ubus_write;
				req.data = new[req.size];
				for (int i = 0; i < req.size; i++) begin
					while (vif.ubus_wait != 0) @(posedge vif.ubus_clock);
					req.data[i] = vif.ubus_data;
				end
				item_collected_port.write(req);
			end
		end
	endtask
endclass
