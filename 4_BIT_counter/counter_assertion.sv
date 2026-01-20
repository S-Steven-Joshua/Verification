module counter_assertion(counter_interface vif);

property counter_rst;
    @(posedge vif.clk) vif.rst |=> vif.data===4'b0;
endproperty:counter_rst

property counter_data_upward;
    @(posedge vif.clk)  disable iff(vif.rst)
    vif.control|=>(vif.data===$past(vif.data)+1'b1); 
endproperty:counter_data_upward

property counter_data_downward;
    @(posedge vif.clk) disable iff(vif.rst)
    !vif.control |=>(vif.data===$past(vif.data)-1'b1); 
endproperty:counter_data_downward

assert property(counter_rst)
else $error("Assertion Failed! There is rst error at time=%0d and data is=%0d",$time,vif.data);

assert property(counter_data_upward)
else $error("Assertion Failed! There is failure in upward counting time=%0d and data is%0d and control signal is%0d",$time,vif.data,vif.control);

assert property(counter_data_downward)
else $error("Assertion Failed! There is failure in downward counting time=%0d and data is%0d and control signal is%0d",$time,vif.data,vif.control);


endmodule:counter_assertion
