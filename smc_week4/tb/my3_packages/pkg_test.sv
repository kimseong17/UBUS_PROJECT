package ubus_test_pkg;
    import uvm_pkg::*;
    import ubus_agent_pkg::*;
    import ubus_env_pkg::*;

    // Test Collection //
    `include "../test_collection/ubus_master_test.sv"
    `include "../test_collection/ubus_slave_test.sv"
    `include "../test_collection/ubus_write_test.sv"
    `include "../test_collection/ubus_read_test.sv"
endpackage
