`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2024 18:05:51
// Design Name: 
// Module Name: FourBitDivider
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


module four_bit_divider(
    input [3:0] Dividend,
    input [3:0] Divisor,
    output reg [3:0] Quotient,
    output reg [3:0] Remainder
);

integer i;

always @(*) begin
    Quotient = 0;
    Remainder = 0;
    for (i = 3; i >= 0; i = i - 1) begin
        Remainder = Remainder << 1;
        Remainder[0] = Dividend[i];
        if (Remainder >= Divisor) begin
            Remainder = Remainder - Divisor;
            Quotient[i] = 1;
        end
    end
end

endmodule
