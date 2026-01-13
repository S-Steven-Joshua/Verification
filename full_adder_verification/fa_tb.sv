`timescale 1ns/1ps

module fa_tb;

  // Testbench signals
    fa_interface vif();

  // DUT instantiation
  fa dut (
    .a(vif.a),
    .b(vif.b),
    .cin(vif.cin),
    .sum(vif.sum),
    .carry(vif.carry)
  );

fa_assertion assert_instance(vif);
fa_test t1(vif);

endmodule:fa_tb
