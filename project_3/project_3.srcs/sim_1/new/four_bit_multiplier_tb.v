`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 17:58:09
// Design Name: 
// Module Name: four_bit_multiplier_tb
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


module four_bit_multiplier_tb;
    reg [3:0] A, B;
    wire [7:0] P;

    // Instantiate the 4-bit multiplier
    four_bit_multiplier uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        // Test cases
        A = 4'b0001; B = 4'b0010; #10; // 1 * 2 = 2
        A = 4'b0011; B = 4'b0101; #10; // 3 * 5 = 15
        A = 4'b0110; B = 4'b0110; #10; // 6 * 6 = 36
        A = 4'b1111; B = 4'b0001; #10; // 15 * 1 = 15
        A = 4'b1001; B = 4'b0011; #10; // 9 * 3 = 27
        $finish;
    end
endmodule

