`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 17:57:03
// Design Name: 
// Module Name: four_bit_multiplier
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


module four_bit_multiplier(
    input [3:0] A,   // 4-bit input A
    input [3:0] B,   // 4-bit input B
    output [7:0] P   // 8-bit output Product
);

assign P = A * B;

endmodule

