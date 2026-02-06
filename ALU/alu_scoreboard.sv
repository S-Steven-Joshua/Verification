import pkg::*;

class alu_scoreboard;
function void check_output(alu_txn t,logic [19:0] y_expected);
    if(t.y===y_expected)
        begin
            $display("ScoreBoard Matched! at time=%0d where sel=%0d a=%0d b=%0d and y=%0d",$time,t.sel,t.a,t.b,t.y);
        end
    else
        begin
            $error("ScoreBoard MisMatch! at time=%0d where y=%0d and got y=%0d",$time,t.y,y_expected);
        end
endfunction:check_output
endclass:alu_scoreboard
