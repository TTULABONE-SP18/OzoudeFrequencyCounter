` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module
// Developer: Victoria Rodriguez
// Description: Tests the freq_counter module
// Methodology: For this to work, change the localparam max in freq_counter to match the clock cycle
//              here. The testbench creates a clock signal and a test signal to use in the
//              freq_counter module. To see the results, run the simulation for a little while
//              longer until the freq_counter's counter has reached the localparam max.
module freq_count_tb();
     wire [7:0] freq;
     reg clk, in;

     initial begin
          clk = 0;
          in = 0;
          // Test frequency is 145 Hz
          forever #6897000 in = !in;
     end

     // Clock is 1000 Hz
     always
          #1000000 clk = !clk;

     freq_counter tb1(
          .CLK(clk),
          .IN(in),
          .freq(freq)
          );

endmodule
