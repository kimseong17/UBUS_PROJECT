class slave_driver extends uvm_driver #(ubus_transfer);
	`uvm_component_utils(slave_driver)

	virtual ubus_if vif;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_if)::get(this, "", "vif", vif)) begin
			`uvm_fatal("NOVIF", "virtual interface not set for this driver instance") end
	endfunction: build_phase

	task run_phase(uvm_phase phase);
		forever begin
			ubus_transfer rsp;
			seq_item_port.get_next_item(rsp);
			if (rsp.read) begin
				drive_read_response(rsp);
			end else if (rsp.write) begin
				drive_write_response(rsp);
			end
			seq_item_port.item_done(rsp);
		end
	endtask: run_phase

	virtual protected task drive_read_response(ubus_transfer rsp);
		`uvm_info("SLV_DRV", "Processing READ transaction", UVM_LOW)

		for (int i=0; i<rsp.size; i++) begin
			vif.wait_state <= 0;
			vif.data <=rsp.data[i];
			vif.bip <= (i == rsp.size - 1) ? 0 : 1;
			@(posedge vif.clk);
		end
		vif.data <= 'z;
		vif.bip <= 'z;
	endtask: drive_read_response

	virtual protected task drive_write_response(ubus_transfer rsp);
		`uvm_info("SLV_DRV", "Processing WRITE transaction", UVM_LOW)

		vif.wait_state <= 0;
		vif.error <= rsp.error;
		@(posedge vif.clk);

		vif.error <= 'z;
	endtask: drive_write_response
endclass: slave_driver

// `endif
