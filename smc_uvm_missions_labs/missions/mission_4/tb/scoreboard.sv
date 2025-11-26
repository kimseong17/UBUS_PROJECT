class scoreboard;
    transaction scb_trx;
    transaction tr_array[$] = {};
    transaction temp_tr;

    int err_cnt = 0;
    int wr_cnt;

    mailbox #(transaction) scb_mbox;

    event gen_done, scb_done;
    
    task run();
	$display("[SCB] run() is started...");
	wr_cnt = 0;

	wait (gen_done.triggered);
	
	forever begin
	    scb_trx = new();
	    scb_mbox.get(scb_trx);
	    scb_trx.print("SCB");
	    
	    if (scb_trx.is_write) begin
		tr_array.push_back(scb_trx);
		wr_cnt++;
	    end else begin
		temp_tr = new();
		tr_array.push_back(scb_trx);
		temp_tr = tr_array.pop_front();
		if (temp_tr.data == scb_trx.data) begin
		    $display("[SCB] wr/rd transfer of addr %h with data %h checked", scb_trx.addr, scb_trx.data);
		end else begin
			$display("[SCB] wr/rd transfer of addr %h mismatch data checked\n pwdata : %h, prdata : %h", scb_trx.addr, temp_tr.data, scb_trx.data);
			err_cnt++;
		end
	    end
	    
	    if ((tr_array.size() == 0) && (wr_cnt != 0) && (!scb_mbox.try_peek(scb_trx))) begin
		break;
	    end
	end
	check();
    endtask

    function void check();
	$display("\n======= SIMULATION RESULT =======\n");

	if (err_cnt == 0)
	    $display("[SCB] Simulation PASS");
	else
	    $display("[SCB] Simulation FAIL, err_cnt : %d", err_cnt);
	-> scb_done;
    endfunction
endclass
