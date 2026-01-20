class counter_txn;
randc logic  rst,control;
logic [3:0] data;
constraint rst_weight{rst dist{0:=95,1:=5};}

function void calc_expected(logic [3:0] current_count);
    if(rst)
        begin
            data=4'b0;
        end
        else
            begin
                if(control)
                    begin
                        data=current_count+1'b1;
                    end
                else
                    begin
                        data=current_count-1'b1;
                    end
            end
endfunction:calc_expected

endclass:counter_txn
