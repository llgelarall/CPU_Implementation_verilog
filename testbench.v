module testbench;

  reg reset;
  reg clk;

  TopLevel dut (
    .reset(reset),
    .clk(clk)
  );

  // always #50 clk = ~clk;
 initial clk = 0;
 always #50 clk = ~clk;

  initial begin
    reset = 1;
    #100;
    reset = 0;
    #14400;
    $stop;
  end

endmodule
