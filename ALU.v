module ALU(
    input wire [7:0] operand1, // Input operand 1
    input wire [7:0] operand2, // Input operand 2
    input wire [1:0] add_enable,     // Control signal to enable addition
    output reg [7:0] result   // ALU result
);

    always @(*) begin
        if (add_enable==2'b01) begin
            result = operand1 + operand2; // Perform addition
        end else if (add_enable==2'b10) begin
            result = operand1 - operand2;
        end else if (add_enable==2'b11) begin
            result =operand2;
        end else begin
            result = operand1; // Output 0 if addition is not enabled
        end
    end

endmodule
