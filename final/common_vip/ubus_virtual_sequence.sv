class ubus_virtual_sequence extends uvm_sequence;
	`uvm_object_utils(ubus_virtual_sequence)
	`uvm_declare_p_sequencer(ubus_virtual_sequencer)


	ubus_master_write_word_seq m_write_word_seq; 
	ubus_master_read_word_seq m_read_word_seq;
	//slave_sequence s_seq;

	//slave_sequencer slave_seq;	
	//int n_repeat;
	
	function new(string name = "ubus_master_write_word_seq");
		super.new(name);
		//n_repeat=4;
		set_automatic_phase_objection(1);
	endfunction

	
	virtual task pre_body(); // body 태스크 실행 직전에 호출
        // 현재 시퀀스가 시작된 phase를 가져와 objection을 올립니다.
        	/*if (!uvm_config_db#(slave_sequencer)::get(this, "", "slave_seq", slave_seq))
        	`uvm_fatal("CONFIG", "Failed to get slave_done_evt")*/
		/*int val;
		if (!$value$plusargs("N_REPEAT=%d", val))
			n_repeat=4;
		else
			n_repeat=val;*/
	

        	/*uvm_phase starting_phase = get_starting_phase();
        	if (starting_phase != null) begin
           	 starting_phase.raise_objection(this);
       	 	end*/
    	endtask
	
	virtual task body();
		
		/*m_write_word_seq = ubus_master_write_word_seq::type_id::create("m_write_word_seq");
   		m_write_word_seq.start(p_sequencer.m_sequencer);*/
		`uvm_do_on(m_write_word_seq, p_sequencer.m_sequencer)
    		`uvm_info("abc" , "bcd" , "UVM_LOW")	
		`uvm_do_on(m_read_word_seq, p_sequencer.m_sequencer)


	endtask

	/*virtual task post_body(); // body 태스크 실행 직후에 호출
        // body가 완료되면 objection을 내려 시뮬레이션이 종료될 수 있도록 합니다.
        	uvm_phase starting_phase = get_starting_phase();
       		if (starting_phase != null) begin
            		starting_phase.drop_objection(this);
        	end
    endtask*/

endclass 
