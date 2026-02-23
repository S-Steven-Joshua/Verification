interface fifo_interface #(parameter depth=8,width=8);
logic clk,rst,w_en,r_en;
logic [width-1:0] data_in;
logic [width-1:0] data_out;
logic full;
logic empty;
modport dut(input clk,rst,w_en,r_en,data_in,output data_out,full,empty);
modport tb(input data_out,full,empty,output clk,rst,w_en,r_en,data_in);
endinterface:fifo_interface
