import pkg::*;
`include "counter_driver.sv"
`include "counter_monitor.sv"
`include "counter_scoreboard.sv"

class counter_environment;
virtual counter_interface vif;
counter_coverage cov;
counter_driver drv;
counter_monitor mon;
counter_scoreboard sc;
logic [1:0] current_q;

function new(virtual counter_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
    current_q=0;
endfunction:new 

task run();
    counter_txn to;
    vif.rst=1'b1;
    //vif.q=2'b0;
    repeat(2) @(vif.cb) vif.rst=1'b0; current_q=0;
    repeat(100) begin
        logic [1:0] test_q;
        to=new();
        assert(to.randomize())
        else $fatal("Randomization failed!");
        to.calc_expected(current_q);
        drv.drive(to);
        //@(vif.cb);
        
        mon.monitor_output(test_q);
        sc.check_output(to,test_q);
        current_q=to.q;
    end
endtask:run
endclass:counter_environment
