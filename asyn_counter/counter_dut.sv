module t_flipflop(
    input logic clk,
    input logic rst,
    input logic t,
    output logic q
);
always_ff @(negedge clk or posedge rst)
    begin
        if(rst)
            q<=0;
        else
            begin
                if(t)
                    q<=~q;
                else
                    q<=q;
            end
    end
endmodule:t_flipflop


module counter_dut(
    input logic clk,
    input logic rst,
    input logic t,
    output logic [1:0] q
);


t_flipflop t1(.clk(clk),.rst(rst),.t(t),.q(q[0]));
t_flipflop t2(.clk(q[0]),.rst(rst),.t(t),.q(q[1]));

endmodule:counter_dut
