class d_txn;
randc bit  d;
bit rst;
bit exp_q,exp_qbar;
// constraint input_vector{
//     d==vector[0];
//     rst==vector[1];
// }
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
endfunction:calc_expected
endclass:d_txn
