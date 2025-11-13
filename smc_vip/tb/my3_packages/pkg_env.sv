package pkg_env;
  import uvm_pkg::*;
  import pkg_agent::*;

  // Master Environment //
  `include "../master_vip/master_env.sv"
  `include "../slave_vip/slave_env.sv"
  `include "../tb/my3_vip/ubus_scoreboard.sv"
  `include "../tb/my3_vip/my3_vip_environment.sv"
endpackage
