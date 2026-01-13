//`include "fa_txn.sv"
import txn_pkg::*;
class fa_driver;
virtual fa_interface.tb vif;

function new (virtual fa_interface.tb vif);
    this.vif=vif;
endfunction:new 

task drive(fa_txn t);
    vif.a=t.a;
    vif.b=t.b;
    vif.cin=t.cin;
    #1;
endtask:drive 
endclass:fa_driver
