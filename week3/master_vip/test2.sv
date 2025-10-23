module test2 ;
	ubus_if vif();
	initial vif.ubus_clock = 0;
	always #5 vif.ubus_clock = ~vif.ubus_clock;

endmodule
