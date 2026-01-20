import pkg::*;
`include "d_driver.sv"
`include "d_monitor.sv" 
`include "d_scoreboard.sv"
class d_environment;
virtual d_interface vif;
d_driver drv;
d_monitor mon;
d_coverage cov;
d_scoreboard sc;

function new(virtual d_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
endfunction:new


task run();
    d_txn t;
    vif.rst=1'b1;
    vif.d=1'b0;
    repeat(2) @(posedge vif.clk)
    vif.rst=1'b0;
    repeat(100) begin
        bit test_q,test_qbar;
        t=new();
        assert(t.randomize())
        else $fatal("Randomization failed");
        drv.drive(t);
        #1;
        t.calc_expected();
        mon.sample_output(test_q,test_qbar);
        // if(!t.rst)
        // begin
        //     sc.check_output(t,test_q,test_qbar);
        // end
        sc.check_output(t,test_q,test_qbar);
    end

endtask:run

endclass:d_environment
