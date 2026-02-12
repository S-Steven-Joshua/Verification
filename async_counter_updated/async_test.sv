`include "async_environment.sv"
program async_test(async_interface vif);
async_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("All test is completed");
    #200;
    $finish;
end
endprogram:async_test
