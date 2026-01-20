import pkg::*;
`include "counter_driver.sv"
`include "counter_monitor.sv"
`include "counter_scoreboard.sv"

class counter_environment;
virtual counter_interface vif;
counter_driver drv;
counter_monitor mon;
counter_coverage cov;
counter_scoreboard sc;
logic [3:0] current_count;

function new(virtual counter_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
    current_count=4'b0;
endfunction:new

task run();
    counter_txn t;
    vif.rst=1'b1;
    vif.control=1'b0;
    repeat(2) @(posedge vif.clk) vif.rst=1'b0; current_count=4'b0;
    repeat(100) begin
        logic [3:0] test_data;
        t=new();
        assert(t.randomize())
        else $fatal("Randomization failed");
        t.calc_expected(current_count);
        drv.drive(t);
        #1;
        
        mon.sample_output(test_data);
        sc.check_output(t,test_data);
        current_count=t.data;
    end
endtask:run

endclass:counter_environment
