`timescale 1ns / 1ps
module ms2(input j,k,clk,reset,output q);
    wire w0;
    jk_ff jkff(.j(j),.k(k),.clk(clk),.reset(reset),.q(w0));
    sr_ff srff(.s(w0),.r(~w0),.clk(clk),.reset(reset),.q(q));
endmodule

module jk_ff(input j,k,clk,reset,output reg q);
    always @(posedge clk ) begin 
        if(reset==1)
            q<=0;
        else
            case({j,k})
                2'b00:q<=q;
                2'b01:q<=0;
                2'b10:q<=1;
                2'b11:q<=~q;
            endcase 
    end
endmodule

module sr_ff(input s,r,clk,reset,output reg q);
    always @(negedge clk )begin
        if(reset==1)
            q<=0;
        else 
            case({s,r})
                2'b00:q<=q;
                2'b01:q<=0;
                2'b10:q<=1;
                2'b11:q<=1'bx;
            endcase
    end
endmodule
