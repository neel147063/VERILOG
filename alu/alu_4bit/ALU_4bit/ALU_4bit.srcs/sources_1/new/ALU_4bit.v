`timescale 1ns / 1ps
module ALU_4bit(input [3:0]a,b,[2:0]sel,output qf,zf,[3:0]r);
    reg [4:0]rtemp;
    always @(*)begin
        case(sel)
            3'b000:rtemp=a+b;
            3'b001:rtemp=a-b;
            3'b010:rtemp=a*b;
            3'b011:rtemp=(b!=0)?a/b:5'b0;
            3'b100:rtemp=a&b;
            3'b101:rtemp=a|b;
            3'b110:rtemp=a^b;
            3'b111:rtemp=(a==b)?5'b1:5'b0;
            default:rtemp=5'b0;
        endcase 
    end
    assign r=rtemp[3:0];
    assign qf=rtemp[4];
    assign zf=(rtemp[3:0]==4'b0);
endmodule
