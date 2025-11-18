class slave_monitor extends uvm_monitor;
	`uvm_component_utils(slave_monitor)

	ubus_transfer req;
	virtual ubus_if vif;

	uvm_analysis_port #(ubus_transfer) item_collected_port;
	uvm_analysis_port #(ubus_transfer) request_aport;

	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} moitor_state_e;
	moitor_state_e current_state = IDLE;
	int data_beat_count = 0;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		item_collected_port = new("item_collected_port", this);
		request_aport = new("request_aport", this);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

		req = ubus_transfer::type_id::create("req");
		if (!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("NOVIF", "virtual interface not set for monitor") end
	endfunction: build_phase

	task run_phase(uvm_phase phase);
		forever begin
			@(posedge vif.clk);

			if (vif.read || vif.write) begin
				req.addr = vif.addr;
				case (vif.size)
					2'b00: req.size = 1;
					2'b01: req.size = 2;
					2'b10: req.size = 4;
					2'b11: req.size = 8;
				endcase
				req.read = vif.read;
				req.write = vif.write;
				req.data = new[req.size];

				request_aport.write(req);

				if (req.read) begin
					collect_delayed_read_data(req);
				end else if (req.write) begin
					collect_write_data_immediately(req);
				end
				item_collected_port.write(req);
			end
			// `uvm_info("MONITOR", $sformatf("Monitored request addr=%0h size=%0d", req.addr, req.size), UVM_LOW);
		end
	endtask: run_phase

	task collect_delayed_read_data(ubus_transfer tr);
		for (int i=0; i<req.size; i++) begin
			item_collected_port.write(req);
			@(posedge vif.clk);
			for (int i=0; i<req.size; i++) begin
				@(posedge vif.clk)
				req.data[i] = vif.data;
				`uvm_info("SLV_MON", $sformatf("data_bit_count = %0d, ubus_data = %h, ubus_bip = %b", data_beat_count, req.data[i], vif.bip), UVM_LOW)
				data_beat_count++;
			end
				
		end		
	endtask: collect_delayed_read_data

	task collect_write_data_immediately(ubus_transfer tr);
		ubus_transfer single_req;
		single_req = ubus_transfer::type_id::create("single_req");
		single_req.data = new[req.size];

		for (int i=0; i<req.size; i++) begin
			@(posedge vif.clk);
			single_req.addr = req.addr;
			single_req.read = req.read;
			single_req.write = req.write;
			single_req.size = req.size;
			single_req.data[i] = vif.data;
			`uvm_info("SLV_MON", $sformatf("data=%0h, addr=%h, read=%0b, write=%0b, size=%0d", single_req.data[i], single_req.addr, single_req.read, single_req.write, single_req.size), UVM_LOW)
		end
	endtask: collect_write_data_immediately
endclass: slave_monitor
