module Processor (
    input wire clk,
    input wire reset
);
    // FSM States
    localparam FETCH = 2'b00, 
               DECODE = 2'b01, 
               EXECUTE = 2'b10, 
               WRITEBACK = 2'b11;

    // Control signals and registers
    reg [1:0] current_state, next_state;
    reg [7:0] instruction_memory [0:31]; // Memory for instructions
    reg [7:0] registers [0:7];           // Register file
    reg [7:0] program_counter;           // Program Counter
    reg [7:0] current_instruction;       // Current instruction register
    reg [7:0] operand_A, operand_B;      // ALU operands
    wire [7:0] alu_output;               // ALU output
    reg [2:0] alu_opcode;                // ALU operation selector
    reg [2:0] destination_register;      // Target register for result
    wire zero_flag, carry_flag, overflow_flag, negative_flag;

    // Instantiate ALU
    ALU alu (
        .A(operand_A),
        .B(operand_B),
        .OpCode(alu_opcode),
        .Result(alu_output),
        .Zero(zero_flag),
        .Carry(carry_flag),
        .Overflow(overflow_flag),
        .Negative(negative_flag)
    );

    // Sequential logic for state transitions
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= FETCH;
            program_counter <= 8'b0;
            current_instruction <= 8'b0;
            alu_opcode <= 3'b0;
            operand_A <= 8'b0;
            operand_B <= 8'b0;
            for (integer i = 0; i < 8; i = i + 1)
                registers[i] <= 8'b0;
        end else begin
            current_state <= next_state;
        end
    end

    // Determine next state
    always @(*) begin
        case (current_state)
            FETCH: next_state = DECODE;
            DECODE: next_state = EXECUTE;
            EXECUTE: next_state = WRITEBACK;
            WRITEBACK: next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    // Instruction Fetch
    always @(posedge clk) begin
        if (current_state == FETCH) begin
            current_instruction <= instruction_memory[program_counter];
        end
    end

    // Instruction Decode
    always @(posedge clk) begin
        if (current_state == DECODE) begin
            alu_opcode <= current_instruction[7:5];
            destination_register <= current_instruction[4:3];
            operand_A <= registers[current_instruction[2:1]];
            operand_B <= registers[current_instruction[1:0]];
        end
    end

    // Program Counter update
    always @(posedge clk) begin
        if (current_state == WRITEBACK) begin
            if (program_counter < 31)
                program_counter <= program_counter + 1;
            else
                program_counter <= 0;
        end
    end

    // Initialize Instruction Memory
    initial begin
        registers[0] = 8'h00; 
        registers[1] = 8'h04;
        registers[2] = 8'h02;
        registers[3] = 8'h01;

        instruction_memory[0] = 8'b00000110; // ADD: R0 = R1 + R2
        instruction_memory[1] = 8'b00100110; // SUB: R0 = R1 - R2
        instruction_memory[2] = 8'b01000110; // AND: R0 = R1 & R2
        instruction_memory[3] = 8'b01100110; // OR:  R0 = R1 | R2
        instruction_memory[4] = 8'b10000110; // XOR: R0 = R1 ^ R2
        instruction_memory[5] = 8'b10100110; // NOR: R0 = ~(R1 | R2)
    end
endmodule
