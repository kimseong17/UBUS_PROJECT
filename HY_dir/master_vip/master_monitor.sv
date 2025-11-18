class master_monitor extends uvm_monitor;
	`uvm_component_utils(master_monitor)

	ubus_transfer req;
	virtual ubus_if vif;

	uvm_analysis_port #(ubus_transfer) item_collected_port;

	typedef enum {IDLE, ADDR_PHASE, DATA_PHASE, COMPLETE} monitor_state_e;
	monitor_state_e current_state = IDLE;
	int data_beat_count = 0;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		item_collected_port = new("item_collected_port", this);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

		if (!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("NOVIF", "virtual interface not set for monitor") end
	endfunction: build_phase

	task run_phase(uvm_phase phase);
		forever begin
			@(posedge vif.clk);
			if (vif.read || vif.write) begin
				req = ubus_transfer::type_id::create("req");
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
				for (int i=0; i<req.size; i++) begin
					while (vif.wait_state != 0) @(posedge vif.clk);
					req.data[i] = vif.data;
				end
				item_collected_port.write(req);
			end
		end
	endtask: run_phase
endclass: master_monitor
