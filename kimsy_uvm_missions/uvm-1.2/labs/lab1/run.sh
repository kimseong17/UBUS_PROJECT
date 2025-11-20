#vcs -full64 -sverilog -debug_access+all+reverse -kdb +vcs+vcdpluson -timescale=1ns/100ps \
#-l comp.log -ntb_opts uvm-1.2 ./test.sv +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR+ \

vcs -full64 -sverilog -debug_access+all+reverse -kdb -timescale=1ns/100ps \
-l comp.log -ntb_opts uvm-1.2 test.sv \

# run Simulation
# ./simv +ntb_random_seed=1 -l simv.log +UVM_TESTNAME=test_base +UVM_VERBOSITY=UVM_MEDIUM +UVM_TR_RECORD +UVM_LOG_RECORD

./simv -l simv.log +UVM_TESTNAME=test_base 




