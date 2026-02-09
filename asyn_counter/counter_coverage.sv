class counter_coverage;
logic rst,t;
covergroup cg;
    coverpoint rst;
    coverpoint t;
    cross rst,t;
endgroup:cg

function new();
    cg=new();
endfunction:new 

function void sample(logic rst,logic t);
    this.rst=rst;
    this.t=t;
    cg.sample();
endfunction:sample
endclass:counter_coverage
