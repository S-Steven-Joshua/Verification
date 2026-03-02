import pkg::*;
module assertion(apb_interface vif);
//restart
property restart;
    @(posedge vif.pclk or negedge vif.prstn) vif.prstn |=> vif.prdata===32'b0;
endproperty:restart

property read;
    @(posedge vif.pclk or negedge vif.prstn) disable iff(vif.prstn || $isunknown(vif.prdata)|| $isunknown(vif.paddr))
    (!vif.pwrite && vif.pready && vif.penable && vif.psel && vif.trans) |-> (vif.prdata===txn::temp_mem[vif.paddr]);
endproperty:read 

assert property(restart)
else $error("rst Assertion error");

assert property(read)
else $error("Read assertion error");
endmodule:assertion
