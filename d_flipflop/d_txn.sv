class d_txn;
rand bit  d,rst;
constraint rst_dist{rst dist{0:=95,1:=5};}
bit exp_q,exp_qbar;
// constraint input_vector{
//     d==vector[0];
//     rst==vector[1];
// }
//constraint input_constrait{d inside{0,1}; rst inside{0,1};}
function void calc_expected();
    if(rst)
    begin
        exp_q=0;
        exp_qbar=1;
    end
    else
    begin
        exp_q=d;
        exp_qbar=~d;
    end
    exp_q=d;
    exp_qbar=~d;
    //$display("The value of q=%0d and d is %0d and the reset is %0d at time=%0d",exp_q,d,rst,$time);
endfunction:calc_expected
endclass:d_txn
