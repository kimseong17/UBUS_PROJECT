#vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-ieee-2020 ../master_vip/ubus_if.sv \
#../vip/my3_master_testbench_top.sv +UVM_VERBOSITY=UVM_HIGH \ 


vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-ieee-2020 /DATA/home/edu010/3team/ksy_common_vip/week3/master_vip/ubus_if.sv \
/DATA/home/edu010/3team/ksy_common_vip/week3/common_vip/my3_master_testbench_top.sv +UVM_VERBOSITY=UVM_HIGH \ 



./simv +UVM_TESTNAME=my3_vip_master_test -l simv.log +UVM_VERBOSITY=UVM_HIGH


#../master_vip/test.sv
