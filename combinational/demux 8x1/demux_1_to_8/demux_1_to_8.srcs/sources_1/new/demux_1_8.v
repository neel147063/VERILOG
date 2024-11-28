`timescale 1ns / 1ps
module demux_1_8(input din ,input [2:0]s,output [7:0]i);
    wire [1:0]w;
    demux_1_2 dm0(.din(din),.s(s[2]),.i(w[1:0]));
    demux_1_4 dm1(.din(w[0]),.s(s[1:0]),.i(i[3:0]));
    demux_1_4 dm2(.din(w[1]),.s(s[1:0]),.i(i[7:4]));
endmodule

module demux_1_4(input din,input [1:0]s,output [3:0]i);
    wire [1:0]w;
    demux_1_2 dm0(.s(s[1]),.din(din),.i(w[1:0]));
    demux_1_2 dm1(.s(s[0]),.din(w[0]),.i(i[1:0]));
    demux_1_2 dm2(.s(s[0]),.din(w[1]),.i(i[3:2]));
endmodule

module demux_1_2(input s,input din,output [1:0]i);
    wire w0;
    not n0(w0,s);
    and a0(i[0],w0,din);
    and a1(i[1],s,din);
endmodule