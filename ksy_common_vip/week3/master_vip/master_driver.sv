class master_driver extends uvm_driver #(packet);

	`uvm_component_utils(master_driver)

	virtual ubus_if vif;

	function new(string name = "master_driver", uvm_component parent=null);
		
		super.new(name,parent);
	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_if)::get(this,"","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		packet tr;

		forever begin
			seq_item_port.get_next_item(tr);
			drive_transfer(tr);
			`uvm_info("DRIVER",$sformatf("Driving new transaction : %s" , tr.sprint()) , UVM_LOW)
			//`uvm_info("DRIVER", $sformatf("addr=%-1h read=%0b write=%0b size=%0d data=%0p wait=%p error=%0b", tr.addr, tr.read, tr.write, tr.size, tr.data, tr.wait_state, tr.error), UVM_LOW);

			seq_item_port.item_done(tr);
		end
	endtask

	task drive_transfer(packet tr);

		@(posedge vif.ubus_clock);
			vif.ubus_addr <= tr.addr;
			vif.ubus_write <= tr.write;
			vif.ubus_read <= tr.read;
			vif.ubus_data <= tr.data[0];
			vif.ubus_wait <= tr.wait_state[0];
	endtask

endclass
