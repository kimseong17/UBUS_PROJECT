module master_tb_top;
	import uvm_pkg::*;
	import master_pkg::*;

	ubus_if vif();

	initial vif.clk = 0;
	always #5 vif.clk = ~vif.clk;

	initial begin
		$fsdbDumpfile("master_test.fsdb");
		$fsdbDumpvars(0, master_tb_top);
	end

	initial begin
		uvm_config_db#(virtual ubus_if)::set(null, "*", "vif", vif);
		run_test();
	end
endmodule: master_tb_top
