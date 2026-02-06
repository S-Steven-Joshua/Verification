interface alu_interface;
logic [9:0] a,b;
logic [2:0] sel;
logic [19:0] y;
modport dut(input a,b,sel,output y);
modport tb(output a,b,sel,input y);
endinterface:alu_interface
