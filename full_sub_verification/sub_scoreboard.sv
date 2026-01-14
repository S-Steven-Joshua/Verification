import txn_pkg::*;
class sub_scoreboard;
function void check_output(sub_txn t,bit actual_diff,bit actual_bout);
    if(t.exp_diff!=actual_diff||t.exp_bout!=actual_bout)
        begin
            $error("Scoreboard mismatch! expected_diff=%0b expected_bout=%0b got_diff=%0b got_bout=%0b",t.exp_diff,t.exp_bout,actual_diff,actual_bout);
        end
    else
        begin
            $display("ScoreBoard passed! expected_diff=%0b got_diff=%0b",t.exp_diff,actual_diff);
            $display("ScoreBoard passed! expected_bout=%0b got_bout=%0b",t.exp_bout,actual_bout);
        end
endfunction:check_output
endclass:sub_scoreboard
