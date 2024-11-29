`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 23:32:50
// Design Name: 
// Module Name: multiplier_4bit
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


module multiplier_4bit(input [3:0]a,b,output [7:0]y);
wire [3:0]m0;
wire [4:0]m1;
wire [5:0]m2;
wire [6:0]m3;
wire [7:0]s0,s1,s3;
//https://www.youtube.com/watch?v=AxrlH7vHOpw
assign m0={{4{a[0]}}&b[3:0]};
assign m1={{4{a[1]}}&b[3:0]};
assign m2={{4{a[2]}}&b[3:0]};
assign m3={{4{a[3]}}&b[3:0]};

assign s0=m0+(m1<<1);
assign s1=s0+(m2<<2);
assign s3=s1+(m3<<3);
assign y=s3;
endmodule
