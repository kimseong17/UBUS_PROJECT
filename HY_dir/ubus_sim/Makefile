TEST = ubus_test

build:
	vcs -full64 -debug_acc+all -sverilog -timescale=1ns/1ps \
	-ntb_opts uvm-1.2 -l compile.log \
	../ubus_vip/ubus_if.sv \
	./ubus_pkg.sv \
	../ubus_vip/ubus_tb_top.sv

run:
	./simv +UVM_TESTNAME=$(TEST) -l simulation.log

all: build run
