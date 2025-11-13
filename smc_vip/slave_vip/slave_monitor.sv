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
	
	// Constructor //
	function new(string name = "slave_monitor", uvm_component parent = null);
		super.new(name, parent);
		request_aport = new("request_aport", this);
		item_collected_port = new("item_collected_port", this); 
	endfunction

	// Component Creation & Configuration //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		req = packet::type_id::create("req");
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

				if (req.read) begin
					collect_delayed_read_data(req);
				end else if (req.write) begin
					collect_write_data_immediately(req);
				end

				item_collected_port.write(req);
			end						
		end
		`uvm_info("SLV_MON", "Run Phase Check", UVM_MEDIUM)
	endtask     

	task collect_delayed_read_data(packet req);
		for (int i=0; i < req.size; i++) begin
			@(posedge vif.ubus_clock);
			req.data[i] = vif.ubus_data;
		end
	endtask

	task collect_write_data_immediately(packet req);
		packet single_req;
		single_req = packet::type_id::create($sformatf("single_req"));
		single_req.data = new[req.size];
		for (int i = 0; i < req.size; i++) begin
			@(posedge vif.ubus_clock);
			single_req.addr		= req.addr;
			single_req.read		= req.read;
			single_req.write	= req.write;
			single_req.size		= req.size;
			single_req.data[i]	= vif.ubus_data;
			`uvm_info("SLV_MON", $sformatf("data=%0h, addr=%h, read=%0b, write=%0b, size=%0d", single_req.data[i], single_req.addr, single_req.read, single_req.write, single_req.size), UVM_MEDIUM)
		end
		`uvm_info("SLV_MON2", $sformatf("data=%0p, addr=%h, read=%0b, write=%0b, size=%0d", single_req.data, single_req.addr, single_req.read, single_req.write, single_req.size), UVM_MEDIUM)

		item_collected_port.write(single_req);
	endtask
endclass

