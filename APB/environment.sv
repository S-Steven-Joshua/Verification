import pkg::*;
`include "driver.sv";
`include "monitor.sv";
`include "scoreboard.sv";

class environment;
virtual apb_interface vif;
driver drv;
coverage cov;
monitor mon;
scoreboard sc;

function new(virtual apb_interface vif);
    this.vif=vif;
    drv=new(vif);
    cov=new();
    mon=new(vif,cov);
    sc=new();
endfunction:new

task run();
    txn t;
    vif.prstn=1'b0;
    repeat(2) @(posedge vif.pclk);
    vif.prstn=1'b1;
    repeat(100) begin
        logic [31:0] dut_value;
        t=new();
        assert(t.randomize())
        else $error("Randomization error");
        t.calc_expected();
        drv.drive(t);
        #1;
        mon.sample_output(dut_value);
        sc.check_output(dut_value,t);
    end
endtask:run

endclass:environment
