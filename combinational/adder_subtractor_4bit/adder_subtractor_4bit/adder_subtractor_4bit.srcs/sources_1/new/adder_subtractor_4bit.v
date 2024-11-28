`timescale 1ns / 1ps
module adder_subtractor_4bit(a,b,c,s,cin);
    input [3:0]a,b;
    input cin;
    output [3:0]s;
    output c;
    wire w0,w1,w2,w3,w4,w5,w6;
    xor x0(w0,cin,b[0]);
    xor x1(w1,cin,b[1]);
    xor x2(w2,cin,b[2]);
    xor x3(w3,cin,b[3]);
    full_adder fa0(.a(a[0]),.b(w0),.cin(cin),.s(s[0]),.c(w4));
    full_adder fa1(.a(a[1]),.b(w1),.cin(w4),.s(s[1]),.c(w5));
    full_adder fa2(.a(a[2]),.b(w2),.cin(w5),.s(s[2]),.c(w6));
    full_adder fa3(.a(a[3]),.b(w3),.cin(w6),.s(s[3]),.c(c));
endmodule

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
