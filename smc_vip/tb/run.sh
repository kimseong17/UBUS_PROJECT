
vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 ../my3_vip/ubus_if.sv ../my3_vip/my3_testbench_top.sv

# uvm-ieee-2020

./simv +UVM_TESTNAME=ubus_write_test -l simv.log +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE 


#../master_vip/test.sv

