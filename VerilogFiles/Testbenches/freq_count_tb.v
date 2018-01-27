` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module

module freq_count_tb();
  reg [3:0] freq;
  reg clk, in;
  // reg [64:0] count;

  freq_counter test(
    .CLK(clk),
    .IN(in),
    .freq(freq)
    // .count()
    );

  initial begin
    clk = 0;
    in = 0;
    freq = 0;
  end

// Clock is 100MHz
  always
  #10 clk = !clk;
// Test frequency is 1 MHz
  always
  #1000 in = !in;

endmodule
