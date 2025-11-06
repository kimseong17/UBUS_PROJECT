class slave_agent extends uvm_agent;

	`uvm_component_utils(slave_agent)

	slave_sequencer sequencer;
	slave_driver driver;
	slave_monitor monitor;


	function new(string name = "slave_agent", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sequencer = slave_sequencer::type_id::create("sequencer",this);
		driver = slave_driver::type_id::create("driver",this);
		monitor = slave_monitor::type_id::create("monitor",this);
	endfunction


	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		driver.seq_item_port.connect(sequencer.seq_item_export); // component connection
		`uvm_info("DEBUG","Connecting driver.seq_item_port to sequencer.seq_item_export", UVM_LOW)
		monitor.item_collected_port.connect(sequencer.request_fifo.analysis_export);		

	endfunction

endclass
