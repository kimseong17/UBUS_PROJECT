class ubus_scoreboard extends uvm_scoreboard;

	`uvm_component_utils_begin(ubus_scoreboard)
	`uvm_field_int(num_writes, UVM_DEFAULT|UVM_DEC)
	`uvm_field_int(num_reads, UVM_DEFAULT|UVM_DEC)
	`uvm_component_utils_end

	uvm_analysis_imp#(packet, ubus_scoreboard) item_collected_export;

	protected int num_writes = 0;
	protected int num_reads =0;
	protected int unsigned m_mem_expected[int unsigned];

	function new(string name , uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		item_collected_export = new("item_collected_export" , this);
	endfunction

	function void write(packet trans);
		memory_verify(trans);
	endfunction

	protected function void memory_verify(input packet trans);
		//`uvm_info("SCOREbOARD1", $sformatf("tran.size=%b" , trans.size) , UVM_LOW) 
		for (int i =0; i < trans.size; i++ ) begin
			int unsigned addr = trans.addr + i;
			int unsigned data = trans.data[i];
			//`uvm_info("SCOREbOARD2", $sformatf("addr = %d , data = %d" , addr, data) , UVM_LOW) 
			if (trans.read) begin
				num_reads = num_reads +1;
				/*if (m_mem_expected.exists(addr)) begin
					assert(m_mem_expected[addr] == data) else
					`uvm_error("SCOREBOARD", "Data mismatch!")
				end else begin
					m_mem_expected[addr] = data;
				end*/
			end
			if (trans.write) begin
				//`uvm_info("SCOREbOARD3", $sformatf("num_writes = %d" , num_writes) , UVM_LOW) 
				num_writes = num_writes +1;
				m_mem_expected[addr] = data;
			end
		end
	endfunction


	virtual function void report_phase(uvm_phase phase);
		`uvm_info("SCOREBOARD", $sformatf("Final Report: %0d writes, %0d reads" , num_writes, num_reads), UVM_LOW)
	endfunction

endclass

					

