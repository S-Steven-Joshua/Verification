import pkg::*;
class async_monitor;

virtual async_interface.tb vif;
async_coverage cov;

function new(virtual async_interface.tb vif,async_coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task sample_output(output logic [1:0] dut_value);
    @(posedge vif.clear or negedge vif.clk);
    dut_value=vif.q;
    cov.sample(vif.clear);
endtask:sample_output
endclass:async_monitor
