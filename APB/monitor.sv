import pkg::*;
class monitor;
virtual apb_interface.tb_interface vif;
coverage cov;
function new(virtual apb_interface.tb_interface vif,coverage cov);
    this.vif=vif;
    this.cov=cov;
endfunction:new

task sample_output(output logic [31:0] dut_rdata);
    @(posedge vif.pclk);
    dut_rdata=vif.prdata;
    cov.sample(vif.prstn,vif.psel,vif.penable,vif.pwrite,vif.pready,vif.trans);
endtask:sample_output
endclass:monitor
