class slave_driver extends uvm_driver #(packet);

	`uvm_component_utils(slave_driver)

	virtual ubus_s_if vif;




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

           	seq_item_port.get_next_item(tr);
			 			
			if(tr.read) begin
				drive_read_response(tr); end
			else if(tr.write) begin
				drive_write_response(tr); end

			seq_item_port.item_done();

			end
	endtask

	virtual protected task drive_read_response(packet tr);
	for (int i=0; i<tr.wait_state.size-tr.size; i++) begin

			vif.ubus_wait<=tr.wait_state[i];
			vif.ubus_data <= tr.data[0];
			@(posedge vif.ubus_clock);	
			end

		`uvm_info("SLV_DRV", "Processing READ transaction", UVM_LOW)
		`uvm_info("SLV_DRV",$sformatf("data=%p",tr.data),UVM_LOW)

			for (int i = 0; i< tr.size; i++) begin
			vif.ubus_wait <= tr.wait_state[i+tr.wait_state.size-tr.size];
			vif.ubus_data <= tr.data[i];
			@(posedge vif.ubus_clock);
			end


			vif.ubus_wait <= '1;
			vif.ubus_data <= 'z;
	
		
	endtask

	virtual protected task drive_write_response(packet tr);


			for (int i=0; i<tr.wait_state.size; i++) begin
			vif.ubus_wait<=tr.wait_state[i];			
			@(posedge vif.ubus_clock);	
			end


			

			vif.ubus_wait<=1;
			@(posedge vif.ubus_clock);




		



								



								

								
			
 	endtask
	


endclass
