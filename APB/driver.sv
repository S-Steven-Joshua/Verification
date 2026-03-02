import pkg::*;
class driver;
virtual apb_interface.tb_interface vif;

function new(virtual apb_interface.tb_interface vif);
    this.vif=vif;
endfunction:new 

task drive(txn t);
    vif.prstn=t.prstn;
    vif.paddr=t.paddr;
    vif.psel=t.psel;
    vif.penable=t.penable;
    vif.pwrite=t.pwrite;
    vif.pwdata=t.pwdata;
    vif.pready=t.pready;
    vif.trans=t.trans;
endtask:drive
endclass:driver
