module my3_master_testbench_top;

    import uvm_pkg::*;
    
   // `include "../master_vip/ubus_if.sv"   
    `include "../../master_vip/packet.sv"
    `include "../../master_vip/master_monitor.sv"
    `include "../../master_vip/master_driver.sv"
    `include "../../master_vip/master_sequencer.sv"
    `include "../../master_vip/master_agent.sv"
    `include "../../master_vip/master_sequence.sv"
    `include "../../master_vip/my3_vip_master_environment.sv"
    `include "../../master_vip/my3_vip_master_test.sv"
    

    // Interface Instance
    ubus_if vif();
    // Clock Generation
    initial vif.ubus_clock = 0;
    always #5 vif.ubus_clock = ~vif.ubus_clock;
    
    
    //uvm_config_db#(virtual ubus_if)::set(null,"*","vif",vif);
    // 구성요소: context, inst_name , field_name, vif
    // null-> root에서 시작 , hierarchy의 모든 component에 적용, component에서 get할 때 사용 , 실제 interface instance 

    //test2 tb_if();
    //virtual ubus_if vif;	

    initial begin 
	//vif = tb_if.vif;
	uvm_config_db#(virtual ubus_if)::set(null,"*","vif",vif);
        run_test();

    end

endmodule
