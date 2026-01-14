module sub_assertion(sub_interface vif);
property p_diff_corrected;
    @(posedge vif.clk) 1'b1|=>(vif.diff==vif.a^vif.b^vif.bin);
endproperty:p_diff_corrected
property p_bout_corrected;
    @(posedge vif.clk)1'b1|=>(vif.bout==((~vif.a*vif.b)|(vif.b&vif.bin)|(~vif.a&vif.bin)));
endproperty:p_bout_corrected

assert property(p_diff_corrected)
else $error(1,"diff assertion failed at time=%0t a=%0b b=%0b bin=%0b diff=%0b",$time,vif.a, vif.b, vif.bin, vif.diff);

assert property(p_bout_corrected)
else $error(1,"bout assertion failed at time=%0t a=%0b b=%0b bin=%0b bout=%0b",$time,vif.a, vif.b, vif.bin, vif.bout);
endmodule:sub_assertion

