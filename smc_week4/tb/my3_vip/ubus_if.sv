interface ubus_if;

	logic ubus_clock;
	logic ubus_reset;
	logic [15:0] ubus_addr;
	logic [1:0] ubus_size;
	logic ubus_read;
	logic ubus_write;
	logic ubus_bip;
	logic [7:0] ubus_data;
	logic ubus_wait;
	logic ubus_error;



    // master_driver용 포트
    modport MASTER (
        output ubus_addr,
        output ubus_size,
        output ubus_read,
        output ubus_write,
        output ubus_data,
	input ubus_clock,
        input  ubus_wait,
        output  ubus_bip,
        input  ubus_error
    );

    // slave_driver용 포트
    modport SLAVE (
	input ubus_clock,
        input  ubus_addr,
        input  ubus_size,
        input  ubus_read,
        input  ubus_write,	
        output  ubus_data,
        output ubus_wait,
        input ubus_bip,
        output ubus_error
    );



endinterface
