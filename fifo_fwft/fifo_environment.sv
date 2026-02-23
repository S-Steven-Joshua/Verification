import pkg::*;
`include "fifo_drive.sv";
`include "fifo_monitor.sv"
`include "fifo_scoreboard.sv";

class fifo_environment #(parameter depth=8,width=8);
virtual fifo_interface vif;
fifo_drive drv;
fifo_coverage cov;
fifo_monitor mon;
fifo_scoreboard sc;

function new(virtual fifo_interface vif);
this.vif=vif;
drv=new(vif);
cov=new();
mon=new(vif,cov);
sc=new();
endfunction:new 

task run();
fifo_txn t;
vif.rst=1'b1;
vif.w_en=1'b0;
vif.r_en=1'b0;
repeat(2) @(posedge vif.clk);
vif.rst=1'b0;
repeat(100) begin
    logic [width-1:0] dut_data;
    logic dut_empty,dut_full;
    t=new();
    assert(t.randomize())
    else $fatal("Randomization Error");
    drv.driver(t);
    @(posedge vif.clk);
    #1;
    mon.sample_output(dut_data,dut_empty,dut_full);
    t.calc_expected();
    sc.check_output(dut_data,dut_empty,dut_full,t);
end
endtask:run
endclass:fifo_environment
