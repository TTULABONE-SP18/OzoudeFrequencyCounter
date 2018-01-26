`timescale 1 ns / 1 ps
// Frequency Counter Display Module
module disp_freq(
	input freq,
	output reg [6:0] disp_out
	);
// the hex-to-7-segment decoder
    always @ (freq)
        case (freq)
        4'b0000: disp_out = 7'b1111110;  // 0
        4'b0001: disp_out = 7'b0110000;  // 1
        4'b0010: disp_out = 7'b1101101;  // 2
        4'b0011: disp_out = 7'b1111001;  // 3
        4'b0100: disp_out = 7'b0110011;  // 4
        4'b0101: disp_out = 7'b1011011;  // 5
        4'b0110: disp_out = 7'b1011111;  // 6
        4'b0111: disp_out = 7'b1110000;  // 7
        4'b1000: disp_out = 7'b1111111;  // 8
        4'b1001: disp_out = 7'b1110011;  // 9
        4'b1010: disp_out = 7'b1110111;  // A
        4'b1011: disp_out = 7'b0011111;  // b
        4'b1100: disp_out = 7'b0001101;  // c
        4'b1101: disp_out = 7'b0111101;  // d
        4'b1110: disp_out = 7'b1001111;  // E
        4'b1111: disp_out = 7'b1000111;  // F
        default: disp_out = 7'bxxxxxxx;
        endcase     

endmodule