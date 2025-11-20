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

modport dut_if (input pclk , presetn, paddr, pselx, penable , pwrite, pwdata, output pready ,prdata, pslverr);
modport tb_if (input pclk , presetn, pready, prdata, pslverr, output paddr, pselx, penable, pwrite, pwdata);
 
clocking cb @(posedge pclk);

default input #1ns output #1ns;
input pready;
input prdata;
input pslverr;
output paddr;
output pselx;
output penable;
output pwrite;
output pwdata;

endclocking

endinterface
