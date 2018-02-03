// Display Controller Module
// Developer:   Victoria Rodriguez
// Adapted From: [FPGA Tutorial] Seven-Segment LED Display on Basys 3 FPGA
//         http://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html
// Description: This is the top module for displaying the frequency found from freq_counter.
// Methodology: This module uses a 21 bit register as a refresh counter for the display. It uses the
//              first 19 bits of this register for creating a 190 Hz refresh rate for the segment
//              display, and uses the last two bits cycle through each of the four possible digits
//              and refresh its display.
module disp_controller(
     input CLK,                    // 100 MHz clock source on Basys 3 FPGA
     input reset,                  // Reset button
     output reg [3:0] digits,      // anode signals of the 7-segment LED display
     output reg [6:0] segments,     // cathode patterns of the 7-segment LED display
     input IN
    );

     wire [15:0] displayed_number; // counting number to be displayed
     reg [3:0] LED_BCD;
     reg [20:0] refresh_counter;   // The first 19 bits are for creating 190Hz refresh rate
                                   // The other 2 bits are for creating 4 LED-activating signals
     wire [1:0] LED_activating_counter;
          // count     0    ->  1  ->  2  ->  3
          // activates    LED1    LED2   LED3   LED4
          // and repeat
     always @(posedge CLK)
          begin
             case(reset)
             1'b1: refresh_counter <= 0;
             default: refresh_counter <= refresh_counter + 1;
             endcase
          end

     assign LED_activating_counter = refresh_counter[20:19];
     // anode activating signals for 4 LEDs
     // decoder to generate anode signals
     freq_counter sigin(
          .CLK(CLK),
          .IN(IN),
          .freq(displayed_number)
          );

     always @(*)
     begin
          case(LED_activating_counter)
               2'b00: begin
                    digits = 4'b0111;
                    // activate LED1 and Deactivate LED2, LED3, LED4
                    LED_BCD = displayed_number[15:12];
                    // the first digit of the 16-bit number
               end
               2'b01: begin
                    digits = 4'b1011;
                    // activate LED2 and Deactivate LED1, LED3, LED4
                    LED_BCD = displayed_number[11:8];
                    // the second digit of the 16-bit number
               end
               2'b10: begin
                    digits = 4'b1101;
                    // activate LED3 and Deactivate LED2, LED1, LED4
                    LED_BCD = displayed_number[7:4];
                    // the third digit of the 16-bit number
               end
               2'b11: begin
                    digits = 4'b1110;
                    // activate LED4 and Deactivate LED2, LED3, LED1
                    LED_BCD = displayed_number[3:0];
                    // the fourth digit of the 16-bit number
               end
          endcase
     end

     // Cathode patterns of the 7-segment LED display
     always @(*)
     begin
          case(LED_BCD)
               4'b0000: segments = 7'b1000000; // "0"
               4'b0001: segments = 7'b1111001; // "1"
               4'b0010: segments = 7'b0100100; // "2"
               4'b0011: segments = 7'b0110000; // "3"
               4'b0100: segments = 7'b0011001; // "4"
               4'b0101: segments = 7'b0010010; // "5"
               4'b0110: segments = 7'b0000010; // "6"
               4'b0111: segments = 7'b1111000; // "7"
               4'b1000: segments = 7'b0000000; // "8"
               4'b1001: segments = 7'b0011000; // "9"
               default: segments = 7'b1000000; // "0"
          endcase
     end
endmodule
