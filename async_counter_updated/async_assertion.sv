module async_assertion(async_interface vif);

property restart;
    @(posedge vif.clear or negedge vif.clk) vif.clear |=> vif.q===2'b0;
endproperty:restart

property count;
    @(negedge vif.clk or posedge vif.clear) disable iff(vif.clear || $isunknown(vif.q))
    1'b1|=> vif.q===({$past(vif.q)+1}%4);
endproperty:count

assert property(restart)
else $error("ASSERTION ERROR FOR RESTART");

assert property(count)
else $error("ASSERTION ERROR FOR COUNTER. The value of q=%0d and the past is q=%0d",vif.q,({$past(vif.q)+1}%4));

endmodule:async_assertion
