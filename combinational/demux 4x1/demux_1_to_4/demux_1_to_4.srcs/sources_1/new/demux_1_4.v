`timescale 1ns / 1ps
module demux_1_4(input i0,input [1:0]s,output [3:0]i);
    wire [1:0]w;
    demux_1_2 dm0(.s(s[1]),.i1(i0),.i(w[1:0]));
    demux_1_2 dm1(.s(s[0]),.i1(w[0]),.i(i[1:0]));
    demux_1_2 dm2(.s(s[0]),.i1(w[1]),.i(i[3:2]));
endmodule

module demux_1_2(input s,input i1,output [1:0]i);
    wire w0;
    not n0(w0,s);
    and a0(i[0],w0,i1);
    and a1(i[1],s,i1);
endmodule
