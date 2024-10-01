module IR(
    input wire [7:0] data_bus_in,
    input wire ld_ir,
    input wire clk,
    output wire [7:0] ir_out
);

    reg [7:0] ir_register;

    always @(posedge clk) begin
        if (ld_ir) begin
            ir_register <= data_bus_in;
        end
    end

    assign ir_out = ir_register;

endmodule
