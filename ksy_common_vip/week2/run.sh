vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 my3_testbench_top.sv +UVM_VERBOSITY=UVM_HIGH \

./simv +UVM_TESTNAME=my3_vip_test -l simv.log +UVM_VERBOSITY=UVM_HIGH
