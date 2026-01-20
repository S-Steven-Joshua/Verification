//`timescale 1ns/1ps
interface counter_interface;
    logic clk,rst, control;
    logic [3:0] data;



    // Modport for the RTL (DUT)
    modport dut(input clk, rst, control, output data);

    // Modport for the Testbench (uses the clocking block)
    modport tb(output clk,rst,control,input data);

endinterface: counter_interface