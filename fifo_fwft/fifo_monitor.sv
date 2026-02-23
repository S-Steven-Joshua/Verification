import pkg::*;

class fifo_monitor #(parameter width=8,depth=8);
virtual fifo_interface.tb vif;
fifo_coverage cov;

function new(virtual fifo_interface.tb vif,fifo_coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task sample_output(output logic [width-1:0] dut_data_out,output logic empty,output logic full);
    @(posedge vif.clk);
    dut_data_out=vif.data_out;
    empty=vif.empty;
    full=vif.full;
    cov.sample(vif.rst,vif.w_en,vif.r_en);
endtask:sample_output
endclass:fifo_monitor
