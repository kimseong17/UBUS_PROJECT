class master_driver extends uvm_driver #(packet);

	// UVM Factory //
	`uvm_component_utils(master_driver)

	// Create Environment //
	virtual ubus_if.MASTER vif;

	// Constructor //
	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	// Component Creation & Configuration //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db#(virtual ubus_if.MASTER)::get(this,"*","vif",vif)) begin
			`uvm_fatal("NOVIF", "No virtual interface specified for this monitor instance");
		end
	endfunction

	// Simulation Execution //
	task run_phase(uvm_phase phase);
		packet req;
		packet rsp;
		forever begin
			seq_item_port.get_next_item(req); // sequencer는 Driver의 Response(item_done())를 기다림.
			drive_transfer(req); // UBus Protocol의 타이밍 및 신호 구동
			`uvm_info("MST_DRV", "DRIVER - Package Drive Check", UVM_MEDIUM)
			rsp = packet::type_id::create("rsp"); // 응답을 담을 rsp object를 factory에서 생성.
			rsp.copy(req); // req의 기본적인 field(addr, read/write 등)를 rsp에 복사. 이를 통해 sequencer는 rsp가 어떤 req에 대한 것인지 알 수 있음.
			rsp.set_id_info(req);
			seq_item_port.item_done(); // sequencer에 DUT에 대한 구동 완료되었음을 알림.
			seq_item_port.put_response(rsp); // 응답 transaction (rsp)를 sequencer에 전달.
		end
	endtask

	task drive_transfer(packet tr);
		// Address Phase //
		@(posedge vif.ubus_clock);
			vif.ubus_addr <= tr.addr;
			vif.ubus_write <= tr.write;
			vif.ubus_read <= tr.read;
			vif.ubus_size <= (tr.size == 1) ? 2'b00:
					(tr.size == 2) ? 2'b01:
					(tr.size == 4) ? 2'b10:
					(tr.size == 8) ? 2'b11:2'b00;
		// Data Phase //
			if(tr.write) begin
				for (int i =0; i<tr.size; i++) begin
					@(posedge vif.ubus_clock);	
						vif.ubus_write <= 0;
						vif.ubus_read <= 0;
						vif.ubus_size <= 'z;
						vif.ubus_addr <= 'z;
						vif.ubus_data <= tr.data[i];
						vif.ubus_bip <= (i == tr.size-1)? 0 : 1;
				end
			end else if (tr.read) begin
				if (tr.data.size() != tr.size) tr.data = new[tr.size];
				for ( int i = 0; i < tr.size: i++) begin
					@(posedge vif.ubus_clock);
						vif.ubus_write <= 0;
						vif.ubus_read <= 0;
						vif.ubus_size <= 'z;
						vif.ubus_addr <= 'z;
						tr.data[i] = vif.ubus_data;
				end
			end

			// Deassert //
			@(posedge vif.ubus_clock);
			vif.ubus_data <= 'z;
	endtask
endclass