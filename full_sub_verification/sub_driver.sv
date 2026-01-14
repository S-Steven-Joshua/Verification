import txn_pkg::*;
class sub_driver;
virtual sub_interface.tb vif;

function new(virtual sub_interface.tb vif);
    this.vif=vif;
endfunction:new

task drive(sub_txn t);
    @(posedge vif.clk);
    vif.a=t.a;
    vif.b=t.b;
    vif.bin=t.bin;
endtask:drive
endclass:sub_driver
