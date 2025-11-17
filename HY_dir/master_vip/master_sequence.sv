class master_sequence extends uvm_sequence #(ubus_transfer);
	`uvm_object_utils(master_sequence)

	function new(string name = "master_sequence");
		super.new(name);
	endfunction: new

	task body();
		ubus_transfer tr;
		repeat (10) begin
			tr = ubus_transfer::type_id::create("tr");
			assert(tr.randomize());
			start_item(tr);
			finish_item(tr);
			get_response(tr);
		end
		`uvm_info("SEQ", $sformatf("Randomized tr: %s", tr.sprint()), UVM_LOW)
	endtask: body
endclass: master_sequence
