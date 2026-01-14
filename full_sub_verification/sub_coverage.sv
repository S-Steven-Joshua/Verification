class sub_coverage;
bit a,b,bin;
covergroup cg;
    coverpoint a;
    coverpoint b;
    coverpoint bin;
    cross a,b,bin;
endgroup:cg
function new();
cg=new();
endfunction:new

function void sample(bit a,bit b,bit bin);
this.a=a;
this.b=b;
this.bin=bin;
cg.sample();
endfunction:sample
endclass:sub_coverage
