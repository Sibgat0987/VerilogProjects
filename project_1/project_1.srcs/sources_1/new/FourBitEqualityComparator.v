`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 18:12:43
// Design Name: 
// Module Name: FourBitEqualityComparator
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


module four_bit_equality_comparator(
    input [3:0] A,  // 4-bit input A
    input [3:0] B,  // 4-bit input B
    output reg eq   // Output logic-1 if A == B
);

always @(*) begin
    if (A == B)
        eq = 1;
    else
        eq = 0;
end

endmodule

