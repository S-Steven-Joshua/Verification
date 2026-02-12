class async_txn;
randc logic clear;
logic [1:0]q;

constraint clear_weight{clear dist{0:=95,1:=5};}
function void calc_expected(logic [1:0] current_count);
    if(clear)
        begin
            q=0;
        end
    else
        begin
            q=current_count+1;
        end
endfunction:calc_expected
endclass:async_txn
