package ubus_env_pkg;
  import uvm_pkg::*;
  import ubus_agent_pkg::*;

  // Master Environment //
  `include "../../master_vip/master_env.sv"
  `include "../../slave_vip/slave_env.sv"
  `include "../my3_vip/my3_vip_environment.sv"
endpackage
