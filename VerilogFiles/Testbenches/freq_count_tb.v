` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module

module freq_count_tb();
  wire [3:0] freq;
  reg clk, in;
  // reg [64:0] count;


  initial begin
    clk = 0;
    in = 0;
//    #1000
//    in = 1;
// Test frequency is 10 MHz
    forever #100 in = !in;
//    freq <= 0;
//    $finish
  end

// Clock is 50MHz
  always
  #20 clk = !clk;
// Test frequency is 1 MHz
//  always
//  #1000 in = !in;
freq_counter test(
  .CLK(clk),
  .IN(in),
  .freq(freq)
  // .count()
  );

endmodule
