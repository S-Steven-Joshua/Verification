import pkg::*;

`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_scoreboard.sv"

class alu_environment;
virtual alu_interface vif;
alu_coverage cov;
alu_driver drv;
alu_monitor mon;
alu_scoreboard sc;
function new(virtual alu_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
endfunction:new

task run();
    alu_txn t;
    //vif.a=0;
    //vif.b=0;
    //vif.sel=0;
    repeat(100) begin
        logic [19:0] test_y;
        t=new();
        assert(t.randomize())
        else $fatal("Randomization error");
        t.calc_expected();
        drv.drive(t);
        #1;
        mon.sample_output(test_y);
        sc.check_output(t,test_y);
    end
endtask:run

endclass:alu_environment