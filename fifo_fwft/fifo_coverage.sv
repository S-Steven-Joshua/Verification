class fifo_coverage #(parameter depth=8,width=8);
logic rst,w_en,r_en;
covergroup cg;
    coverpoint rst;
    coverpoint w_en;
    coverpoint r_en;
    cross rst,w_en,r_en;
endgroup:cg

function new();
    this.cg=new();
endfunction:new

function void sample(logic rst,w_en,r_en);
    this.rst=rst;
    this.w_en=w_en;
    this.r_en=r_en;
    cg.sample();
endfunction:sample
endclass:fifo_coverage
