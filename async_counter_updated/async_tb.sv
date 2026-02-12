module async_tb;
async_interface vif();
counter dut(.clk(vif.clk),.clear(vif.clear),.q(vif.q));
initial vif.clk=0;
always #5 vif.clk=~vif.clk;
// logic clk,clear;
// logic [1:0] q;

// counter dut(.clk(clk),.clear(clear),.q(q));
// initial clk=0;
// always #5 clk=~clk;

// initial begin
//     clear=1'b1;
//     #20;
//     clear=1'b0;
//     #80;
//     $finish;
// end
async_assertion a1(vif);
async_test t1(vif);
endmodule:async_tb
