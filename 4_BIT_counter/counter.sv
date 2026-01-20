module counter(
    input logic clk,
    input logic rst,
    input logic control,
    output logic [3:0] data
);
always_ff @(posedge clk)
    begin
        if(rst)
        begin
            data<=0;
        end
        else
            begin
                if(control)
                    begin
                        data<=data+1'b1;
                    end
                else
                    begin
                        data<=data-1'b1;
                    end
            end
    end
endmodule:counter
