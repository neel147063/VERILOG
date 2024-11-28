`timescale 1ns / 1ps
module PIPO_register(input [3:0]i,input clk,reset,output wire [3:0]dout);
    d_ff dff0(.d(i[0]),.clk(clk),.reset(reset),.q(dout[0]));
    d_ff dff1(.d(i[1]),.clk(clk),.reset(reset),.q(dout[1]));
    d_ff dff2(.d(i[2]),.clk(clk),.reset(reset),.q(dout[2]));
    d_ff dff3(.d(i[3]),.clk(clk),.reset(reset),.q(dout[3]));
endmodule

module d_ff(input d,clk,reset,output reg q);
    always @(posedge clk) begin
        if(reset==1)
            q<=0;
        else
            q<=d;
    end
endmodule 
