module ubus_tb_top;
	import uvm_pkg::*;
	import ubus_pkg::*;

	ubus_if vif();

	initial vif.clk = 0;
	always #5 vif.clk = ~vif.clk;

	initial begin
		$fsdbDumpfile("ubus_test.fsdb");
		$fsdbDumpvars(0, ubus_tb_top);
	end

	initial begin
		uvm_config_db#(virtual ubus_if)::set(null, "*", "vif", vif);
		run_test();
	end
endmodule: ubus_tb_top
