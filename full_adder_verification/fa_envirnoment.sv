//`include "fa_txn.sv"
import txn_pkg::*;
`include "fa_driver.sv"
`include "fa_monitor.sv"
`include "fa_coverage.sv"
`include "fa_scoreboard.sv"
class fa_environment;
fa_driver drv;
fa_monitor mon;
fa_scoreboard sc;
fa_coverage cov;
virtual fa_interface vif;

function new(virtual fa_interface vif);
this.vif=vif;
drv=new(vif);
mon=new(vif);
sc=new();
cov=new();
endfunction:new

task run();
fa_txn t;
repeat(10)begin
    t=new();
    assert(t.randomize())
    else $fatal("Randomization failed");
    drv.drive(t);
    t.calc_expected();
    cov.sample(t.a,t.b,t.cin);
    sc.check_output(t,vif.sum,vif.carry);
    #1;
end
endtask:run
endclass:fa_environment
