import pkg::*;

class alu_monitor;
virtual alu_interface.tb vif;
alu_coverage cov;

function new(virtual alu_interface.tb vif, alu_coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task sample_output(output logic [19:0] y_expected);
    cov.sample(vif.a,vif.b,vif.sel);
    #0.1;
    y_expected=vif.y;
endtask:sample_output
endclass:alu_monitor
