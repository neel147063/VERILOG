`timescale 1ns / 1ps
module full_subtractor(input a, input b, input cin, output d, output b0);
    wire w0,w1,w2;
    half_subtractor hs0(.a(a),.b(b),.d(w0),.b0(w1));
    half_subtractor hs1(.a(w0),.b(cin),.d(d),.b0(w2));
    or a0(b0,w2,w1);
endmodule

module half_subtractor(input a,input b,output d,output b0);
    wire w0;
    xor x0(d,a,b);
    not n0(w0,a);
    and a0(b0,w0,b);
endmodule
