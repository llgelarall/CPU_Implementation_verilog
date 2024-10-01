`define Reset 2'b00
`define Fetch 2'b01
`define Decode 2'b10
`define Execute 2'b11

module Controller(
    input reset,
    input clk,
    input wire [2:0] op_code,
    output reg rd_mem,
    output reg wr_mem,
    output reg ir_on_adr,
    output reg pc_on_adr,
    output reg ld_ir,
    output reg ld_ac,
    output reg ld_pc,
    output reg ld_acii,
    output reg sel_acii,
    output reg sel_ir,
    output reg sel_zero,
    output reg inc_pc,
    output reg clr_pc,
    output reg source_ac,
    output reg [1:0] pass_add
);

    reg [1:0] present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin
            present_state <= `Reset;
        end else begin
            present_state <= next_state;
        end
    end

    always @(present_state) begin
        rd_mem=1'b0; wr_mem=1'b0; ir_on_adr=1'b0; pc_on_adr=1'b0;
        ld_ir=1'b0; ld_ac=1'b0;
        ld_pc=1'b0; inc_pc=1'b0; clr_pc=1'b0; pass_add=2'b00; source_ac=1'b0;
        ld_acii=1'b0; sel_acii=1'b0; sel_ir=1'b0; sel_zero=2'b00;
        case (present_state)
            `Reset: begin
                next_state = `Fetch;
                clr_pc = 1'b1;
            end
            `Fetch: begin
                next_state = `Decode;
                pc_on_adr = 1'b1;
                rd_mem = 1'b1;
                ld_ir = 1'b1;
                inc_pc = 1'b1;
            end
            `Decode: begin
                next_state = `Execute;
            end
            `Execute: begin
                next_state = `Fetch;
                case (op_code)
                    3'b000: begin // load AC = mem[]
                        ir_on_adr = 1'b1;
                        rd_mem = 1'b1;
                        ld_ac = 1'b1;
                        // ld_ir = 1'b0;
                    end
                    3'b001: begin // load Ac2=ac
                        pass_add = 2'b00;
                        ld_acii = 1'b1;
                    end
                    3'b010: begin // Ac2=Ac+Ac2
                        pass_add = 2'b01;
                        ld_acii = 1'b1;
                        sel_acii = 1'b1;
                    end
                    3'b011: begin // write from Ac2
                        ir_on_adr = 1'b1;
                        pass_add = 2'b11;
                        sel_acii = 1'b1;
                        wr_mem = 1'b1;
                    end
                    3'b100: begin // write from Ac
                        ir_on_adr = 1'b1;
                        pass_add = 2'b00;
                        wr_mem = 1'b1;
                    end
                    3'b101: begin // jmp to 0
                        clr_pc = 1'b1;
                    end                  
                    3'b110: begin // Ac=Ac-Ac2
                        pass_add = 2'b10;
                        ld_ac = 1'b1;
                        sel_acii = 1'b1;
                        source_ac= 1'b1;
                    end     
                    3'b111: begin // write from Ac
                        ir_on_adr = 1'b1;
                        pass_add = 2'b00;
                        // sel_acii = 1'b1;
                        wr_mem = 1'b1;
                    end     
                endcase
            end
        endcase
    end

endmodule
