module d_assertion(d_interface vif);
property d_rst;
    @(posedge vif.clk) vif.rst|=>(vif.q===1'b0 && vif.qbar===1'b1);
endproperty:d_rst 

property d_q;
    @(posedge vif.clk) //disable iff ($isunknown(vif.rst)) 
    !vif.rst|=>(vif.q===$past(vif.d) && vif.qbar===$past(~vif.d));
endproperty:d_q

property d_qbar;
    @(posedge vif.clk) vif.q===~vif.qbar;
endproperty:d_qbar


assert property(d_rst)
else $error("ASSERTION:There is an rst error at time=%0d and q=%0d",$time,vif.q);

assert property(d_q)
else $error("ASSERTION:There is a failure in capture of data at time=%0d and reset=%0d and q=%0d where the data is %0d",$time,vif.rst,vif.q,vif.d);

assert property(d_qbar)
else $error("ASSERTION:There is error in capture of q and qbar at time=%0d and q=%0d and qbar=%0d",$time,vif.q,vif.qbar);


endmodule:d_assertion
