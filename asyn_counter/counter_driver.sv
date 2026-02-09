import pkg::*;
class counter_driver;
virtual counter_interface.tb vif;

function new(virtual counter_interface.tb vif);
    this.vif=vif;
endfunction:new

task drive(counter_txn to);
    @(vif.cb);
    vif.rst<=to.rst;
    vif.t=to.t;
endtask:drive
endclass:counter_driver
