class environment;

    generator	gen;
    driver	drv;
    monitor	mon;
    scoreboard	scb;
    mailbox #(transaction) tr_mbox, rd_mbox, scb_mbox;

    event gen_done, scb_done;

    function new(virtual apb_interface apb_if);
	gen = new();
	drv = new(apb_if);
	mon = new(apb_if);
	scb = new();
	
	tr_mbox = new();
	rd_mbox = new();
	scb_mbox = new();

	gen.tr_mbox = tr_mbox;
	drv.tr_mbox = tr_mbox;

	gen.rd_mbox = rd_mbox;
	drv.rd_mbox = rd_mbox;

	mon.scb_mbox = scb_mbox;
	scb.scb_mbox = scb_mbox;	

	gen.gen_done = gen_done;
	scb.gen_done = gen_done;

	scb.scb_done = scb_done;
    endfunction

    task run();
	$display("[ENV] run() is started...");
	fork
	    gen.run();
	    drv.run();
	    mon.run();
	    scb.run();
	join_any
	wait (scb_done.triggered);
	disable fork;
	$finish;
    endtask

endclass
