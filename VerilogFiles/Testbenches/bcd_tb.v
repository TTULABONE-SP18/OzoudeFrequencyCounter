// Binary to BCD Converter Testbench
// Developer: Victoria Rodriguez
// Description:
// Methodology:
module bcd_tb();
     wire [7:0] binary = 8'b10010001;   // 145 in decimal, 91 in hex
     wire [3:0] hundreds = 4'b0,
                tens     = 4'b0,
                ones     = 4'b0;
     // reg clk;
     // initial begin
     //      clk = 0;
     //      // Clock is 1000 Hz
     //      forever #1000000 clk = !clk;
     // end

     bin_bcd tb_bcd(
          // .clk(clk),
          .bin(binary),
          .hundreds(hundreds),
          .tens(tens),
          .ones(ones)
          );

endmodule
