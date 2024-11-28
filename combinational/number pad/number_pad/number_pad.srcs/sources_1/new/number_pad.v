`timescale 1ns / 1ps
module number_pad(input [7:0]e,output [7:0]d, input en);
    wire [2:0]w;
    encoder_8_3 en0(.e(e[7:0]),.a(w[2:0]));
    decoder_3_8 de0(.a(w[0]),.b(w[1]),.c(w[2]),.en(en),.d(d[7:0]));
endmodule

module encoder_8_3(input [7:0]e,output [2:0]a);
    or o0(a[0],e[4],e[5],e[6],e[7]);
    or o1(a[1],e[2],e[3],e[6],e[7]);
    or o2(a[2],e[1],e[3],e[5],e[7]);
endmodule

module decoder_3_8(input a,input b ,input c,input en ,output [7:0]d);
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
endmodule

