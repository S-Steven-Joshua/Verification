import pkg::*;

class counter_monitor;
virtual counter_interface.tb vif;
counter_coverage cov;
function new(virtual counter_interface.tb vif,counter_coverage cov);
this.vif=vif;
this.cov=cov;
endfunction:new

task sample_output(output logic [3:0] exp_data);
    @(posedge vif.clk);
    cov.sample(vif.rst,vif.control);
    exp_data=vif.data;
endtask:sample_output

endclass:counter_monitor
