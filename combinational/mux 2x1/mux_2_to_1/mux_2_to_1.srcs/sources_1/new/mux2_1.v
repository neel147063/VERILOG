`timescale 1ns / 1ps
module mux2_1(input a,input b,input s0,output y);
    wire w0,w1,w2;
    not n0(w0,s0);
    and a0(w1,w0,a);
    and a1(w2,s0,b);
    or o1(y,w2,w1);
endmodule
