module sub(
    input logic clk,
    input logic a,
    input logic b,
    input logic bin,
    output logic diff,
    output logic bout
);
logic reg_a,reg_b,reg_bin;
logic reg_diff,reg_bout;
always_ff @(posedge clk)
    begin
        reg_a<=a;
        reg_b<=b;
        reg_bin<=bin;
    end
assign diff=a^b^bin;
assign bout=(~a&b)|(b&bin)|(~a&bin);
always_ff @(posedge clk)
    begin
        reg_diff<=diff;
        reg_bout<=bout;
    end
endmodule:sub
