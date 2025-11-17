package ubus_pkg;
	import uvm_pkg::*;
	`include "../ubus_vip/ubus_transfer.sv"
//	`include "../ubus_vip/ubus_scoreboard.sv"

	`include "../master_vip/master_sequencer.sv"
	`include "../master_vip/master_driver.sv"
	`include "../master_vip/master_monitor.sv"
        `include "../ubus_vip/ubus_master_read_word_seq.sv"
	`include "../ubus_vip/ubus_master_write_word_seq.sv"
	`include "../master_vip/master_agent.sv"

	`include "../slave_vip/slave_sequencer.sv"
	`include "../slave_vip/slave_driver.sv"
	`include "../slave_vip/slave_monitor.sv"
	`include "../ubus_vip/ubus_slave_seq.sv"
	`include "../slave_vip/slave_agent.sv"

	`include "../ubus_vip/ubus_scoreboard.sv"
	`include "../ubus_vip/ubus_env.sv"
	`include "../ubus_vip/ubus_test.sv"
endpackage
