class master_sequencer extends uvm_sequencer #(packet);

	`uvm_component_utils(master_sequencer)
	
	function new(string name = "master_sequencer" , uvm_component parent);
		super.new(name,parent);
	endfunction

	/*virtual task run_phase(uvm_phase phase);
        	uvm_sequence_base default_seq;
    		uvm_object_wrapper seq_type;

    	// default_sequence 타입을 가져오기
    		if (uvm_config_db#(uvm_object_wrapper)::get(this, "", "default_sequence", seq_type)) begin
      		  uvm_object obj = seq_type.create("default_seq");
			default_seq = uvm_sequence_base::type_id::cast(seq_type.create_object("default_seq"));
      			default_seq.start(this);  // sequencer에 연결된 상태에서 실행
		
			
 		
		end
    		else begin
      			`uvm_info("SEQ", "No default_sequence set for this sequencer", UVM_LOW)
    		end
  	endtask*/

/*	virtual task run_phase(uvm_phase phase);
    		uvm_sequence_base default_seq;
    		uvm_object_wrapper seq_type;

    		if (uvm_config_db#(uvm_object_wrapper)::get(this, "", "default_sequence", seq_type)) begin
      			default_seq = seq_type.create_object("default_seq");
    			if ($cast(default_seq, default_seq)) begin
        		default_seq.start(this);
     			 end
    		end 


		if (uvm_config_db#(uvm_object_wrapper)::get(this, "", "default_sequence", seq_type)) begin
    			uvm_object obj;
    			obj = seq_type.create_object("default_seq"); // uvm_object로 받기
   			if ($cast(default_seq, obj)) begin          // uvm_sequence_base로 다운캐스팅
       	 			default_seq.start(this);
    			end else begin
        			`uvm_error("SEQ_CAST","Cannot cast object to uvm_sequence_base")
   			end
		end else begin
    			`uvm_info("SEQ","No default_sequence set", UVM_LOW)
		end
 	 endtask */

endclass
