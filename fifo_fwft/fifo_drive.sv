import pkg::*;

class fifo_drive #(parameter depth=8,width=8);
virtual fifo_interface.tb vif;
function new(virtual fifo_interface.tb vif);
this.vif=vif;
endfunction:new

task driver(fifo_txn t);
    vif.rst<=t.rst;
    vif.w_en<=t.w_en;
    vif.r_en<=t.r_en;
    vif.data_in<=t.data_in;
endtask:driver
endclass:fifo_drive
