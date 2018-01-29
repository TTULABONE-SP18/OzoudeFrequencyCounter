`timescale 1 ns / 1 ps
// Frequency Counter Display Module
module disp_freq(
	input clk,
	input [3:0] freq,
	output reg [6:0] disp_out
	);
// the hex-to-7-segment decoder
    always @ (posedge clk)
    begin
        case (freq)
	   4'b0000: LED_out = 7'b0000001; // "0"
        4'b0001: LED_out = 7'b1001111; // "1"
        4'b0010: LED_out = 7'b0010010; // "2"
        4'b0011: LED_out = 7'b0000110; // "3"
        4'b0100: LED_out = 7'b1001100; // "4"
        4'b0101: LED_out = 7'b0100100; // "5"
        4'b0110: LED_out = 7'b0100000; // "6"
        4'b0111: LED_out = 7'b0001111; // "7"
        4'b1000: LED_out = 7'b0000000; // "8"
        4'b1001: LED_out = 7'b0000100; // "9"
        default: LED_out = 7'b0000001; // "0"
        endcase
	end

endmodule
