`include "fifo_environment.sv"

module fifo_test #(parameter depth=8,width=8) (fifo_interface vif);
fifo_environment env;
initial begin
    env=new(vif);
    env.run();
    $display("TEST Completed");
    #200;
    $finish;
end
endmodule:fifo_test
