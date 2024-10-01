module TopLevel(
    input wire reset,
    input wire clk
    // input wire [7:0] data_bus_in,
    // output wire [5:0] adr_bus,
    // output wire [7:0] data_bus_out
);

    wire rd_mem, wr_mem;
    // wire [7:0] tmp_data_bus_out,tmp_data_bus_in;
    wire [7:0] memory_contents[0:63];
    wire [7:0] data_bus_in;
    wire [5:0] adr_bus;
    wire [7:0] data_bus_out;

    CPU cpu(reset, clk, data_bus_in, adr_bus, rd_mem, wr_mem, data_bus_out);
    Memory memory(clk, rd_mem, wr_mem, adr_bus, data_bus_out, data_bus_in);
    // assign tmp_data_bus_in = rd_mem ? data_bus_out : data_bus_in;

    // Reflect the memory contents
    assign memory_contents[0] = memory.mem[0];
    assign memory_contents[1] = memory.mem[1];
    assign memory_contents[2] = memory.mem[2];
    assign memory_contents[3] = memory.mem[3];
    assign memory_contents[4] = memory.mem[4];
    assign memory_contents[5] = memory.mem[5];
    assign memory_contents[6] = memory.mem[6];
    assign memory_contents[7] = memory.mem[7];
    assign memory_contents[8] = memory.mem[8];
    assign memory_contents[9] = memory.mem[9];

    assign memory_contents[10] = memory.mem[10];
    assign memory_contents[11] = memory.mem[11];
    assign memory_contents[12] = memory.mem[12];
    assign memory_contents[13] = memory.mem[13];
    assign memory_contents[14] = memory.mem[14];
    assign memory_contents[15] = memory.mem[15];
    assign memory_contents[16] = memory.mem[16];
    assign memory_contents[17] = memory.mem[17];
    assign memory_contents[18] = memory.mem[18];
    assign memory_contents[19] = memory.mem[19];

    assign memory_contents[20] = memory.mem[20];
    assign memory_contents[21] = memory.mem[21];
    assign memory_contents[22] = memory.mem[22];
    assign memory_contents[23] = memory.mem[23];
    assign memory_contents[24] = memory.mem[24];
    assign memory_contents[25] = memory.mem[25];
    assign memory_contents[26] = memory.mem[26];
    assign memory_contents[27] = memory.mem[27];
    assign memory_contents[28] = memory.mem[28];
    assign memory_contents[29] = memory.mem[29];

    assign memory_contents[30] = memory.mem[30];
    assign memory_contents[31] = memory.mem[31];
    assign memory_contents[32] = memory.mem[32];
    assign memory_contents[33] = memory.mem[33];
    assign memory_contents[34] = memory.mem[34];
    assign memory_contents[35] = memory.mem[35];
    assign memory_contents[36] = memory.mem[36];
    assign memory_contents[37] = memory.mem[37];
    assign memory_contents[38] = memory.mem[38];
    assign memory_contents[39] = memory.mem[39];

    assign memory_contents[40] = memory.mem[40];
    assign memory_contents[41] = memory.mem[41];
    assign memory_contents[42] = memory.mem[42];
    assign memory_contents[43] = memory.mem[43];
    assign memory_contents[44] = memory.mem[44];
    assign memory_contents[45] = memory.mem[45];
    assign memory_contents[46] = memory.mem[46];
    assign memory_contents[47] = memory.mem[47];
    assign memory_contents[48] = memory.mem[48];
    assign memory_contents[49] = memory.mem[49];

    assign memory_contents[50] = memory.mem[50];
    assign memory_contents[51] = memory.mem[51];
    assign memory_contents[52] = memory.mem[52];
    assign memory_contents[53] = memory.mem[53];
    assign memory_contents[54] = memory.mem[54];
    assign memory_contents[55] = memory.mem[55];
    assign memory_contents[56] = memory.mem[56];
    assign memory_contents[57] = memory.mem[57];
    assign memory_contents[58] = memory.mem[58];
    assign memory_contents[59] = memory.mem[59];
 
    assign memory_contents[60] = memory.mem[60];
    assign memory_contents[61] = memory.mem[61];
    assign memory_contents[62] = memory.mem[62];
    assign memory_contents[63] = memory.mem[63];   

    // assign data_bus_out = tmp_data_bus_out;

endmodule
