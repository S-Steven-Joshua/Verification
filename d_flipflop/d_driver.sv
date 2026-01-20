import pkg::*;
class d_driver;
virtual d_interface.tb vif;
function new(virtual d_interface.tb vif);
    this.vif=vif;
endfunction:new

task drive(d_txn t);
    //@(posedge vif.clk);
    vif.rst=t.rst;
    vif.d=t.d;
endtask:drive
endclass:d_driver
