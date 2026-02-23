module fifo_tb;
    parameter depth = 8;
    parameter width = 8;
    fifo_interface vif();
    fifo #(.depth(depth), .width(width)) dut(.clk(vif.clk),
        .rst(vif.rst),.w_en(vif.w_en),.r_en(vif.r_en),
        .data_in(vif.data_in),.data_out(vif.data_out),
        .full(vif.full),.empty(vif.empty)
    );

    initial vif.clk=0;
    always #5 vif.clk=~vif.clk;

    fifo_assertion a1(vif);
    fifo_test t1(vif);

endmodule:fifo_tb