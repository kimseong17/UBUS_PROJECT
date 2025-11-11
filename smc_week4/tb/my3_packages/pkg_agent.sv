package ubus_agent_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Interface //
    `include "../tb/my3_vip/packet.sv"

    // Master_VIP //
    `include "../../master_vip/master_sequencer.sv"
    `include "../../master_vip/master_monitor.sv"
    `include "../../master_vip/master_driver.sv"
    `include "../../master_vip/master_sequence.sv"
    `include "../../master_vip/ubus_master_write_word_seq.sv"
    `include "../../master_vip/ubus_master_read_word_seq.sv"
    `include "../../master_vip/master_agent.sv"

    // Slave_VIP //
    `include "../../slave_vip/slave_sequencer.sv"
    `include "../../slave_vip/slave_monitor.sv"
    `include "../../slave_vip/slave_driver.sv"
    `include "../../slave_vip/slave_sequence.sv"
    `include "../../slave_vip/slave_agent.sv"
endpackage
