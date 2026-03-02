interface apb_interface;
logic pclk;
logic prstn;
logic [4:0] paddr;
logic psel;
logic penable;
logic pwrite;
logic [31:0] pwdata;
logic pready;
logic trans;
logic [31:0] prdata;

modport dut_interface(input pclk,prstn,paddr,psel,penable,pwrite,pwdata,pready,trans,output prdata);
modport tb_interface(input prdata,output pclk,prstn,paddr,psel,penable,pwrite,pwdata,pready,trans);
endinterface:apb_interface
