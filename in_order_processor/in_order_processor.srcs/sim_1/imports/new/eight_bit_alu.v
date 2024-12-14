`timescale 1ns / 1ps

module ALU (
    input [7:0] A,
    input [7:0] B,
    input [2:0] sel,
    output reg [7:0] Result,
    output Zero
);

    always @(*) begin
        case (sel)
            3'b000: Result = A + B;      // Add
            3'b001: Result = A - B;      // Subtract
            3'b010: Result = A & B;      // AND
            3'b011: Result = A | B;      // OR
            3'b100: Result = A ^ B;      // XOR
            3'b101: Result = ~(A | B);   // NOR
            default: Result = 8'b00000000; // Default to 0
        endcase
    end

    assign Zero = (Result == 8'b00000000);

endmodule


