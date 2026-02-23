module fifo #(parameter depth=8,width=8)(
    input logic clk,
    input logic rst,
    input logic w_en,
    input logic r_en,
    input logic [width-1:0] data_in,
    output logic [width-1:0] data_out,
    output logic full,
    output logic empty
);
parameter ptr_width=$clog2(depth);
logic [ptr_width:0] w_ptr,r_ptr;
logic [width-1:0] array[depth-1:0];
//logic wrap;

// always_ff @(posedge clk)
//     begin
//         if(rst)
//             w_ptr<=0;
//             r_ptr<=0;
//     end

always_ff @(posedge clk)
    begin 
        if(rst)
            begin
                w_ptr<=0;
            end
        else if(w_en && !full)
            begin
                array[w_ptr[ptr_width-1:0]]<=data_in;
                w_ptr<=w_ptr+1;
            end
    end
always_ff @(posedge clk)
    begin
        if(rst)
            begin
                r_ptr<=0;
                //data_out<=0;
            end
        else if(r_en && !empty)
            begin
                r_ptr<=r_ptr+1;
                //data_out<=array[r_ptr[ptr_width-1:0]];
            end
    end
assign data_out=array[r_ptr[ptr_width-1:0]];

assign empty=(r_ptr==w_ptr);
assign full=(r_ptr[ptr_width]!=w_ptr[ptr_width])&(r_ptr[ptr_width-1:0]==w_ptr[ptr_width-1:0]);
endmodule:fifo