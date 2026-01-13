module fa_assertion (fa_interface vif);

  // Sum property
  property correct_sum;
    @(vif.a or vif.b or vif.cin)
      vif.sum == (vif.a ^ vif.b ^ vif.cin);
  endproperty : correct_sum

  // Carry property
  property correct_carry;
    @(vif.a or vif.b or vif.cin)
      vif.carry == ((vif.a & vif.b) |
                     (vif.b & vif.cin) |
                     (vif.a & vif.cin));
  endproperty : correct_carry

  // Assertions
  assert property (correct_sum)
    else $error("SUM ASSERT FAIL: a=%0b b=%0b cin=%0b sum=%0b",
                vif.a, vif.b, vif.cin, vif.sum);

  assert property (correct_carry)
    else $error("CARRY ASSERT FAIL: a=%0b b=%0b cin=%0b carry=%0b",
                vif.a, vif.b, vif.cin, vif.carry);

endmodule : fa_assertion
