`timescale 1ns / 1ps
module siso_register(input din,clk,reset,output dout);
    wire [2:0]w;
    d_ff dff0(.d(din),.clk(clk),.reset(reset),.q(w[0]));
    d_ff dff1(.d(w[0]),.clk(clk),.reset(reset),.q(w[1]));
    d_ff dff2(.d(w[1]),.clk(clk),.reset(reset),.q(w[2]));
    d_ff dff3(.d(w[2]),.clk(clk),.reset(reset),.q(dout));
endmodule

module d_ff(input d,clk,reset,output reg q);
    always @(posedge clk)begin
        if (reset==1)
            q<=0;
        else
            q<=d;
    end
endmodule
