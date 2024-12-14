`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 18:13:36
// Design Name: 
// Module Name: four_bit_equality_comparator_tb
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


module four_bit_equality_comparator_tb;
    reg [3:0] A, B;
    wire eq;

    // Instantiate the 4-bit equality comparator
    four_bit_equality_comparator uut (
        .A(A),
        .B(B),
        .eq(eq)
    );

    initial begin
        // Test cases
        A = 4'b0000; B = 4'b0000; #10; // eq should be 1
        A = 4'b0001; B = 4'b0010; #10; // eq should be 0
        A = 4'b0110; B = 4'b0110; #10; // eq should be 1
        A = 4'b1111; B = 4'b1110; #10; // eq should be 0
        $finish;
    end
endmodule

