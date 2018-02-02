` timescale 1 ns / 1 ps
// Frequency Counter Testbench Module

module freq_count_tb();
     wire [31:0] freq;
     reg clk, in;

     initial begin
          clk = 0;
          in = 0;
          // Test frequency is 50 Hz
          forever #20000000 in = !in;
     end

     // Clock is 100MHz
     always
          #10 clk = !clk;

     freq_counter test(
          .CLK(clk),
          .IN(in),
          .freq(freq)
       );

     disp_controller test_disp(
          .clk(clk),
          .displayed_number(freq)
          );

endmodule
