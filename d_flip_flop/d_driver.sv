import pkg::*;
class d_driver;
virtual d_interface.tb vif;
function new(virtual d_interface.tb vif);
    this.vif=vif;
endfunction:new

task drive(d_txn t);
    //@(posedge vif.clk);
    t.rst=vif.rst;
    t.d=vif.d;
endtask:drive
endclass:d_driver
