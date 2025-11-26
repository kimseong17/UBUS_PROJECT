interface apb_interface(input logic pclk, presetn);
parameter RW_REGION = 8;
parameter DATA_WIDTH=32;

logic [RW_REGION-1:0] paddr;
logic pselx;
logic penable;
logic pwrite;
logic [DATA_WIDTH-1:0] pwdata;
logic pready;
logic [DATA_WIDTH-1:0] prdata;
logic pslverr;


endinterface