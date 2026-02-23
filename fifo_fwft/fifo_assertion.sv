module fifo_assertion #(parameter depth=8,width=8)(fifo_interface vif);

property rst;
    @(posedge vif.clk) vif.rst|=>(vif.empty===1'b1 && vif.full===1'b0);
endproperty:rst

property data_stability;
    @(posedge vif.clk) disable iff(vif.rst || $isunknown(vif.data_out))
    (!vif.r_en && !vif.w_en) |=> $stable(vif.data_out);
endproperty: data_stability

property fwft;
    @(posedge vif.clk) disable iff(vif.rst || $isunknown(vif.data_out) || vif.r_en)
    vif.w_en && !vif.full & !vif.empty |=>  vif.data_out===$past(vif.data_in);
endproperty:fwft

property full_property;
    @(posedge vif.clk) disable iff(vif.rst)
    vif.w_en && vif.full |=> $stable(vif.data_in);
endproperty:full_property

property safety;
    @(posedge vif.clk) disable iff(vif.rst)
    !(vif.full && vif.empty);
endproperty:safety

assert property(rst)
else $error("RST ASSERTION FAILED");

assert property(data_stability)
else $error("DATA STABILITITY ASSERTION FAILED");

assert property(fwft)
else $error("FWFT ERROR ASSERTION FAILED");

assert property(full_property)
else $error("FULL PROPERTY ASSERTION FAILED");

assert property(safety)
else $error("SAFETY ASSERTION FAILED");

endmodule:fifo_assertion
