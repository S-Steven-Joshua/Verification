class d_coverage;
bit rst,d;
covergroup cg;
    coverpoint rst;
    coverpoint d;
    cross rst,d;
endgroup:cg

function new();
    cg=new();
endfunction:new

function void sample(bit rst,bit d);
    this.rst=rst;
    this.d=d;
    cg.sample();
endfunction:sample

endclass:d_coverage

