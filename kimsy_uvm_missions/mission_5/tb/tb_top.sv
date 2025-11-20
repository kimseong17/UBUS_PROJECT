module tb_top;

    logic pclk, presetn;
    parameter clk_period = 10;
    parameter pre_reset = 5;

    always #(clk_period/2) pclk = ~pclk;

    initial begin
        pclk =1;
        presetn=1;

        #(pre_reset) presetn=0;
        #(2*clk_period) presetn=1;

    end

    apb_interface apb_if (.pclk(pclk), .presetn(presetn));
    test_prog prog(.pclk(pclk), .presetn(presetn), .apb_if(apb_if));

    apb_completer u0 (
    .pclk    (pclk),
    .presetn (presetn),
    .pselx   (apb_if.pselx),
    .penable (apb_if.penable),
    .pwrite  (apb_if.pwrite),
    .pwdata  (apb_if.pwdata),
    .pready  (apb_if.pready),
    .prdata  (apb_if.prdata),
    .paddr(apb_if.paddr),
    .pslverr (apb_if.pslverr)
  );
  
	initial begin
	$fsdbDumpfile("sim.fsdb");
	$fsdbDumpvars(tb_top);
	end
    


endmodule
