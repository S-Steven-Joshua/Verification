class alu_txn;
randc logic [9:0] a,b;
randc logic [2:0] sel;
logic [19:0] y;
constraint sub_values{(sel==3'b001)->(a>b);}

function void calc_expected();
    begin
        y=0;
        case(sel)
        3'b000:y=a+b;
        3'b001:y=a-b;
        3'b010:y=a*b;
        3'b011:begin
                y[0]=(a==b);
                y[1]=(a>b);
                y[2]=(a<b);
        end
        3'b100:y=a&b;
        3'b101:y=a|b;
        3'b110:y=a<<<1;
        3'b111:y=a>>>1;
        default:y=0;
    endcase
    end
endfunction:calc_expected
endclass:alu_txn
