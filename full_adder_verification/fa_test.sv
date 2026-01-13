`timescale 1ns/1ps
`include "fa_envirnoment.sv"
program fa_test(fa_interface vif);
    fa_environment env;
    initial begin
        env=new(vif);
        env.run();
        $display("All test complete");
        #10;$finish;
    end
endprogram:fa_test

