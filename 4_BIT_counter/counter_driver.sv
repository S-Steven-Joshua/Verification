import pkg::*;

class counter_driver;
virtual counter_interface.tb vif;

function new(virtual counter_interface.tb vif);
this.vif=vif;
endfunction:new

task drive(counter_txn t);
    
    vif.rst<=t.rst;
    vif.control<=t.control;
endtask:drive
endclass:counter_driver
