class coverage;
logic prstn;
logic psel;
logic penable;
logic pwrite;
logic pready;
logic trans;

covergroup cg;
    coverpoint prstn;
    coverpoint psel;
    coverpoint penable;
    coverpoint pwrite;
    coverpoint pready;
    coverpoint trans;
    cross prstn,psel,penable,pwrite,pready,trans;
endgroup:cg

function new();
    this.cg=new();
endfunction:new 

function void sample(input prstn,psel,penable,pwrite,pready,trans);
    this.prstn=prstn;
    this.psel=psel;
    this.penable=penable;
    this.pwrite=pwrite;
    this.pready=pready;
    this.trans=trans;
    cg.sample();
endfunction:sample
endclass:coverage
