`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 02:30:43
// Design Name: 
// Module Name: barrel_shifter_4bit
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

module barrel_shifter_4bit(input [3:0]i,[1:0]s,output[3:0]y);
    mux4_1 mux0(.i0(i[0]),.i1(i[1]),.i2(i[2]),.i3(i[3]),.s(s),.y(y[0]));
    mux4_1 mux1(.i0(i[1]),.i1(i[2]),.i2(i[3]),.i3(i[0]),.s(s),.y(y[1]));
    mux4_1 mux2(.i0(i[2]),.i1(i[3]),.i2(i[0]),.i3(i[1]),.s(s),.y(y[2]));
    mux4_1 mux3(.i0(i[3]),.i1(i[0]),.i2(i[1]),.i3(i[2]),.s(s),.y(y[3]));
endmodule

module mux4_1(input i0,i1,i2,i3,[1:0]s,output reg y);
 always @(*)begin
        case(s)
            2'b00:y=i0;
            2'b01:y=i1;
            2'b10:y=i2;
            2'b11:y=i3;
        endcase
    end
endmodule 
