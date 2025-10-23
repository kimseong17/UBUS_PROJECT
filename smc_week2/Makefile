# Makefile for UVM week2

test = my3_vip_test
program_path = .
PROGRAM_TOP = ${program_path}/my3_testbench_top.sv
package_path = .
PACKAGES = ${package_path}/test_pkg.sv
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
#trace = UVM_OBJECTION_TRACE

# Set default 64bit!
CES64 = TRUE

compile_switches = -sverilog -lca -debug_access+all+reverse -kdb +vcs+vcdpluson -timescale="1ns/100ps" -l comp.log -ntb_opts ${uvm_ver} ${TEST_TOP} +define+${uvm_defines}+${defines} 
runtime_switches = -l ${log} +UVM_TESTNAME=${test} +UVM_VERBOSITY=${verbosity} +${plus} +${trace} +${option}

all: simv run

simv compile: *.sv ${TEST_TOP}
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
