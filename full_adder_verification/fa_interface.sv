interface fa_interface;
    logic a,b,cin,sum,carry;
    modport tb(output a,b,cin,input sum,carry);
    modport dut(input a,b,cin,output sum,carry);
endinterface: fa_interface
