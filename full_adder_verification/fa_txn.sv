class fa_txn;
rand bit a,b,cin;//random inputs 
bit exp_sum,exp_carry;//expected output

constraint input_valid_values{a inside {0,1}; b inside {0,1}; cin inside {0,1};}//constraint for input values


function void calc_expected();
    exp_sum=a^b^cin;//assign the boolean expression to the sum
    exp_carry=(a&b)|(b&cin)|(cin&a);
endfunction:calc_expected

function void display(string tag);
    $display("[%s] a=%0b b=%0b cin=%0b expected_sum=%0b expected_carry=%0b",tag,a,b,cin,exp_sum,exp_carry);//display the values of a,b,cin
endfunction:display
endclass:fa_txn