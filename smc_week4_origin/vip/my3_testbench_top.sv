module my3_testbench_top;

    import uvm_pkg::*;
    `include "../master_vip/packet.sv"
    `include "../vip/my3_vip_environment.sv"
    `include "../vip/my3_vip_test.sv"
    
    // Interface Instance
    ubus_if vif();
    // Clock Generation
    initial vif.ubus_clock = 0;
    always #5 vif.ubus_clock = ~vif.ubus_clock;

    uvm_config_db#(virtual ubus_if)::set(null,"*","vif",vif);
    // 구성요소: context, inst_name , field_name, vif
    // null-> root에서 시작 , hierarchy의 모든 component에 적용, component에서 get할 때 사용 , 실제 interface instance 

	

    initial begin 

        run_test();

    end

endmodule
