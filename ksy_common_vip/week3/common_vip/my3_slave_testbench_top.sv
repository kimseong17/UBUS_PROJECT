module my3_slave_testbench_top;

    import uvm_pkg::*;
    
   // `include "../master_vip/ubus_if.sv"   
    `include "../slave_vip/packet.sv"
    `include "../slave_vip/slave_monitor.sv"
    `include "../slave_vip/slave_driver.sv"
    `include "../slave_vip/slave_sequencer.sv"
    `include "../slave_vip/slave_agent.sv"
    `include "../slave_vip/slave_sequence.sv"
    `include "../slave_vip/my3_vip_slave_environment.sv"
    `include "../slave_vip/my3_vip_slave_test.sv"
    

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
	$fsdbDumpfile("wave.fsdb");
	$fsdbDumpvars(0, my3_slave_testbench_top);
	

	uvm_config_db#(virtual ubus_if)::set(null,"*","vif",vif);
        run_test();

    end

endmodule
