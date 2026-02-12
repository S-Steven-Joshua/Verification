class async_coverage;
logic clear;
covergroup cg;
coverpoint clear;
endgroup:cg

function new();
    cg=new();
endfunction:new

function void sample(logic clear);
    this.clear=clear;
    cg.sample();
endfunction:sample

endclass:async_coverage