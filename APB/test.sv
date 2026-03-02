import pkg::*;
`include "environment.sv";
module test(apb_interface vif);
environment env;
initial begin
    env=new(vif);
    env.run();
    $display("TEST COMPLETED");
    #200;
    $finish;
end
endmodule:test
