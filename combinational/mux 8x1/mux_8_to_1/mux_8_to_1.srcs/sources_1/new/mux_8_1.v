`timescale 1ns / 1ps
module mux_8_1(input [7:0]i,input [2:0]s,output y);
    wire [1:0]w;
    mux4_1 mux0(.i(i[3:0]),.s(s[1:0]),.y(w[0]));
    mux4_1 mux1(.i(i[7:4]),.s(s[1:0]),.y(w[1]));
    mux2_1 mux4(.a(w[0]),.b(w[1]),.s(s[2]),.y(y));
endmodule

module mux4_1(input [3:0]i, input [1:0]s,output y);
    wire [1:0]w;
    mux2_1 mux0(.a(i[0]),.b(i[1]),.s(s[0]),.y(w[0]));
    mux2_1 mux1(.a(i[2]),.b(i[3]),.s(s[0]),.y(w[1]));
    mux2_1 mux3(.a(w[0]),.b(w[1]),.s(s[1]),.y(y));
endmodule

module mux2_1(input a,input b,input s,output y);
    wire w0,w1,w2;
    not n0(w0,s);
    and a0(w1,w0,a);
    and a1(w2,s,b);
    or o1(y,w2,w1);
endmodule