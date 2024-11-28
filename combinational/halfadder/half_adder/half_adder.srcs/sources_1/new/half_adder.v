module half_adder(input a,input b,output sum,output carry);
    xor x0(sum,a,b);
    and a0(carry,a,b);
endmodule
