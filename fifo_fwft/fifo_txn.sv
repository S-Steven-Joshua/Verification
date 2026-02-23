class fifo_txn #(parameter depth=8,width=8);
rand logic  rst,w_en,r_en;
rand logic  [width-1:0] data_in;
logic [width-1:0] data_out;
logic full,empty;

//constraint 
constraint rst_value{rst dist{1:=5,0:=95};}
constraint w_en_value{w_en dist{1:=80,0:=20};}
constraint r_en_value{r_en dist{1:=90,0:=10};}
constraint data_in_value{data_in inside{[0:(1<<width)-1]};}

static logic [width-1:0] queue[$];
function void calc_expected();
    if(rst)
        begin
            queue.delete();
            full=0;
            empty=1;
        end
    else
        begin
            if(w_en && !full)
                begin
                    queue.push_back(data_in);
                end
            if(r_en && !empty)
                begin
                    data_out=queue.pop_front();
                end
            full=(queue.size()==depth);
            empty=(queue.size()==0);
        end
endfunction:calc_expected
endclass:fifo_txn
