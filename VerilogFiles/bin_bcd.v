`timescale 1ns / 1ps
// Credit: http://www.deathbylogic.com/2013/12/binary-to-binary-coded-decimal-bcd-converter/
// Minor changes made, otherwise the same
module bin_bcd(binary, hundreds, tens, ones);
   // I/O Signal Definitions
   input  [7:0] binary;
   output reg [3:0] hundreds;
   output reg [3:0] tens;
   output reg [3:0] ones;

   // Internal variable for storing bits
   reg [19:0] shift;
   integer i;

   always @(binary)
   begin
     hundreds = 4'b0;
     tens = 4'b0;
     ones = 4'b0;
      // Clear previous number and store new number in shift register
      shift = 0;
      shift[7:0] = binary;

      // Loop eight times
      for (i=0; i<8; i=i+1) begin
         if (shift[11:8] >= 5)
            shift[11:8] = shift[11:8] + 3;

         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 3;

         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 3;

         // Shift entire register left once
         shift = shift << 1;
      end

      // Push decimal numbers to output
      hundreds = shift[19:16];
      tens     = shift[15:12];
      ones     = shift[11:8];
   end

endmodule
