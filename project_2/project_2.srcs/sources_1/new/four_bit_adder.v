`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 17:19:06
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder(
    input [3:0] A,   // 4-bit input A
    input [3:0] B,   // 4-bit input B
    input Cin,       // Carry-in
    output [3:0] Sum, // 4-bit Sum output
    output Cout      // Carry-out
);

wire C1, C2, C3;

full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin),   .Sum(Sum[0]), .Cout(C1));
full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C1),    .Sum(Sum[1]), .Cout(C2));
full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(C2),    .Sum(Sum[2]), .Cout(C3));
full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(C3),    .Sum(Sum[3]), .Cout(Cout));

endmodule

module full_adder(
    input A, B, Cin,
    output Sum, Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
