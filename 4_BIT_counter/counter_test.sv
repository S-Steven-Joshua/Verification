`timescale 1ns/1ps
`include "counter_environment.sv"

program counter_test(counter_interface vif);
counter_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("All test is completed");
    #200;
    $finish;
end
endprogram:counter_test
