`timescale 1ns / 1ps
module decoder_1_2(input a,input b ,input c,input en ,output [7:0]d,output y);
    wire [2:0]w;
    not n0(w[0],a);
    not n1(w[1],b);
    not n2(w[2],c);
    and a0(d[0],w[0],w[1],w[2],en);
    and a1(d[1],w[0],w[1],c,en);
    and a2(d[2],w[0],b,w[2],en);
    and a3(d[3],w[0],b,c,en);
    and a4(d[4],a,w[1],w[2],en);
    and a5(d[5],a,w[1],c,en);
    and a6(d[6],a,b,w[2],en);
    and a7(d[7],a,b,c,en);
    or o0(y,d[0],d[1],d[2],d[3],d[7]);  
endmodule
