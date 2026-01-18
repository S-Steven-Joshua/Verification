`timescale 1ns/1ps
`include "d_environment.sv"
program d_test(d_interface vif);
d_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("All test completed");
    #200;
    $finish;
end
endprogram:d_test
