`timescale 1ns / 1ps
module full_adder(input a, input b, input cin ,output s,output c);
    wire w0,w1,w2;
    half_adder ha0(.a(a),.b(b),.c(w1),.s(w0));
    half_adder ha1(.a(w0),.b(cin),.c(w2),.s(s));
    or o0(c,w2,w1);
endmodule

module half_adder(input a,input b,output s,output c);
    xor x0(s,a,b);
    and a0(c,a,b);
endmodule