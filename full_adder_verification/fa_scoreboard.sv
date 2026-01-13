//`include "fa_txn.sv"
import txn_pkg::*;
class fa_scoreboard;
function void check_output(fa_txn t,bit actual_sum,bit actual_carry);
if(actual_carry!=t.exp_carry || actual_sum!=t.exp_sum)
    begin
        $error("Scoreboard mismatch! expected_sum=%0b got_sum=%0b expected_carry=%0b got_carry=%0b",t.exp_sum,actual_sum,t.exp_carry,actual_carry);
        //$error("Scoreboard mismatch! expected_carry=%0b got_carry=%0b",t.exp_carry,actual_carry);
    end
    else
    begin
        $display("Scoreboard pass! expected_sum=%0b got_sum=%0b",t.exp_sum,actual_sum);
        $display("Scoreboard pass! expected_carry=%0b got_carry=%0b",t.exp_carry,actual_carry);
    end
endfunction:check_output
endclass:fa_scoreboard
