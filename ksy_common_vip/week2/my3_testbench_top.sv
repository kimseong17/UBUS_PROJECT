module my3_testbench_top;

    import uvm_pkg::*;
    `include "packet.sv"
    `include "my3_vip_environment.sv"
    `include "my3_vip_test.sv"

    initial begin 

        run_test();

    end

endmodule
