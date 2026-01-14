class sub_txn;
randc bit a,b,bin;
bit exp_diff,exp_bout;
constraint input_value{a inside{0,1};b inside{0,1};bin inside{0,1};}

function void calc_expected();
exp_diff=a^b^bin;
exp_bout=(~a&b)|(b&bin)|(~a&bin);
endfunction:calc_expected
endclass:sub_txn
