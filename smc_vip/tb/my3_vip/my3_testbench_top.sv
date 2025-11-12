`timescale 1ns/1ps
module my3_testbench_top;
    // UVM Package Import //
    import uvm_pkg::*;
    import pkg_agent::*;
    import pkg_env::*;
    import pkg_test::*;

    // Interface //
    ubus_if vif();

    // Clock Generation //
    initial vif.ubus_clock = 0;
    always #5 vif.ubus_clock = ~vif.ubus_clock;
    
    // Transaction # set //
    int num_transactions = 10;
	
    // Start Simulation //
    initial begin 
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars(0, my3_testbench_top);
        $value$plusargs("COUNT=%d", num_transactions);
        $display("[TB_TOP] Plusarg COUNT = %d", num_transactions);
        uvm_config_db#(virtual ubus_if.MASTER)::set(null, "*", "vif", vif.MASTER);
        uvm_config_db#(virtual ubus_if.SLAVE)::set(null, "*", "vif", vif.SLAVE);
        uvm_config_db#(int)::set(null, "*", "num_transactions", num_transactions);
        run_test();
    end
endmodule
