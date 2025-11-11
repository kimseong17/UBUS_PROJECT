class packet extends uvm_sequence_item;

    // Key Fields //
    rand bit [15:0] addr;
    rand bit read;
    rand bit write;
    rand bit [3:0] size;
    rand bit [7:0] data[];
    rand bit wait_state[];
    rand bit error;

    // Constructor //
    function new(string name = "packet");
        super.new(name);
    endfunction

    // Constraint //
    constraint c_wait_state { wait_state.size() inside{[0:2]};}
    constraint c_size       { size inside{1,2,4,8};}

    // UVM Macro Registration
    `uvm_object_utils_begin(packet)
        `uvm_field_int(addr, UVM_DEFAULT)
        `uvm_field_int(read, UVM_DEFAULT)
        `uvm_field_int(write, UVM_DEFAULT)
        `uvm_field_int(size, UVM_DEFAULT)
        `uvm_field_array_int(data, UVM_DEFAULT)
        `uvm_field_int(error, UVM_DEFAULT)
        `uvm_field_array_int(wait_state, UVM_DEFAULT)
    `uvm_object_utils_end


endclass: packet

