# Makefile for UVM

test = ubus_read_test
program_path = ../tb/my3_vip
PROGRAM_TOP = ${program_path}/my3_testbench_top.sv
package_path = ../tb/my3_packages
PACKAGES = ${package_path}/pkg_agent.sv ${package_path}/pkg_env.sv ${package_path}/pkg_test.sv 
TEST_TOP = ${PACKAGES} ${PROGRAM_TOP}
log = simv.log
verbosity = UVM_HIGH
uvm_ver = uvm-1.2
seed = 1
defines =
uvm_defines = UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR
plus = 
option = UVM_TR_RECORD +UVM_LOG_RECORD
trace =
rtl_path = ../tb/my3_vip
DUT = $(rtl_path)/ubus_if.sv
# Set default 64bit!
CES64 = TRUE
COUNT ?= 10

compile_switches = -sverilog -q -lca -debug_access+all+reverse -kdb +vcs+vcdpluson -timescale="1ns/100ps" -l comp.log -ntb_opts ${uvm_ver} ${DUT} ${TEST_TOP} +define+${uvm_defines}+${defines}
runtime_switches = -l ${log} +UVM_TESTNAME=${test} +UVM_VERBOSITY=${verbosity} +${plus} +${trace} +${option} +COUNT=${COUNT} 

all: clean simv run

simv compile: ../tb/test_collection/*.sv ${TEST_TOP} ${DUT}
ifeq ($(CES64),TRUE)
	vcs -full64 ${compile_switches} 
	@echo "Compiled in 64-bit mode"
else
	vcs ${compile_switches}
	@echo "Compiled in 32-bit mode"
endif

run:
	./simv +ntb_random_seed=${seed} ${runtime_switches}

random: simv
	./simv +ntb_random_seed_automatic ${runtime_switches}

verdi:
	verdi -ssf wave.fsdb &

original: copy

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key log *.h temp *.log .vcs* *.txt DVE* *.hvp urg* .inter.vpd.uvm .restart* .synopsys* novas.* *.dat *.fsdb verdi*

help:
	@echo =======================================================================
	@echo  " 								       "
	@echo  " USAGE: make target <seed=xxx> <verbosity=YYY> <test=ZZZ>              "
	@echo  " 								       "
	@echo  "  xxx is the random seed.  Can be any integer except 0. Defaults to 1  "
	@echo  "  YYY sets the verbosity filter.  Defaults to UVM_MEDIUM               "
	@echo  "  ZZZ selects the uvm test.       Defaults to test_base                "
	@echo  " 								       "
	@echo  " ------------------------- Test TARGETS ------------------------------ "
	@echo  " all             => Compile TB and DUT files and run the simulation    "
	@echo  " uvm-1.1         => Compile TB and DUT files and run the simulation    "
	@echo  " uvm-1.2         => Compile TB and DUT files and run the simulation    "
	@echo  " compile         => Compile TB and DUT files                           "
	@echo  " run             => Run the simulation with seed                       "
	@echo  " random          => Run the simulation with random seed                "
	@echo  "                                                                       "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ------------------------- "
	@echo  " help       => Displays this message                                   "
	@echo  " clean      => Remove all intermediate simv and log files              "
	@echo  " nuke       => Remove all source code and debug files                  "
	@echo  " original   => Return content of lab back to original state            "
	@echo  " copy       => Copy all necessary files for starting lab               "
	@echo  " solution   => Copy files from solutions directory for lab             "
	@echo  "								       "
	@echo  " ---------------------- EMBEDDED SETTINGS -----------------------------"
	@echo  " -timescale=\"1ns/100ps\"                                              "
	@echo  " -debug_all                                                            "
	@echo =======================================================================
