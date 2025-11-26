class master_driver extends uvm_driver #(ubus_transfer);
	`uvm_component_utils(master_driver)

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
		ubus_transfer tr;
		forever begin
			seq_item_port.get_next_item(tr);
			drive_transfer(tr);
			seq_item_port.item_done(tr);
		end
	endtask: run_phase

	task drive_transfer(ubus_transfer tr);
		@(posedge vif.clk);
		vif.addr <= tr.addr;
		vif.read <= tr.read;
		vif.write <= tr.write;
		vif.size <= (tr.size == 1)? 2'b00 :
			(tr.size == 2) ? 2'b01 :
			(tr.size == 4) ? 2'b10 :
			(tr.size == 8) ? 2'b11 : 2'b00;
		@(posedge vif.clk);
		vif.size <= 'z;
		vif.addr <= 'z;
		vif.read <= 0;
		vif.write <= 0;

		if (tr.write) begin
			for (int i=0; i<tr.size; i++) begin
				vif.data <= tr.data[i];
				vif.bip  <= (i == tr.size-1) ? 0 : 1;
				do @(posedge vif.clk); while(vif.wait_state != 0);
			end
		        vif.data <= 'z;
			vif.bip  <= 'z;
		end else if (tr.read) begin
			for (int i=0; i<tr.size; i++) begin
				vif.bip <= (i == tr.size-1) ? 0 : 1;
				do @(posedge vif.clk); while (vif.wait_state != 0);
				tr.data[i] = vif.data;
			end
			vif.bip <= 'z;
		end
		vif.wait_state <= 0;
	endtask: drive_transfer
endclass: master_driver
