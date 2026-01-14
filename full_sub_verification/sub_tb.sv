`timescale 1ns/1ps
module sub_tb;
sub_interface vif();

sub dut(.clk(vif.clk),.a(vif.a),.b(vif.b),.bin(vif.bin),.diff(vif.diff),.bout(vif.bout));

initial vif.clk=1;
always #5 vif.clk=~vif.clk;

sub_assertion assert_instance(vif);
sub_test t1(vif);
endmodule:sub_tb
