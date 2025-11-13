class ubus_virtual_sequence_test extends uvm_test;

	`uvm_component_utils(ubus_virtual_sequence_test)
	
	my3_vip_environment env;
	ubus_virtual_sequence virtual_sequence;

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = my3_vip_environment::type_id::create("env",this);

		uvm_config_db#(uvm_object_wrapper)::set(this, "env.virtual_sequencer.main_phase", "default_sequence", ubus_virtual_sequence::type_id::get()); //Factory가 관리하는 클래스 타입에 대한 정보(메타데이터)를 제공하는 핸들
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.virtual_sequencer.m_sequencer.main_phase", "default_sequence", ubus_master_write_word_seq::type_id::get());
		uvm_config_db#(uvm_object_wrapper)::set(this, "env.virtual_sequencer.m_sequencer.main_phase", "default_sequence", ubus_master_read_word_seq::type_id::get());

 
		uvm_config_db#(uvm_object_wrapper)::set(this,"env.s_agent.sequencer.main_phase","default_sequence", slave_sequence::type_id::get());
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
			//ubus_virtual_sequence seq_h;
			//virtual_sequence = ubus_virtual_sequence::type_id::create("virtual_sequence");

			//s_seq = slave_sequence::type_id::create("s_seq");
    			//s_seq.start(env.s_agent.sequencer);
			//virtual_sequence.start(env.virtual_sequencer);

			#1000ns;
		phase.drop_objection(this);
	endtask

endclass
