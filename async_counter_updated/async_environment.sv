import pkg::*;
`include "async_driver.sv"
`include "async_monitor.sv"
`include "async_scoreboard.sv"
class async_environment;
virtual async_interface vif;
async_driver drv;
async_coverage cov;
async_monitor mon;
async_scoreboard sc;
logic [1:0] current_value;
function new(virtual async_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
    current_value=0;
endfunction:new

task run();
    async_txn t;
     vif.clear=1'b1;
    repeat(2) @(negedge vif.clk);
    vif.clear=1'b0;
    repeat(100) begin
        logic [1:0] dut_value;
        t=new();
        assert(t.randomize())
        else $error("RANDOMIZATION ERROR");
        t.calc_expected(current_value);
        drv.drive(t);
        #1;
        mon.sample_output(dut_value);
        sc.check(t,dut_value);
        current_value=dut_value;
    end
endtask:run

endclass:async_environment
