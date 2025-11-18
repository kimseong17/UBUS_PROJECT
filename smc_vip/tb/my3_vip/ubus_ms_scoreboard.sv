class ubus_ms_scoreboard extends ubus_scoreboard;
    // UVM Factory //
    `uvm_analysis_imp_decl(_before)
    `uvm_analysis_imp_decl(_after)
    `uvm_component_utils_begin(ubus_ms_scoreboard)
        `uvm_field_int(num_writes, UVM_DEFAULT|UVM_DEC)
        `uvm_field_int(num_reads, UVM_DEFAULT|UVM_DEC)
    `uvm_component_utils_end

    // Create System //
    uvm_analysis_imp_before #(packet, ubus_ms_scoreboard) ms_master_export;
    uvm_analysis_imp_after  #(packet, ubus_ms_scoreboard) ms_slave_export;
    packet_cmp comparator;
    uvm_tlm_analysis_fifo#(packet) before_fifo; // master
    uvm_tlm_analysis_fifo#(packet) after_fifo;  // slave

    // Counter //
    protected int unsigned m_matches, m_mismatches;
    protected int unsigned m_mem_expected[int unsigned];

    // Constructor //
    function new(string name, uvm_component parent);
        super.new(name, phase)
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction

    // Component Creation & Configurtation //
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        ms_master_export = new("ms_master_export", this);
        ms_slave_export  = new("ms_slave_export", this);
        
        comparator = packet_cmp::type_id::create("comparator", this);
        
        before_fifo = new("before_fifo", this);
        after_fifo  = new("after_fifo", this);
    endfunction

    // Connect Phase //
    virtual function void connect_phase(uvm_phase phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        before_export.connect(ms_master_export);
        after_export.connect(ms_slave_export);
    endfunction: connect_phase

    // Function Callback //
    // MASTER Packet //
    virtual function void write_before(packet trans);
        `uvm_info("SCOREBOARD - MASTER", $sformatf("Received packet addr=0x%h, data=0x%p", trans.addr, trans.data), UVM_MEDIUM)
        comparator.before_export.write(trans);
        for (int i = 0; i < trans.size; i++) begin
            int unsigned addr = trans.addr + i;
            int unsigned data = trans.data[i];
            if (trans.write) begin
                num_writes = num_writes + 1;
                `uvm_info("SCOREBOARD", $sformatf("MASTER write: addr=0x%h, data=0x%p", addr, data), UVM_MEDIUM)
            end
        end
    endfunction 
    // SLAVE Packet //
    virtual function void write_after(packet trans);
        `uvm_info("SCOREBOARD - SLAVE", $sformatf("Received packet addr=0x%h, data0x%p", trans.addr, trans.data), UVM_MEDIUM)
        comparator.after_export.write(trans);
        for (int i = 0; i < trans.size; i++) begin
            int unsigned addr = trans.addr + i;
            int unsigned data = trans.data[i];
            if (trans.write) begin
                `uvm_info("SCOREBOARD", $sformatf("SLAVE written: addr=0x%h, data=0x%p", addr, data), UVM_MEDIUM)
            end
            if (trans.read) begin
                num_reads = num_reads + 1;
                if (m_mem_expected.exists(addr)) begin
                    assert(m_mem_expected[addr] == data) else  
                    `ucm_error("SCOREBOARD", $sformatf("Data mismatch at addr=0x%0h! expected=0x%0h, got=0x%0h", addr, m_mem_expected[addr], data));
                end else begin
                    m_mem_expected[addr] = data;
                end
                `uvm_info("SCOREBOARD", $sformatf("Slave read: addr=0x%0h, data=0x%0h", addr, data), UVM_LOW)
            end
        end
    endfunction 
    
    virtual function void report_phase
        `uvm_info("SCOREBOARD", $sformatf("Final Report: %0d writes, %0d reads" , num_writes, num_reads), UVM_LOW)
		`uvm_info("SCOREBOARD", $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches), UVM_LOW)
    endfunction

endclass