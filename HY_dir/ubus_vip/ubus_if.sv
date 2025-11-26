interface ubus_if;
	logic	clk;
	logic	rst;
	logic [15:0]	addr;
	logic [1:0]	size;
	logic	read;
	logic	write;
	logic	bip;
	wire logic [7:0]	data;
	logic	wait_state;
	logic	error;
endinterface: ubus_if
