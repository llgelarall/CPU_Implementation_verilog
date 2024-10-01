module AC(
    input wire [7:0] data_bus_in,
    input wire [7:0] data_bus_out,
    input wire ld_ac,
    input wire source_ac,
    input wire clk,
    output wire [7:0] ac_out
);

    reg [7:0] accumulator;

    always @(posedge clk) begin
        if (ld_ac) begin
            if (source_ac) begin
                accumulator <= {3'b000, data_bus_out[4:0]};
            end else begin
                accumulator <= {3'b000, data_bus_in[4:0]};
            end
        end
    end

    assign ac_out = accumulator;

endmodule
