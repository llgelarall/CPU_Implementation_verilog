module DataPath(
    input wire clk,
    input wire ir_on_adr,
    input wire pc_on_adr,
    input wire ld_ir,
    input wire ld_ac,
    input wire ld_pc,
    input wire inc_pc,
    input wire clr_pc,
    input wire source_ac,
    input wire [1:0]pass_add,
    input wire ld_acii,
    input wire sel_acii,
    input wire sel_ir,
    input wire sel_zero,
    output wire [5:0] adr_bus,
    output wire [2:0] op_code,
    input wire [7:0] data_bus_in,
    output wire [7:0] data_bus_out
);

    reg [7:0] AC;
    reg [7:0] IR;
    reg [5:0] PC;
    wire [7:0] ir_out;
    wire [5:0] pc_out;
    wire [7:0] a_side;
    wire [7:0] aii_side;
    wire [7:0] operand2;

    IR ir(data_bus_in, ld_ir, clk, ir_out);
    PC pc(aii_side[4:0], ld_pc, inc_pc, clr_pc, clk, pc_out);
    AC ac(data_bus_in, data_bus_out, ld_ac, source_ac, clk, a_side);
    ACII acii(data_bus_out, ld_acii, clk, aii_side);
    ALU alu(a_side, operand2, pass_add, data_bus_out);

    assign operand2 = (sel_acii) ? aii_side : (sel_ir) ? {3'b000, ir_out[4:0]} : (sel_zero) ? 8'b00000000 : 8'b0;
    assign adr_bus = ir_on_adr ? ir_out[4:0] : pc_on_adr ? pc_out : 6'b0;
    assign op_code = ir_out[7:5];
endmodule
