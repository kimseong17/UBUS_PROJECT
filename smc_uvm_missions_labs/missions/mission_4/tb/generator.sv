class generator;
    transaction gen_trx;
    transaction rd_trx;
    
    mailbox #(transaction) tr_mbox;
    mailbox #(transaction) rd_mbox;
    mailbox #(transaction) random_trx;

    event gen_done;
    parameter RW_REGION = 8;
    logic [RW_REGION-1:0] apb_addr_list[$];
    int num, repeat_val;

    task wr_gen();
	for(int i = 0; i < repeat_val; i++) begin
	    gen_trx = new();
	    `ifdef VCS
		if (!gen_trx.randomize() with {is_write == 0; addr inside {['h00:'h7F]};})
		    $display("[GEN] ERROR, randomization failed");
		`else
		    random_trx.is_write = 1;
		    random_trx.addr = $urandom_range(32`h00, 32`h7F);
		    random_trx.data = $urandom;
		`endif

	    tr_mbox.put(gen_trx);
	    gen_trx.print("GEN");
	    apb_addr_list.push_back(gen_trx.addr);
	end
    endtask

    task rd_gen();
	foreach (apb_addr_list[i]) begin
	    gen_trx = new();
	    rd_trx = new();
	    
	    `ifdef VCS
		if (!gen_trx.randomize() with {is_write == 1; addr == apb_addr_list[i];})
		$display("[GEN] ERROR, randomization failed");
	    `else
		gen_trx.is_write = 0;
		gen_trx.addr = apb_addr_list[i];
	    `endif

	    tr_mbox.put(gen_trx);
	    //gen_trx.print(gen_trx);
	    gen_trx.print("GEN");
	    rd_mbox.get(rd_trx);
	    $display("[GEN] wr/rd transfer of addr %h generation is done...", rd_trx.addr);
	end
    endtask

    task run();
	$display("[GEN] run ( ) is started...");

	if ($value$plusargs("num=%d", num)) begin
	    repeat_val = num;
	end else begin
	    repeat_val = 16;
	end

	wr_gen();
	rd_gen();
	-> gen_done;
    endtask

endclass
