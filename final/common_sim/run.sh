#vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-ieee-2020 ../master_vip/ubus_if.sv \
#../vip/my3_master_testbench_top.sv +UVM_VERBOSITY=UVM_HIGH \ 

TEST_NAME=${1:-ubus_read_test}

vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 ../common_vip/ubus_if.sv \
../common_vip/my3_testbench_top.sv  \

# uvm-ieee-2020

./simv +UVM_TESTNAME=$TEST_NAME -l simv.log +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE 


#../master_vip/test.sv
