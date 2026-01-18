interface d_interface;
logic clk,rst,d;
logic q,qbar;
modport dut(input clk,rst,d,output q,qbar);
modport tb(output clk,rst,d,input q,qbar);
endinterface:d_interface
