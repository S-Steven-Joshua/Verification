import pkg::*;

class counter_scoreboard;
function void check_output(counter_txn t,logic [3:0] actual_data);
    if(t.data!==actual_data)
        begin
            $error("Scoreboard Mismatch!!There is a mismatch in Data=%0d and the Got_Data=%0d and Time is=%0d",t.data,actual_data,$time);
        end
    else
        $display("Scoreboard Match!!Data=%0d and the Got_Data=%0d and Time is=%0d",t.data,actual_data,$time);
endfunction:check_output
endclass:counter_scoreboard
