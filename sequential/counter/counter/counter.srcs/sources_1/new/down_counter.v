`timescale 1ns / 1ps
module up_down_counter(input t,reset,clk,output [3:0]qbar,q);
    t_ff tff0(.t(1'b1),.clk(clk),.reset(reset),.q(q[0]),.qbar(qbar[0]));
    t_ff tff1(.t(1'b1),.clk(q[0]),.reset(reset),.q(q[1]),.qbar(qbar[1]));
    t_ff tff2(.t(1'b1),.clk(q[1]),.reset(reset),.q(q[2]),.qbar(qbar[2]));
    t_ff tff3(.t(1'b1),.clk(q[2]),.reset(reset),.q(q[3]),.qbar(qbar[3]));
endmodule

module t_ff(input t,clk,reset,output qbar,reg q);
    assign qbar=~q;
    always @(negedge clk)begin
       if (reset==1)
        q<=0;
       else
        q<=~q; 
    end
endmodule