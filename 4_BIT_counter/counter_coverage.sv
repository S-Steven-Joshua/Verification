class counter_coverage;
logic  rst,control;
covergroup cg;
    coverpoint rst;
    coverpoint control;
    cross rst,control;
endgroup:cg

function new();
    cg=new();
endfunction:new

function void sample(logic  rst,logic  control);
    this.rst=rst;
    this.control=control;
    cg.sample();
endfunction:sample
endclass:counter_coverage
