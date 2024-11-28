`timescale 1ns / 1ps
module demux_1_2(input s0,input i1,output [1:0]i);
    wire w0;
    not n0(w0,s0);
    and a0(i[0],w0,i1);
    and a1(i[1],s0,i1);
endmodule
