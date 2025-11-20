class ubus_virtual_sequence extends uvm_sequence;
    // UVM Factory //
	`uvm_object_utils(ubus_virtual_sequence)

    // Type-Safe q_sequencer Declaration //
	`uvm_declare_p_sequencer(ubus_virtual_sequencer)

    // Create Environment //
	ubus_master_write_word_seq  m_write_word_seq; 
	ubus_master_read_word_seq   m_read_word_seq;
    incr_read_byte_seq          m_incr_read_seq;
    incr_write_byte_seq         m_incr_write_seq;
    incr_read_write_read_seq    m_incr_rwr_seq;
    read_modify_write_seq       m_rmw_seq;
    ubus_slave_sequence         s_slave_seq;

    // Constructor //

endclass