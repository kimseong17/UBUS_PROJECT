module slave_tb_top;
	import uvm_pkg::*;
	import slave_pkg::*;

	slave_if vif();

	initial vif.clk = 0;
	always #5 vif.clk = ~vif.clk;

	initial begin
		$fsdbDumpfile("slave_test.fsdb");
		$fsdbDumpvars(0, slave_tb_top);
	end

	initial begin
		uvm_config_db#(virtual slave_if)::set(null, "*", "vif", vif);
		run_test();
	end
endmodule: slave_tb_top
