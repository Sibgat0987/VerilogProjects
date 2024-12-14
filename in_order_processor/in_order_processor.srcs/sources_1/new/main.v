module Testbench;
    reg clk;
    reg reset;

    // Instantiate the processor
    InOrderProcessor uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Expected results for each instruction
    reg [7:0] expected_results [0:5];
    initial begin
        expected_results[0] = 8'h06; // ADD: 4 + 2 = 6
        expected_results[1] = 8'h02; // SUB: 4 - 2 = 2
        expected_results[2] = 8'h00; // AND: 4 & 2 = 0
        expected_results[3] = 8'h06; // OR:  4 | 2 = 6
        expected_results[4] = 8'h00; // XOR: 4 ^ 2 = 0
        expected_results[5] = 8'hF9; // NOR: ~(4 | 2) = 249
    end

    // Instruction verification counter
    integer verify_count = 0;

    // Monitor WRITEBACK stage for verification
    always @(posedge clk) begin
        if (uut.current_state == uut.WRITEBACK) begin
            if (uut.PC <= 5) begin
                if (uut.alu_result === expected_results[verify_count]) begin
                    $display("Result verified: PC=%0d, Expected %h, Got %h", 
                        uut.PC, expected_results[verify_count], uut.alu_result);
                end else begin
                    $display("Result mismatch: PC=%0d, Expected %h, Got %h", 
                        uut.PC, expected_results[verify_count], uut.alu_result);
                end
                verify_count = verify_count + 1;
            end
        end
    end

    // Simulation initialization and control
    initial begin
        // Initialize waveform dump
        $dumpfile("processor.vcd");
        $dumpvars(0, Testbench);

        // Initialize signals
        clk = 0;
        reset = 1;

        // Release reset after 2 clock cycles
        #20 reset = 0;

        // Run for enough cycles to complete all instructions
        #250;

        $finish;
    end
endmodule