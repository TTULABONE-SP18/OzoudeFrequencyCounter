// Binary to BCD Converter Testbench
// Developer: Victoria Rodriguez
// Description:
// Methodology:
module bcd_tb();
     wire [7:0] bin = 8'b10010001;   // 145 in decimal, 91 in hex
     wire [3:0] tens     = 4'b0,
                ones     = 4'b0,
                hundreds = 4'b0;
     wire [11:0] final   = 12'b0;
     assign final = {hundreds, tens, ones};
     // reg clk;
     // initial begin
     //      clk = 0;
     //      // Clock is 1000 Hz
     //      forever #1000000 clk = !clk;
     // end

     bin_bcd tb_bcd(
          // .clk(clk),
          .binary(bin),
          .hundreds(hundreds),
          .tens(tens),
          .ones(ones)
          );

//     reg [11:0] final = {hundreds,tens,ones};

endmodule
