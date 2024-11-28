`timescale 1ns / 1ps
module PISO_register(input [3:0]i,input clk,reset,s0,output dout);
    wire [2:0]d;
    wire [2:0]w;
    d_ff dff0(.d(i[0]),.clk(clk),.reset(reset),.q(d[0]));
    mux_2_1 mux0(.a(d[0]),.b(i[1]),.s0(s0),.y(w[0]));
    d_ff dff1(.d(w[0]),.clk(clk),.reset(reset),.q(d[1]));
    mux_2_1 mux1(.a(d[1]),.b(i[2]),.s0(s0),.y(w[1]));
    d_ff dff2(.d(w[1]),.clk(clk),.reset(reset),.q(d[2]));
    mux_2_1 mux2(.a(d[2]),.b(i[3]),.s0(s0),.y(w[2]));
    d_ff dff3(.d(w[2]),.clk(clk),.reset(reset),.q(dout));
endmodule

module mux_2_1(input a,b,s0,output y);
    wire [2:0]w;
    not n0(w[0],s0);
    and a0(w[1],w[0],a);
    and a1(w[2],b,s0);
    or o0(y,w[1],w[2]);
endmodule

module d_ff(input d,clk,reset,output reg q);
    always @(posedge clk) begin
        if (reset==1)
            q<=0;
        else
            q<=d;
    end
endmodule