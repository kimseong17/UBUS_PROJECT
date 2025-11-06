class master_driver extends uvm_driver #(packet);

	`uvm_component_utils(master_driver)

	virtual ubus_if.MASTER vif;

	function new(string name = "master_driver", uvm_component parent=null);
		super.new(name,parent);
	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_if.MASTER)::get(this,"*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		packet tr;
		forever begin
			seq_item_port.get_next_item(tr);
			drive_transfer(tr);
			`uvm_info("DRIVER",$sformatf("Driving new transaction : %s" , tr.sprint()) , UVM_LOW)
			`uvm_info("DRIVER", $sformatf("addr=%-1h read=%0b write=%0b size=%0d data=%0p wait=%p error=%0b", tr.addr, tr.read, tr.write, tr.size, tr.data, tr.wait_state, tr.error), UVM_LOW);
			seq_item_port.item_done(tr);
		end
	endtask

	task drive_transfer(packet tr);
		@(posedge vif.ubus_clock);
			vif.ubus_addr <= tr.addr;
			vif.ubus_write <= tr.write;
			vif.ubus_read <= tr.read;
			vif.ubus_size <= (tr.size ==1) ? 2'b00:
					(tr.size ==2) ? 2'b01:
					(tr.size ==4) ? 2'b10:
					(tr.size ==8) ? 2'b11:2'b00;
			vif.ubus_bip <= 0;
			//`uvm_info("Master_DRIVER_writexx",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",tr.data, tr.addr, tr.read, tr.write , tr.size),UVM_LOW)		
			
			if(tr.write) begin
				//vif.ubus_write <= tr.write;
				for (int i =0; i<tr.size; i++) begin
					@(posedge vif.ubus_clock);	
					vif.ubus_data <= tr.data[i];
					if (i==0) begin
					vif.ubus_addr <= tr.addr;
					vif.ubus_bip <= 1;
					end else begin
					vif.ubus_addr <= vif.ubus_addr +1;
					end
					`uvm_info("Master_DRIVER_write",$sformatf("data=%h,addr=%h, read=%0b, write=%0b, size=%0d",tr.data[i], tr.addr+i, tr.read, tr.write , tr.size),UVM_LOW)	
					if (i==tr.size-1)
					vif.ubus_bip <=0;
					@(posedge vif.ubus_clock);
					//`uvm_info("Master_DRIVER_write",$sformatf("data=%h,addr=%h, read=%0b, write=%0b, size=%0d",tr.data[i], tr.addr+i, tr.read, tr.write , tr.size),UVM_LOW)	
								
				end
			end else if (tr.read) begin
				for (int i =0; i<tr.size; i++) begin
					@(posedge vif.ubus_clock);
					tr.data[i] = vif.ubus_data;
					`uvm_info("DRIVER_read","",UVM_LOW)
				end
			end

			
		//do @(posedge vif.ubus_clock); while(vif.ubus_wait==1);
		@(posedge vif.ubus_clock);
			//`uvm_info("Master_DRIVER_write",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size),UVM_LOW)
			vif.ubus_size <= 'z;
			vif.ubus_addr <= 'z;
			vif.ubus_data <= 'z;
			vif.ubus_write <= 0;
			vif.ubus_read <= 0;
			vif.ubus_bip <= 0;
	endtask

			//vif.ubus_wait <= tr.wait_state[0];
		
endclass
