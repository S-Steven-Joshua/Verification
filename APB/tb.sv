module tb;
apb_interface vif();
dut duut(.pclk(vif.pclk),.prstn(vif.prstn),.paddr(vif.paddr),.psel(vif.psel),
       .penable(vif.penable),.pwrite(vif.pwrite),.pwdata(vif.pwdata),
       .pready(vif.pready),.trans(vif.trans),.prdata(vif.prdata) 
);

initial vif.pclk=0;
always vif.pclk=~vif.pclk;

assertion a1(vif);
test t1(vif);
endmodule:tb
