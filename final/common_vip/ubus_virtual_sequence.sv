class ubus_virtual_sequence extends uvm_sequence;
	`uvm_object_utils(ubus_virtual_sequence)
	`uvm_declare_p_sequencer(ubus_virtual_sequencer)



	ubus_master_write_random_size_seq m_write_random_size_seq; 
	ubus_master_read_random_size_seq m_read_random_size_seq;
	ubus_master_write_low_seq write_low_seq;
	ubus_master_read_low_seq read_low_seq;
	ubus_master_write_mid_seq write_mid_seq;
	ubus_master_read_mid_seq read_mid_seq;
	ubus_master_write_high_seq write_high_seq;
	ubus_master_read_high_seq read_high_seq;

	
	function new(string name = "ubus_master_write_word_seq");
		super.new(name);

		set_automatic_phase_objection(1);
	endfunction

	
	
	virtual task body();
		

		`uvm_do_on(m_write_random_size_seq, p_sequencer.m_sequencer)
		`uvm_do_on(m_read_random_size_seq, p_sequencer.m_sequencer)

		/*`uvm_do_on(write_low_seq, p_sequencer.m_sequencer)
		`uvm_do_on(read_low_seq, p_sequencer.m_sequencer)
		`uvm_do_on(write_mid_seq, p_sequencer.m_sequencer)
		`uvm_do_on(read_mid_seq, p_sequencer.m_sequencer)
		`uvm_do_on(write_high_seq, p_sequencer.m_sequencer)
		`uvm_do_on(read_high_seq, p_sequencer.m_sequencer)*/



		repeat(3) @(posedge m_vif.ubus_clock);





	endtask

	/* virtual task post_body(); // body 태스크 실행 직후에 호출
        // body가 완료되면 objection을 내려 시뮬레이션이 종료될 수 있도록 합니다.
        	uvm_phase starting_phase = get_starting_phase();
       		if (starting_phase != null) begin
            		starting_phase.drop_objection(this);
        	end
    endtask */

endclass 
