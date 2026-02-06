import pkg::*;

class alu_driver;
virtual alu_interface.tb vif;

function new(virtual alu_interface.tb vif);
    this.vif=vif;
endfunction:new

task drive(alu_txn t);
    vif.a=t.a;
    vif.b=t.b;
    vif.sel=t.sel;
    
endtask:drive
endclass:alu_driver
