class ubus_transfer extends uvm_sequence_item;
    rand bit [15:0] addr;
    rand bit read, write;
    rand bit [1:0] size;
    rand bit [7:0] data;
    rand bit wait_state[];
    rand bit error;

    function new(string name = "ubus_transfer");
	super.new(name);
    endfunction: new
    
    function void post_randomize();
	wait_state = new[size];
	foreach (wait_state[i]) begin
	    wait_state[i] = $urandom_range(0, 1);
	end
    endfunction: post_randomize

    `uvm_object_utils_begin(ubus_transfer)
	`uvm_field_int(addr, UVM_DEFAULT)
	`uvm_field_int(read, UVM_DEFAULT)
	`uvm_field_int(write, UVM_DEFAULT)
	`uvm_field_int(size, UVM_DEFAULT)
	`uvm_field_int(data, UVM_DEFAULT)
	`uvm_field_array_int(wait_state, UVM_DEFAULT)
	`uvm_field_int(error, UVM_DEFAULT)
    `uvm_object_utils_end

endclass







