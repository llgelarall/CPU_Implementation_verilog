module ACII(
    input wire [7:0] data_bus_out,
    input wire ld_acii,
    input wire clk,
    output wire [7:0] acii_out
);
    reg [7:0] accumulatorii;

    always @(posedge clk) begin
        if (ld_acii) begin
            accumulatorii <= {3'b000, data_bus_out[4:0]};
        end
    end
    assign acii_out = accumulatorii;

endmodule
