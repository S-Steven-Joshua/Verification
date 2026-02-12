interface async_interface;
logic clk,clear;
logic [1:0] q;
clocking cb @(negedge clear );
    input clear;
    input q;
endclocking:cb
modport dut(input clk,clear,output q);
modport tb(output clk,clear,input q);
endinterface:async_interface
