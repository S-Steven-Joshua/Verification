`timescale 1ns/1ps
module d_flipfloptb;

d_interface vif();
// logic clk;
// logic rst;
// logic d;
// logic q;
// logic qbar;

d_flipflop dut(.clk(vif.clk),.rst(vif.rst),.d(vif.d),.q(vif.q),.qbar(vif.qbar));

// initial begin
//     clk=0;
//     forever #5 clk=~clk;
// end

// initial begin
//     rst=1;
//     #1;
//     rst=0;
//     d=0;
//     #10;
//     d=1;
//     #10;
//     $display("the value of clk=%0d and d=%0d at time=%0d",clk,d,$time);
//     //$finish;
// end
// //$finish;
initial vif.clk=0;
always #5 vif.clk=~vif.clk;
initial begin
    vif.rst=1'b1;
    vif.d=1'b0;
    repeat(2) @(posedge vif.clk);
    vif.rst=0;
end
d_assertion d1(vif);
d_test t1(vif);
endmodule:d_flipfloptb