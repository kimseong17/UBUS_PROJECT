package pkg_test;
    import uvm_pkg::*;
    import pkg_agent::*;
    import pkg_env::*;

    // Test Collection //
    `include "../tb/test_collection/ubus_master_test.sv"
    `include "../tb/test_collection/ubus_slave_test.sv"
    `include "../tb/test_collection/ubus_write_test.sv"
    `include "../tb/test_collection/ubus_read_test.sv"
endpackage
