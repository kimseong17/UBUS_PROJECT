class environment;

    generator	gen;
    driver	drv;
    monitor	mon;

    function new(virtual apb_interface apb_if);
	gen = new();
	drv = new(apb_if);
	mon = new(apb_if);
    endfunction

    task run();
	$display("[ENV] run() is started...");
	gen.run();
	drv.run();
	mon.run();
    endtask

endclass
