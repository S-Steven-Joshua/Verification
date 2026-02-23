import pkg::*;
class fifo_scoreboard #(parameter depth=8,width=8);
function void check_output(logic [width-1:0] rtl_data, logic rtl_empty, logic rtl_full, fifo_txn t);

    if ($isunknown(rtl_data) || $isunknown(rtl_empty) || $isunknown(rtl_full)) begin
        return; 
    end
    if (rtl_empty === t.empty && rtl_full === t.full) begin
        
        if (!rtl_empty && (rtl_data !== t.queue[0])) begin
             $error("Mismatch! RTL Data: %h, Expected: %h", rtl_data, t.queue[0]);
        end else begin
             $display("Time=%0t SCOREBOARD PASS: Flags and Data match.", $time);
        end
    end
endfunction: check_output
endclass:fifo_scoreboard
