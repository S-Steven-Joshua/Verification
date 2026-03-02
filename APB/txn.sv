class txn;
logic  pclk;
rand logic  prstn;
rand logic  [4:0] paddr;
rand logic  psel;
logic  penable;
rand logic  pwrite;
rand logic  [31:0] pwdata;
rand logic  pready;
rand logic  trans;
logic [31:0] prdata;

constraint rst_values {prstn dist{0:=5,1:=95};}
constraint paddr_values {paddr inside{[0:(1<<5)-1]};}
constraint psel_values {psel dist{0:=10,1:=90};}
constraint pwrite_values{pwrite dist{0:=20,1:=80};}
constraint pwdata_values{pwdata inside{[0:(1<<31)-1]};}
constraint pready_values{pready dist{0:=10,1:=90};}
constraint trans_values{trans dist{1:=40,0:=60};}

static logic [31:0] temp_mem[31:0];
static enum {S0,S1,S2} exp_state=S0;

function void calc_expected();
    if(!prstn)
        begin
            exp_state=S0;
            prdata=32'b0;
        end
    else
        begin
            case(exp_state)
                S0:
                    begin
                        if(psel && trans)
                            begin
                                exp_state=S1;
                            end
                        else
                            begin
                                exp_state=S0;
                            end
                    end
                S1:
                    begin
                        if(psel && trans && penable)
                            begin
                                exp_state=S2;
                            end
                        else
                            begin
                                exp_state=S0;
                            end
                    end
                S2:
                    begin
                        if(pready)
                            begin
                                if(pwrite)
                                    begin
                                        temp_mem[paddr]=pwdata;
                                    end
                                else
                                    begin
                                        prdata=temp_mem[paddr];
                                    end
                                if(trans)
                                    begin
                                        exp_state=S1;
                                    end
                                else
                                    begin
                                        exp_state=S0;
                                    end
                            end
                        else
                            begin
                                exp_state=S2;
                            end
                    end
            endcase
        end

endfunction:calc_expected
endclass:txn
