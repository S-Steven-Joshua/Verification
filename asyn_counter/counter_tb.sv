`timescale 1ns/1ps
module counter_tb;
counter_interface vif();
// logic clk,rst,t;
// logic [1:0] q;
counter_dut dut(.clk(vif.clk),.rst(vif.rst),.t(vif.t),.q(vif.q));

initial vif.clk=0;
always #5 vif.clk=~vif.clk;

counter_assertion a1(vif);
counter_test t1(vif);
endmodule:counter_tb
