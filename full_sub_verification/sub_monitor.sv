import txn_pkg::*;
//`include "sub_coverage.sv"
class sub_monitor;
virtual sub_interface.tb vif;
sub_coverage cov;
function new(virtual sub_interface.tb vif,sub_coverage cov);
    this.cov=cov;
    this.vif=vif;
endfunction:new 
task sample_output(output bit actual_diff,output bit actual_bout);
    @(posedge vif.clk);
    cov.sample(vif.a,vif.b,vif.bin);
    actual_diff=vif.diff;
    actual_bout=vif.bout;
endtask:sample_output
endclass:sub_monitor
