class counter_txn;
randc bit  rst,t;
logic [1:0] q;
constraint rst_values{rst dist{0:=99,1:=1};}
constraint t_values{t dist{1:=95,0:=5};}

function void calc_expected(logic [1:0] current_value);
if(rst)
    begin
        q=0;
    end
else
    begin
        if(t)
        begin
            q=current_value+1;
        end
        else
        begin
            q=current_value;
        end 
    end
endfunction:calc_expected
endclass:counter_txn
