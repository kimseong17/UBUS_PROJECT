class scoreboard;

mailbox #(transaction) scb_mbox;
transaction scb_trx;
transaction temp_tr;
transaction tr_array[$] = {};

int err_cnt = 0;
int wr_cnt;
event gen_done, scb_done;


task run();
$display("...");
wait (gen_done.triggered);

wr_cnt = 0;

$display("[SCB] run() is started...");

forever begin
scb_trx = new();
scb_mbox.get(scb_trx);

scb_trx.print("SCB");


if (scb_trx.is_write)
tr_array.push_back(scb_trx);
else begin
	if(!scb_trx.pslverr) begin
		temp_tr = tr_array.pop_front();
		if (temp_tr.data == scb_trx.data)
			$display("...", scb_trx.addr, scb_trx.data);
		else begin
			$display("scb.addr=%h,temp_tr.data= %h,scb_trx.data= %h", scb_trx.addr, temp_tr.data, scb_trx.data);
			err_cnt++;
		end
	end else begin
		$display("...");
		err_cnt++;
	end
	
	if (tr_array.size() ==0) check();
end
-> scb_done;

if((tr_array.size() ==0) && (wr_cnt != 0) && (!scb_mbox.try_peek(scb_trx)))
break;
end
endtask

function void check();
	if (err_cnt == 0) 
		$display("[SCB] Simulation PASS");
	else
		$display("[SCB] Simulation FAIL, err_cnt : %d" , err_cnt);
endfunction


endclass
