# ============================
# User Configurable Variables
# ============================

TEST_NAME ?= ubus_write_word_test
N_REPEAT ?= 4
SEED ?= 

UVM_VER = uvm-1.2

SRC_PATH = /DATA/home/edu010/3team/ksy_common_vip/week4/common_vip
TOP      = $(SRC_PATH)/my3_testbench_top.sv
IF       = $(SRC_PATH)/ubus_if.sv

LOG = simv.log

# ============================
# Compile options
# ============================

VCS_FLAGS = -full64 -sverilog -lca -debug_access+all+reverse \
            -kdb -l comp.log -ntb_opts $(UVM_VER)

# ============================
# Default Target
# ============================

all: simv run

# ============================
# Compile
# ============================

simv:
	vcs $(VCS_FLAGS) $(IF) $(TOP)

# ============================
# Run Simulation
# ============================

run:
	./simv +UVM_TESTNAME=$(TEST_NAME) +N_REPEAT=$(N_REPEAT) \
	       +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE \
	       -l $(LOG)

# ============================
# Random seed run
# ============================



ifeq ($(SEED),)
RANDOM_OPT = +ntb_random_seed_automatic
else
RANDOM_OPT = +ntb_random_seed=$(SEED)
endif

random:
	./simv +UVM_TESTNAME=$(TEST_NAME) +N_REPEAT=$(N_REPEAT) \
	       $(RANDOM_OPT) +ntb_random_seed_verbose \
	       +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_VERDI_TRACE \
	       -l $(LOG)


# ============================
# Cleanup
# ============================

clean:
	rm -rf simv simv.daidir csrc *.log *.vpd *.key DVE* verdi* *.fsdb *.hvp .vcs* vc* novas* fsdbData.db

verdi:
	verdi -ssf wave.fsdb -simv simv
