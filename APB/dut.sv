module dut(
    input logic pclk,
    input logic prstn,
    input logic [4:0] paddr,
    input logic psel,
    input logic penable,
    input logic pwrite,
    input logic [31:0] pwdata,
    input logic pready,
    input logic trans,
    output logic [31:0] prdata
);
typedef enum {S0,S1,S2} state_t;
state_t state;

logic [31:0] mem [31:0];

always_ff @(posedge pclk or negedge prstn)
    begin
        if(!prstn)
            begin
                //prdata<=32'b0;
                state<=S0;
            end
        else
            begin
                case(state)
                    
                        S0:
                            begin
                                //prdata<=32'b0;
                                if(!psel && trans && !penable)
                                    begin
                                        state<=S1;
                                    end
                                else
                                    begin
                                        state<=S0;
                                    end
                            end
                        S1:
                            begin
                                //prdata<=32'b0;
                                if(psel && !penable)
                                    begin
                                        state<=S2;
                                    end
                                else
                                    begin
                                        state<=S0;
                                    end
                            end
                        S2:
                            begin
                                if(psel && penable)
                                    begin
                                        if(pready)
                                            begin
                                                if(pwrite)
                                                    begin
                                                        mem[paddr]=pwdata;
                                                    end
                                                if(trans && pready)
                                                    state<=S1;
                                                else if(!trans && pready)
                                                    state<=S0;
                                            end
                                        else
                                            state<=S2;
                                    end
                                else
                                    stat<=S0
                            end
                    default:state<=S0;
                endcase    
            end
    end
always_comb 
    begin
        if(state==S2 && pready && !pwrite)
            begin
                prdata=mem[paddr];
            end
        else
            begin
                prdata=32'b0;
            end
    end
endmodule:dut
