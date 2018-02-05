` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module
// Developer: Victoria Rodriguez
// Description: Tests the freq_counter module
// Methodology: For this to work, change the localparam max in freq_counter to match the clock cycle
//              here. The testbench creates a clock signal and a test signal to use in the
//              freq_counter module. To see the results, run the simulation for a little while
//              longer until the freq_counter's counter has reached the localparam max.
module disp_controller_tb();
     wire [6:0] segments;
     wire [3:0] digits;
     reg clk, in;

     initial begin
          clk = 0;
          in = 0;
          // Test frequency is 1 kHz
          forever #1000000 in = !in;
     end

     // Clock is 10 kHz
     always
          #100000 clk = !clk;

     disp_controller tb1(
          .CLK(clk),
          .IN(in),
          .segments(segments),
          .digits(digits)
          );

endmodule
