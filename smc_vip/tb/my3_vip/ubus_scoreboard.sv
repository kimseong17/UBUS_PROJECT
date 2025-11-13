class ubus_scoreboard extends uvm_scoreboard;
	// UVM Factory //
	`uvm_component_utils_begin(ubus_scoreboard)
	`uvm_field_int(num_writes, UVM_DEFAULT|UVM_DEC)
	`uvm_field_int(num_reads, UVM_DEFAULT|UVM_DEC)
	`uvm_component_utils_end

	// Comparator Declaration //
	typedef uvm_in_order_class_comparator #(packet) packet_cmp;
	packet_cmp comparator;
	
	// UVM Analysis Port //
	uvm_analysis_export #(packet) master_export;
	uvm_analysis_export #(packet) slave_export;

	// Variable Declaration //
	protected int num_writes	= 0;
	protected int num_reads		= 0;
	protected int unsigned m_mem_expected[int unsigned];

	// Constructor //
	function new(string name , uvm_component parent);
		super.new(name, parent);
	endfunction

	// Component Creation & Configuration //
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		master_export	= new("master_export" , this);
		slave_export	= new("slave_export", this);
		comparator		= packet_cmp::type_id::create("comparator", this);
	endfunction

	// Connect Phase //
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		this.master_export.connect(comparator.before_export);
		this.slave_export.connect(comparator.after_export);
	endfunction

	
	virtual function string convert2string();
		return $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches);
	endfunction

	virtual task wait_for_done(); endtask
	virtual function void set_timeout(realtime timeout); endfunction
	virtual function realtime get_timeout(); endfunction


	// Function Callback //
	function void write(packet trans);
		memory_verify(trans);
	endfunction

	protected function void memory_verify(input packet trans);
		`uvm_info("SCOREBOARD", $sformatf("Received pkt addr=0x%0h, data0x%p", trans.addr, trans.data), UVM_MEDIUM)
		for (int i =0; i < trans.size; i++ ) begin
			int unsigned addr = trans.addr + i;
			int unsigned data = trans.data[i]; 
			if (trans.read) begin
				num_reads = num_reads + 1;
				if (m_mem_expected.exists(addr)) begin
					assert(m_mem_expected[addr] == data) else
					`uvm_error("SCOREBOARD", "Data mismatch!")
				end else begin
					m_mem_expected[addr] = data;
				end
			end
			if (trans.write) begin
				`uvm_info("SCOREBOARD", $sformatf("num_writes = %d" , num_writes) , UVM_LOW) 
				num_writes = num_writes +1;
				m_mem_expected[addr] = data;
			end
		end
	endfunction

	// Scoreboard Report //
	virtual function void report_phase(uvm_phase phase);
		`uvm_info("SCOREBOARD", $sformatf("Final Report: %0d writes, %0d reads" , num_writes, num_reads), UVM_LOW)
		`uvm_info("SCOREBOARD", $sformatf("Comparator Matches = %0d, Mismatches = %0d", comparator.m_matches, comparator.m_mismatches), UVM_LOW)
	endfunction

endclass

					
