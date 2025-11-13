class slave_driver extends uvm_driver #(packet);
	// UVM Factory //
	`uvm_component_utils(slave_driver)

	// Create Environment //
	virtual ubus_if.SLAVE vif;
	packet rsp;

	// Constructor //
	function new(string name = "slave_driver", uvm_component parent);		
		super.new(name,parent);
	endfunction

	// Build Phase //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_if.SLAVE)::get(this,"*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	// Simulation Execution //
	task run_phase(uvm_phase phase);
		forever begin
           	seq_item_port.get_next_item(rsp);
			if 		(rsp.read) 	drive_read_response(rsp);
			else if	(rsp.write)	drive_write_response(rsp);
			seq_item_port.item_done();
		end
		`uvm_info("SLV_DRV", "DRIVER - Package Drive Check", UVM_MEDIUM)
	endtask

	// Drive Read Response //
	virtual protected task drive_read_response(packet rsp);
		`uvm_info("SLV_DRV", "Processing READ transaction", UVM_MEDIUM)	
		rsp.print();
		for (int i=0; i < rsp.size; i++) begin
			vif.ubus_wait	<= 0; 			// Ready
			vif.ubus_data	<= rsp.data[i];	// Data 구동
			vif.ubus_bip	<= (i == rsp.size - 1)? 0 : 1;
			vif.ubus_error	<= rsp.error;
			`uvm_info("SLV_DRV", "Drive DATA to INTERFACE", UVM_MEDIUM)
			@(posedge vif.ubus_clock);
			vif.ubus_error <= 'z;
		end
	endtask

	// Drive Write Response //
	virtual protected task drive_write_response(packet rsp);
		`uvm_info("SLV_DRV", "Processing WRITE transaction", UVM_MEDIUM)
		vif.ubus_wait	<= 0;
		vif.ubus_error 	<= rsp.error;
		@(posedge vif.ubus_clock);
		vif.ubus_error 	<= 'z;
 	endtask
endclass
