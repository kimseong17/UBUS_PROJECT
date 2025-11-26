
#rm -rf csrc *.log simv.daidir ucli.key verdi_config_file verilog_sim.* simv

#vcs -full64 -sverilog -lca -debug_access+all -kdb +vcs+vcdpluson -timescale=1ns/100ps \
#-l comp.log -ntb_opts uvm-1.2 ../../rtl/router.sv ../../rtl/router_io.sv ../../rtl/ral/host_io.sv \
#../../rtl/reset_io.sv ../../rtl/router_test_top.sv ./packages/router_stimulus_pkg.sv \
#./packages/router_env_pkg.sv ./packages/router_test_pkg.sv ./test.sv +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR+UVM_VERDI_COMPWAVE+

# run Simulation
#./simv +ntb_random_seed=1 -l simv.log +UVM_TESTNAME=test_base +UVM_VERBOSITY=UVM_MEDIUM +UVM_VEDI_TRACE=COMPWAVE +UVM_VERDI_TRACE=HIER + +UVM_TR_RECORD +UVM_LOG_RECORD



echo ">>> Cleaning previous build files..."
rm -rf simv simv.daidir csrc *.log *.vpd *.fsdb verdiLog
echo ">>>Clean done!" 
