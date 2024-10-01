module PC(
    input wire [5:0] ir_out,
    input wire ld_pc,
    input wire inc_pc,
    input wire clr_pc,
    input wire clk,
    output wire [5:0] pc_out
);

    reg [5:0] program_counter;

    always @(posedge clk) begin
        if (clr_pc) begin
            program_counter <= 6'b0;
        end else if (ld_pc) begin
            program_counter <= ir_out;
        end else if (inc_pc) begin
            program_counter <= program_counter + 1;
        end
    end

    assign pc_out = program_counter;

endmodule
