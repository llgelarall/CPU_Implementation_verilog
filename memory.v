module Memory(
    input wire clk,
    input wire rd,
    input wire wr,
    input wire [5:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem[0:63]; 
    integer i;
    always @(*) begin
        if (wr) begin
            mem[addr] <= data_in; 
        end
        if (rd) begin
            data_out = mem[addr];
        end
    end

    // Initialize memory
    initial begin
        mem[0] = 8'h00;
        mem[1] = 8'h0C; //Ac=2
        mem[2] = 8'h20; //Ac2=Ac
        mem[3] = 8'h0D; //Ac=8
        mem[4] = 8'hC0; // Ac=Ac-Ac2
        mem[5] = 8'hED; //write Ac on 8

        mem[6] = 8'h0E; //Ac=1
        mem[7] = 8'h20; //Ac2=Ac
        mem[8] = 8'h0F; //Ac=div[]
        mem[9] = 8'h40; // Ac2=Ac+Ac2
        mem[10] = 8'h6F; // write Ac2

        mem[11] = 8'hA0; //B

        mem[12] = 8'h02; //C
        mem[13] = 8'h08; //D
        mem[14] = 8'h01; //E
        mem[15] = 8'h00; //F
        for ( i = 16; i < 64; i = i + 1) begin
            mem[i] = 8'h00;
        end
    end
endmodule
