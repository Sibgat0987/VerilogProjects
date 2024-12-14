module ALU (
    input [7:0] A,
    input [7:0] B,
    input [2:0] OpCode,
    output reg [7:0] Result,
    output reg Zero,
    output reg Carry,
    output reg Overflow,
    output reg Negative
);
    always @(*) begin
        // Default values for outputs
        Result = 8'b0;
        Carry = 1'b0;
        Overflow = 1'b0;

        case (OpCode)
            3'b000: begin // Addition
                {Carry, Result} = A + B;
                Overflow = (A[7] == B[7]) && (Result[7] != A[7]);
            end
            3'b001: begin // Subtraction
                Result = A - B;
                Carry = (A < B);
                Overflow = (A[7] != B[7]) && (Result[7] == B[7]);
            end
            3'b010: Result = A & B; // Bitwise AND
            3'b011: Result = A | B; // Bitwise OR
            3'b100: Result = A ^ B; // Bitwise XOR
            3'b101: Result = ~(A | B); // Bitwise NOR
            default: Result = 8'b0;
        endcase

        // Update status flags
        Zero = (Result == 8'b0);
        Negative = Result[7];
    end
endmodule
