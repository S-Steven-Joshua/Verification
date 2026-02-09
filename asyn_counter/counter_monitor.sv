import pkg::*;
class counter_monitor;
virtual counter_interface.tb vif;
counter_coverage cov;

function new(virtual counter_interface.tb vif,counter_coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task monitor_output(output logic [1:0] test_q);
    //@(vif.cb);
    cov.sample(vif.rst,vif.t);
    test_q=vif.q;
endtask:monitor_output
endclass:counter_monitor
