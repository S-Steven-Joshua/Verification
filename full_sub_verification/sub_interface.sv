interface sub_interface;
logic clk,a,b,bin;
logic diff,bout;

modport dut(input clk,a,b,bin,output diff,bout);
modport tb(output clk,a,b,bin,output diff,bout);
endinterface:sub_interface
