`timescale 1ns/1ps
interface counter_interface;
logic clk,rst,t;
logic [1:0] q;
clocking cb @(negedge clk or posedge rst);
    default input #10ns output #10ns;
    output t;
    input q;
endclocking
//dut
modport dut(input clk,rst,t,output q);
//tb
modport tb(output clk,rst,t,input q);
endinterface:counter_interface
