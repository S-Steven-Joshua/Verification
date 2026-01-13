//`include "fa_txn.sv"
import txn_pkg::*;
class fa_monitor;
virtual fa_interface.tb vif;
function new(virtual fa_interface.tb vif);
this.vif=vif;
endfunction:new

task monitor_output(fa_txn t);
t.calc_expected();
t.display("Monitor");

if(vif.sum != t.exp_sum || vif.carry!=t.exp_carry)
    begin
        $error("Mismatch a=%0b b=%0b cin=%0b exp_sum=%0b exp_carry=%0b got_sum=%0b got_carry=%0b",t.a,t.b,t.cin,t.exp_sum,t.exp_carry,vif.sum,vif.carry);
    end
endtask:monitor_output
endclass:fa_monitor