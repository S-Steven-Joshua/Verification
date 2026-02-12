module async(
    input logic clk,
    input logic clear,
    output logic q
);
always_ff @(negedge clk or posedge clear)
    begin 
        if(clear)
            begin
                q<=0;
            end
        else
            begin
                q<=~q;
            end
    end
endmodule:async

module counter(
    input logic clk,
    input logic clear,
    output logic [1:0] q
);
async t1(.clk(clk),.clear(clear),.q(q[0]));
async t2(.clk(q[0]),.clear(clear),.q(q[1]));
endmodule:counter
