class slave_sequence extends uvm_sequence #(packet);
	`uvm_object_utils(slave_sequence)
	
	`uvm_declare_p_sequencer(slave_sequencer)

	packet req;
	packet rsp;
	
	function new(string name = "slave_sequence");
		super.new(name);
		req = packet::type_id::create("req");
		rsp = packet::type_id::create("rsp");
		
	endfunction


	task body(); //sequence는 body에 run_phase 코드를 작성
		
		forever begin
			p_sequencer.request_fifo.get(req);
			req.print();
			start_item(req);  // ready to transfer
			//`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)
			finish_item(req);
                        //`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)


		end
		//`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)
	endtask	

endclass 
