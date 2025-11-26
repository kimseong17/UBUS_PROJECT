class generator;

int num, repeat_val;

transaction gen_trx;
mailbox #(transaction) tr_mbox;

transaction rd_trx;
mailbox #(transaction) rd_mbox;

event gen_done;

logic [RW_REGION-1:0]apb_addr_list[$];
parameter RW_REGION = 8;

task wr_gen();

for (int i =0 ; i<repeat_val; i++) begin

gen_trx = new();

if(!gen_trx.randomize() with {is_write == 1;})

$display("[ERROR] %t, randomization failed", $time());

tr_mbox.put(gen_trx);
gen_trx.print("GEN");
// #1ns;
apb_addr_list.push_back (gen_trx.addr);

end
endtask

task rd_gen();

foreach ( apb_addr_list[i]) begin
gen_trx=new();
rd_trx=new();

if(!gen_trx.randomize() with {is_write == 0; addr ==apb_addr_list[i];})

$display("[ERROR], randomization failed");

tr_mbox.put(gen_trx);
rd_mbox.get(rd_trx);
$display("..." , rd_trx.addr);
gen_trx.print("GEN");
end
endtask

task run();
$display("[GEN] run() is started...");

if ($value$plusargs("num=%d", num)) begin
    repeat_val = num;
end else
    repeat_val = 16;


wr_gen();
rd_gen();

-> gen_done;

endtask

endclass
