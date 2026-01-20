import pkg::*;
class d_scoreboard;
function void check_output(d_txn t,bit actual_q,bit actual_qbar);
    if(t.exp_q!==actual_q || t.exp_qbar!==actual_qbar)
        begin
            $error("Scoreboard mismatch! at time=%0d where the expected q is=%0d and the value recieved is =%0d",$time,t.exp_q,actual_q);
        end
    else
    begin
        $display("Scoreboard passed! at time=%0t where the expected and got q matches =%0d",$time,t.exp_q);
    end
endfunction:check_output
endclass:d_scoreboard
