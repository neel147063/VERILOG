`timescale 1ns / 1ps
module encoder_8_3(input [7:0]e,output [2:0]a);
    or o0(a[2],e[4],e[5],e[6],e[7]);
    or o1(a[1],e[2],e[3],e[6],e[7]);
    or o2(a[0],e[1],e[3],e[5],e[7]);
endmodule
