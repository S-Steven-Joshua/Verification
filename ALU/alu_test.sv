`timescale 1ns/1ps

`include "alu_environment.sv"

program alu_test( alu_interface vif);
alu_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("All test has been completed ");
    #200;
    $finish;
end
endprogram:alu_test

