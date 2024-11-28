`timescale 1ns / 1ps
module SIPO_register(input clk,reset,din,output [3:0]dout);
    d_ff dff0(.d(din),.clk(clk),.reset(reset),.q(dout[0]));
    d_ff dff1(.d(dout[0]),.clk(clk),.reset(reset),.q(dout[1]));
    d_ff dff2(.d(dout[1]),.clk(clk),.reset(reset),.q(dout[2]));
    d_ff dff3(.d(dout[2]),.clk(clk),.reset(reset),.q(dout[3]));
endmodule

module d_ff(input d,clk,reset,output reg q);
    always @(posedge clk)begin
        if (reset==1)
            q<=0;
        else
            q<=d;
    end
endmodule
