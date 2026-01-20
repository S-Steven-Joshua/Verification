import pkg::*;
class d_monitor;
virtual d_interface.tb vif;
d_coverage cov;
function new(virtual d_interface.tb vif,d_coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task sample_output(output bit actual_q,output bit actual_qbar);
    @(posedge vif.clk);
    cov.sample(vif.rst,vif.d);
    actual_q=vif.q;
    actual_qbar=vif.qbar;
endtask:sample_output
endclass:d_monitor
