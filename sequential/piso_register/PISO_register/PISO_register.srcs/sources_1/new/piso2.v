`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2024 10:53:40
// Design Name: 
// Module Name: piso2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module piso2(
    input wire clk,        // Clock signal
    input wire reset,      // Reset signal (active high)
    input wire load,       // Load signal (active high)
    input wire [3:0] data_in, // Parallel input (4-bit)
    output reg serial_out  // Serial output
);

    reg [3:0] shift_reg; // 4-bit shift register

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Asynchronous reset
            shift_reg <= 4'b0;
            serial_out <= 1'b0;
        end
        else if (load) begin
            // Load parallel data into shift register
            shift_reg <= data_in;
        end
        else begin
            // Shift right and output MSB
            serial_out <= shift_reg[3];
            shift_reg <= {shift_reg[2:0], 1'b0}; // Shift left with 0 padding
        end
    end

endmodule

