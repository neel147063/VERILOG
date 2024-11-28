`timescale 1ns / 1ps

module johnson_counter_gate(input clk, reset, output [3:0] q);
    wire [3:0] qbar;  
    d_ff_gate dff0 (.d(qbar[3]), .clk(clk), .reset(reset), .q(q[0]), .qbar(qbar[0]));
    d_ff_gate dff1 (.d(q[0]), .clk(clk), .reset(reset), .q(q[1]), .qbar(qbar[1]));
    d_ff_gate dff2 (.d(q[1]), .clk(clk), .reset(reset), .q(q[2]), .qbar(qbar[2]));
    d_ff_gate dff3 (.d(q[2]), .clk(clk), .reset(reset), .q(q[3]), .qbar(qbar[3]));

endmodule


module d_ff_gate(input d, clk, reset, output reg q, output qbar);
    assign qbar=~q;
    always @(posedge clk) begin
        if (reset==1)
            q<=0;
        else 
            q<=d;
    end 
endmodule
