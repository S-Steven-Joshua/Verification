module counter_assertion(counter_interface vif);
property counter_rst;
    @(negedge vif.cb )  vif.rst|=> vif.q===2'b0;
endproperty:counter_rst

property counter_data;
    @(negedge vif.cb) disable iff(vif.rst)
    vif.t|=> (vif.q===$past(vif.q)+1'b1);
endproperty:counter_data

property counter_hold;
    @(negedge vif.cb) disable iff(vif.rst)
    !vif.t|=>  (vif.q===$past(vif.q));
endproperty:counter_hold

assert property(counter_rst)
else $error("Assertion Failure!There is a reset faliure at time=%0d",$time);

assert property(counter_data) 
else $error("Assertion Failure! Data failure at time=%0d",$time);

assert property(counter_hold)
else $error("Assertion Failure! Data wasnt hold at time=%0d",$time);
endmodule:counter_assertion
