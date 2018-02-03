`timescale 1 ns / 1 ps
// Binary to BCD Converter
// Developer: Victoria Rodriguez
// Description: Converts an 8 bit binary number to 12 bit BCD
// Methodology: Shift-Add 3 Method
// Status: Not working
module bin_bcd(
     // input clk,
     input [7:0] bin,
     output reg [3:0] hundreds,
     output reg [3:0] tens,
     output reg [3:0] ones
     );

     integer i;
     always @ (bin)
     begin
          hundreds  = 4'b0;
          tens      = 4'b0;
          ones      = 4'b0;

          for (i=7; i >= 0; i = i - 1)
          begin
               case(1)
                    hundreds >= 5: hundreds <= hundreds + 3;
                    tens     >= 5: tens     <= tens     + 3;
                    ones     >= 5: ones     <= ones     + 3;
                    default: begin
                    hundreds       <= hundreds << 1;
                    hundreds[0]    <= tens[3];
                    tens           <= tens     << 1;
                    ones           <= ones     << 1;
                    ones[0]        <= bin[1];
                    end
               endcase
               // end
          end
     end

endmodule
