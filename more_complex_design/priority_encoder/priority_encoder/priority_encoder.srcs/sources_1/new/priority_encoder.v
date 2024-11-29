`timescale 1ns / 1ps
module priority_encoder(input [7:0]d,output reg a,b,c);
    always @(*)begin
        a=((d[4]&~d[5]&~d[6]&~d[7])|(d[5]&~d[6]&~d[7])|(d[6]&~d[7])|(d[7]));
        b=((d[2]&~d[3]&~d[4]&~d[5]&~d[6]&~d[7])|(d[3]&~d[4]&~d[5]&~d[6]&~d[7])|(d[6]&~d[7])|(d[7]));
        c=((d[1]&~d[2]&~d[3]&~d[4]&~d[5]&~d[6]&~d[7])|(d[3]&~d[4]&~d[5]&~d[6]&~d[7])|(d[5]&~d[6]&~d[7])|(d[7]));
    end
endmodule
