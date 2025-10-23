vcs -full64 -sverilog -lca -debug_access+all+reverse -kdb -l comp.log -ntb_opts uvm-1.2 my3_tb_top.sv  +UVM_VERBOSITY=UVM_HIGH \

./simv +UVM_TESTNAME=ubus_example_base_test  -l simv.log +UVM_VERBOSITY=UVM_HIGH
