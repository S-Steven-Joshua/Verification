`timescale 1ns/1ps

module alu_tb;

alu_interface vif();

aluuu dut(.a(vif.a),.b(vif.b),.sel(vif.sel),.y(vif.y));
alu_assertion a2(vif);
alu_test te1(vif);
endmodule:alu_tb

