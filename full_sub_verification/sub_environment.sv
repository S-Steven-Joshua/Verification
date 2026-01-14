import txn_pkg::*;
`include "sub_driver.sv"
`include "sub_monitor.sv"
`include "sub_scoreboard.sv"
//`include "sub_coverage.sv"

class sub_environment;
sub_driver drv;
sub_monitor mon;
sub_scoreboard sc;
sub_coverage cov;
virtual sub_interface vif;
function new(virtual sub_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
    //cov=new();
endfunction:new
task run();
sub_txn t;
repeat(50) begin
    bit test_bout,test_diff;
    t=new();
    assert(t.randomize())
    else $fatal("Randomization failure");
    drv.drive(t);
    #1;
    t.calc_expected();
    //cov.sample(t.a,t.b,t.bin);
    mon.sample_output(test_diff,test_bout);
    sc.check_output(t,test_diff,test_bout);
end
endtask:run

endclass:sub_environment

