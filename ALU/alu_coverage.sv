class alu_coverage;
logic [9:0] a,b;
logic [2:0] sel;
covergroup cg;
    coverpoint a;
    coverpoint b;
    coverpoint sel;
    cross a,b,sel;
endgroup:cg
function new();
    cg=new();
endfunction:new
function void sample(logic [9:0] a,logic [9:0] b,logic [2:0] sel);
    this.a=a;
    this.b=b;
    this.sel=sel;
    cg.sample();
endfunction:sample

endclass:alu_coverage
