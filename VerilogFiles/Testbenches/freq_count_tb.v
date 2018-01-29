` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module

module freq_count_tb();
  wire [3:0] freq;
  reg clk, in;

  initial begin
    clk = 0;
    in = 0;

// Test frequency is 10 MHz
    forever #100 in = !in;
  end

// Clock is 50MHz
  always
  #20 clk = !clk;

freq_counter test(
  .CLK(clk),
  .IN(in),
  .freq(freq)
  // .count()
  );

endmodule
