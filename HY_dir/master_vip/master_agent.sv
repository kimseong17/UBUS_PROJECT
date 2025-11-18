class master_agent extends uvm_agent;
	`uvm_component_utils(master_agent);

	master_sequencer sequencer;
	master_driver driver;
	master_monitor monitor;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
	endfunction: new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		sequencer = master_sequencer::type_id::create("sequencer", this);
		driver = master_driver::type_id::create("driver", this);
		monitor = master_monitor::type_id::create("monitor", this);
	endfunction: build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
		driver.seq_item_port.connect(sequencer.seq_item_export);
	endfunction: connect_phase
endclass: master_agent
