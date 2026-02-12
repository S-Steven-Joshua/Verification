import pkg::*;
class async_scoreboard;
function void check(async_txn t,logic [1:0] dut_value);
if(dut_value===t.q)
    begin
        $display("SCOREBOARD PASSED!The value calculated value=%0d and the dut value is=%0d",t.q,dut_value);
    end
else
    begin
        $error("SCOREBOARD FAILED!The value calculated value=%0d and the dut value is=%0d",t.q,dut_value);
    end
endfunction:check
endclass:async_scoreboard
