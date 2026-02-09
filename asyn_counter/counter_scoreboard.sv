import pkg::*;

class counter_scoreboard;
task check_output(counter_txn to,logic [1:0] expected_q);
    //#10ns;
    if(to.q===expected_q)
        begin
            //#1ps;
            $display("SCOREBOARD SUCCESS!The value of q=%0d and from the DUT is=%0d at time=%0d",to.q,expected_q,$time);
        end
    else
        begin
            //#1ps;
            $error("SCOREBOARD FAILED! The vlaue of q=%0d and the from the dut is=%0d at time=%0d and reset=%0d",to.q,expected_q,$time,to.rst);
        end
endtask:check_output
endclass:counter_scoreboard
