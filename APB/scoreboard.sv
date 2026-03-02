import pkg::*;
class scoreboard;
function void check_output(logic [31:0] dut_rdata,txn t);
if($isunknown(dut_rdata))
    begin
        return;
    end

if(dut_rdata===t.prdata)
    begin
        $display("Message from scoreboard. The Read data is correct");
    end
else
    begin
        $display("There is a scoreboard mismatch");
    end
endfunction:check_output

endclass:scoreboard
