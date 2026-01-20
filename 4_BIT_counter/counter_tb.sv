`timescale 1ns/1ps
module counter_tb;
// logic clk,rst,control;
// logic [3:0] data;
counter_interface vif();

counter dut(.clk(vif.clk),.rst(vif.rst),.control(vif.control),.data(vif.data));

initial begin
    vif.clk=0;
    forever #5 vif.clk=~vif.clk;
end

// initial begin
//     rst=1;
//     control=0;
//     #10;
//     rst=0;
//     control=1;
//     #200;
//     control=0;
//     #300;
//     rst=1;
//     #10;
//     $display("The value of data=%0d and control is%0d",data,control);
// end

counter_assertion d1(vif);
counter_test t1(vif);
endmodule:counter_tb
