class slave_agent extends uvm_agent;
	`uvm_component_utils(slave_agent);

	slave_sequencer sequencer;
	slave_driver driver;
	slave_monitor monitor;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		sequencer = slave_sequencer::type_id::create("sequencer", this);
		driver = slave_driver::type_id::create("driver", this);
		monitor = slave_monitor::type_id::create("monitor", this);
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		driver.seq_item_port.connect(sequencer.seq_item_export);
		monitor.item_collected_port.connect(sequencer.request_fifo.analysis_export); // 포트 연결 
	endfunction: connect_phase
endclass: slave_agent
