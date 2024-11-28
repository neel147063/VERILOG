`timescale 1ns / 1ps
module comparator_2bit(input [1:0]a,input [1:0]b,output x,output y, output z);
    wire [11:0]w;
    not n0(w[0],a[0]);
    not n1(w[1],a[1]);
    not n2(w[2],b[0]);
    not n3(w[3],b[1]);
    //a>b
    and a0(w[4],a[1],w[3]);
    and a1(w[5],a[0],w[3],w[2]);
    and a2(w[6],a[1],a[0],w[2]);
    or o0(x,w[4],w[5],w[6]);
    //a<b
    and a3(w[7],b[1],w[1]);
    and a4(w[8],b[0],w[1],w[0]);
    and a5(w[9],b[1],b[0],w[0]);
    or o1(y,w[7],w[8],w[9]);
    //a=b
    xnor xn0(w[10],a[0],b[0]);
    xnor xn1(w[11],a[1],b[1]);
    and a6(z,w[10],w[11]);
endmodule
