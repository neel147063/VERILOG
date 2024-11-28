`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2024 14:28:02
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder(input a,input b,input c,output sum,output carry);
    wire w0,w1,w2;
    half_adder ha0( .sum(w0), .carry(w1), .a(a), .b(b));
    half_adder ha1( .sum(sum), .carry(w2),.a(w0),.b(c));
    or o0(carry,w2,w1);
endmodule

module half_adder(input a, input b,output sum,output carry);
    xor x0(sum,a,b);
    and a0(carry,a,b);
endmodule