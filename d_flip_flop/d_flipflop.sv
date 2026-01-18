module d_flipflop(
    input logic clk,
    input logic rst,
    input logic d,
    output logic q,
    output logic qbar
);
always_ff @(posedge clk)
    begin
        if(rst)
            begin
                q<=1'b0;
                //qbar<=1'b1;
            end
        else
            begin
                q<=d;
                //qbar<=~d;
            end
    end
assign qbar=~q;
endmodule:d_flipflop
