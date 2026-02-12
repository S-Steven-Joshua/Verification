import pkg::*;

class async_driver;
virtual async_interface.tb vif;
function new(virtual async_interface.tb vif);
    this.vif=vif;
endfunction:new 

task drive(async_txn t);
    vif.clear<=t.clear;
endtask:drive
endclass:async_driver
