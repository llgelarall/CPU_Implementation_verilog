module CPU(
    input wire reset,
    input wire clk,
    input wire [7:0] data_bus_in,
    output wire [5:0] adr_bus,
    output wire rd_mem,
    output wire wr_mem,
    output wire [7:0] data_bus_out
);

    wire ir_on_adr, pc_on_adr, ld_ir, ld_ac, ld_pc, inc_pc, clr_pc, source_ac;
    wire [1:0] pass_add;
    wire [2:0] op_code;

    Controller cu(
        reset, clk, op_code, 
        rd_mem, wr_mem,
        ir_on_adr, pc_on_adr, ld_ir, ld_ac, ld_pc,
        ld_acii, sel_acii, sel_ir, sel_zero,
        inc_pc, clr_pc, source_ac, pass_add);
    DataPath dp(clk,
        ir_on_adr, pc_on_adr, ld_ir, ld_ac, ld_pc, inc_pc, clr_pc, source_ac, pass_add,
        ld_acii, sel_acii, sel_ir, sel_zero,
        adr_bus, op_code, data_bus_in, data_bus_out);

endmodule