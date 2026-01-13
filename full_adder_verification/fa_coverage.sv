class fa_coverage;
bit a,b,cin;
covergroup cg;
    coverpoint a;
    coverpoint b;
    coverpoint cin;
endgroup:cg

function new();
cg=new();
endfunction:new

function void sample(bit a,bit b,bit cin);
cg.sample();
endfunction:sample
endclass:fa_coverage
