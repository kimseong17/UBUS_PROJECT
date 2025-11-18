class slave_driver extends uvm_driver #(packet);

	`uvm_component_utils(slave_driver)

	virtual ubus_s_if vif;

	int count = 0;


	function new(string name = "slave_driver", uvm_component parent);		
		super.new(name,parent);
			
	endfunction


	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_s_if)::get(this,"uvm_test_top.env.s_agent*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	task run_phase(uvm_phase phase);
		packet tr;

		forever begin
			//vif.ubus_wait=1;
			 //@(posedge vif.ubus_clock);	
           		seq_item_port.get_next_item(tr);
			//`uvm_info("SLAVE_DRIVER",$sformatf("data=%0p,addr=%h, read=%0b, write=%0b, size=%0d",tr.data, tr.addr, tr.read, tr.write , tr.size),UVM_LOW)				 			
			if(tr.read) begin
				drive_read_response(tr); end
			else if(tr.write) begin
				drive_write_response(tr); end
			//drive_transfer(tr);
			//`uvm_info("DRIVER",$sformatf("Driving new transaction : %s" , tr.sprint()) , UVM_LOW)
			seq_item_port.item_done();

			end
	endtask

	virtual protected task drive_read_response(packet tr);
		
		`uvm_info("SLV_DRV", "Processing READ transaction", UVM_LOW)
			for (int i =0; i< tr.size; i++) begin
			@(posedge vif.ubus_clock);
			//`uvm_info("SLAVE_DRIVER",$sformatf("data=%h,addr=%h, read=%0b, write=%0b, size=%0d",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size),UVM_LOW)
			vif.ubus_wait <= 0;
			vif.ubus_data <= tr.data[i];
			//vif.ubus_bip <= (i == tr.size - 1 ) ? 0 : 1;
			`uvm_info("SLAVE_DRIVER",$sformatf("data=%h",tr.data[i]),UVM_LOW)
			

			end
			@(posedge vif.ubus_clock);
			vif.ubus_wait <= '1;
			vif.ubus_data <= 'z;
			//vif.ubus_bip <= '0;
	
		
	endtask

	virtual protected task drive_write_response(packet tr);

			
			
						
				
			vif.ubus_wait<=1;

			
			//`uvm_info("SLAVE_DRIVER",$sformatf("data=%p,addr=%h, read=%0b, write=%0b, size=%0d",tr.data, tr.addr, tr.read, tr.write , tr.size),UVM_LOW)

			@(posedge vif.ubus_clock);
			@(posedge vif.ubus_clock);
			@(posedge vif.ubus_clock);

				
				
			vif.ubus_wait<=0;

			for (int i=0; i<tr.size; i++) begin
			@(posedge vif.ubus_clock);
			end
	
			
	
			//vif.ubus_wait <= 0;
			//vif.ubus_error <= tr.error;
			//`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d, wait=%h",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size, vif.ubus_wait),UVM_LOW)
			/*if(count < tr.size) begin  
			`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d, wait=%h",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size, vif.ubus_wait),UVM_LOW)
			count=count+1;
			end else begin
			//@(posedge vif.ubus_clock); vif.ubus_wait <= 1;
			//@(posedge vif.ubus_clock);
			count=0;
			end*/
			/*if(count==0) begin
			`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d, wait=%h",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size, vif.ubus_wait),UVM_LOW)
			end*/
			//vif.ubus_error <= 0;
			//`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size),UVM_LOW)
			/*if(count!=0) begin 
			`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d, wait=%h",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size, vif.ubus_wait),UVM_LOW)
			end
			count=count+1;*/
			/*if(count < tr.size) begin  
			`uvm_info("SLAVE_DRIVER",$sformatf("data=%0h,addr=%h, read=%0b, write=%0b, size=%0d, wait=%h",vif.ubus_data, vif.ubus_addr, vif.ubus_read, vif.ubus_write , vif.ubus_size, vif.ubus_wait),UVM_LOW)
			count=count+1;
			end else begin
			//@(posedge vif.ubus_clock); vif.ubus_wait <= 1;
			//@(posedge vif.ubus_clock);
			count=0;
			end*/
					

			

								
			
 	endtask
	


endclass
