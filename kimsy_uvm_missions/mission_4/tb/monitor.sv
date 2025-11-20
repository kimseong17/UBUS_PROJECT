class monitor;

mailbox #(transaction) scb_mbox;
virtual apb_interface vif; 
transaction mon_trx;

function new(virtual apb_interface apb_if);
this.vif = apb_if;
endfunction

task run();
$display("[MON] run() is started ...");

forever begin
mon_trx = new();
@(vif.cb);
wait(vif.pready && vif.pselx && vif.penable);
mon_trx.addr = vif.paddr;

mon_trx.is_write = vif.pwrite ? 1 : 0;
mon_trx.data = vif.pwrite ? vif.pwdata : vif.prdata;
mon_trx.pslverr = vif.pslverr;

scb_mbox.put(mon_trx);
mon_trx.print("MON");

@(negedge vif.pready);
endtask

endclass
