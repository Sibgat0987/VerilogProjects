`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 18:07:04
// Design Name: 
// Module Name: four_bit_divider_tb
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


module four_bit_divider_tb;
    reg [3:0] Dividend, Divisor;
    wire [3:0] Quotient, Remainder;

    // Instantiate the 4-bit divider
    four_bit_divider uut (
        .Dividend(Dividend),
        .Divisor(Divisor),
        .Quotient(Quotient),
        .Remainder(Remainder)
    );

    initial begin
        // Test cases
        Dividend = 4'b1010; Divisor = 4'b0010; #10; // 10 / 2
        Dividend = 4'b1100; Divisor = 4'b0011; #10; // 12 / 3
        Dividend = 4'b1111; Divisor = 4'b0101; #10; // 15 / 5
        Dividend = 4'b0110; Divisor = 4'b0010; #10; // 6 / 2
        Dividend = 4'b1001; Divisor = 4'b0011; #10; // 9 / 3
        $finish;
    end
endmodule

