module my3_testbench_top;
    //`include "uvm_macros.svh" 
    import uvm_pkg::*;
    `include "../common_vip/packet.sv"
    `include "../common_vip/ubus_scoreboard.sv"
   
    `include "../master_vip/master_monitor.sv"
    `include "../master_vip/master_driver.sv"
    `include "../master_vip/master_sequencer.sv"
    `include "../master_vip/master_agent.sv"
   
  
    `include "../slave_vip/slave_monitor.sv"
    `include "../slave_vip/slave_driver.sv"
    `include "../slave_vip/slave_sequencer.sv"
    `include "../slave_vip/slave_agent.sv"
    
    `include "../common_vip/master_sequence.sv"
    `include "../common_vip/slave_sequence.sv"
    `include "../common_vip/ubus_master_write_word_seq.sv"
    `include "../common_vip/ubus_master_read_word_seq.sv"
    `include "../common_vip/my3_vip_environment.sv"

    `include "../common_vip/ubus_write_test.sv"

    // Interface Instance
    ubus_if vif();
    // Clock Generation
    initial vif.ubus_clock = 0;
    always #5 vif.ubus_clock = ~vif.ubus_clock;

    //uvm_config_db#(virtual ubus_if)::set(null,"*","vif",vif);
    // 구성요소: context, inst_name , field_name, vif
    // null-> root에서 시작 , hierarchy의 모든 component에 적용, component에서 get할 때 사용 , 실제 interface instance 

	

    initial begin 
	$fsdbDumpfile("wave.fsdb");
	$fsdbDumpvars(0, my3_testbench_top);
	
	uvm_config_db#(virtual ubus_if.MASTER)::set(null,"*","vif",vif.MASTER);
	uvm_config_db#(virtual ubus_if.SLAVE)::set(null,"*","vif",vif.SLAVE);
        run_test();

        /*forever @(posedge vif.ubus_clock) begin
			$display("[%0t] Clock tick", $time);
	end*/
    end


endmodule
