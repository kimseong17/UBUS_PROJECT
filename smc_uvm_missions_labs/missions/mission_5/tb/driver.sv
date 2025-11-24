class driver;
    virtual apb_interface vif;
    transaction drv_trx;
    
    mailbox #(transaction) tr_mbox;
    mailbox #(transaction) rd_mbox;

    function new(virtual apb_interface apb_if);
	this.vif = apb_if;
    endfunction

    task wr_sequence();
	@(vif.cb);
	vif.pselx = 1;
	@(vif.cb);
	vif.penable = 1; vif.pwrite = 1;
	vif.paddr = drv_trx.addr;
	vif.pwdata = drv_trx.data;

	wait (vif.pready);
	@(vif.cb);
	vif.pselx = 0; vif.penable = 0;
    endtask

    task rd_sequence();
	@(vif.cb);
	vif.pselx = 1;
	@(vif.cb);
	vif.penable=1; vif.pwrite=0;
	vif.paddr = drv_trx.addr;
	
	wait (vif.pready);
	@(vif.cb);
	drv_trx.data = vif.prdata;
	vif.pselx = 0; vif.penable = 0;
	rd_mbox.put(drv_trx);
    endtask

    task run();
	$display("[DRV] run() is started...");

	forever begin
	    drv_trx = new();
	    drv_trx.print("DRV");
	    tr_mbox.get(drv_trx);
	    if (drv_trx.is_write)
		wr_sequence();
	    else
		rd_sequence();
	end
    endtask
endclass
