#vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 packet.sv my3_vip_environment.sv  my3_vip_test.sv my3_testbench_top.sv

#vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-ieee-2020 ../master_vip/ubus_if.sv \
#../vip/my3_master_testbench_top.sv +UVM_VERBOSITY=UVM_HIGH \ 


vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 ../my3_vip/ubus_if.sv ../my3_vip/my3_testbench_top.sv

# uvm-ieee-2020

./simv +UVM_TESTNAME=ubus_write_test -l simv.log +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE 


#../master_vip/test.sv
