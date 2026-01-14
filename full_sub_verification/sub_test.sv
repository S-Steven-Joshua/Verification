`timescale 1ns/1ps
`include "sub_environment.sv"
program sub_test(sub_interface vif);
sub_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("All test completed");
    #100;$finish;
end
endprogram:sub_test
