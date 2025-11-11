class slave_monitor extends uvm_monitor;
	// UVM Factory //
	`uvm_component_utils(slave_monitor)

	// Create Environment //
	virtual ubus_if.SLAVE vif;
	packet req;

	// UVM_Analysis_Port //
	uvm_analysis_port #(packet) request_aport;
	uvm_analysis_port #(packet) item_collected_port;

	// Variable Declaration //
	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} monitor_state_e;
	monitor_state_e current_state = IDLE;
	int data_beat_count = 0;
	
	// Constructor //
	function new(string name = "slave_monitor", uvm_component parent = null);
		super.new(name, parent);
		request_aport = new("request_aport", this);
		item_collected_port = new("item_collected_port", this); 
	endfunction

	// Component Creation & Configuration //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		req = packet::type_id::create("req")
		if(!uvm_config_db#(virtual ubus_if.SLAVE)::get(this,"*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	// Simulation Execution //
	task run_phase(uvm_phase phase);
		forever begin
		@(posedge vif.ubus_clock);
			if (vif.ubus_read || vif.ubus_write ) begin
				req.addr = vif.ubus_addr;
				case (vif.ubus_size)
					2'b00: req.size = 1;
					2'b01: req.size = 2;
					2'b10: req.size = 4;
					2'b11: req.size = 8;
				endcase
				req.read = vif.ubus_read;
				req.write = vif.ubus_write;
				req.data = new[req.size];
				request_aport.write(req);

				// if (req.read) begin
				// 	collect_delayed_read_data(req);
				// end else if (req.write) begin
				// 	collect_write_data_immediately(req);
				// end
				item_collected_port.write(req);
			end						
		end
		`uvm_info("SLV_MON", "Run Phase Check", UVM_MEDIUM)
	endtask     
endclass
