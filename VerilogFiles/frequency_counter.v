`timescale 1 ns / 1 ps
// Frequency Counter Module
// Victoria Rodriguez
// This module counts the number of inputs it receives in one second using the 100 MHz clock.
module freq_counter(
	input RESET,
	input CLK,
	input IN,
	// Register for frequency, use for other modules
	output reg [3:0] freq = 4'b0,
	// Register for regular counter
	output reg[31:0] count = 32'b0,
	// 7-segment Display Cathodes
	output reg [6:0] cathode,
	// 7-segment Display Anodes
	output reg [3:0] anode,
	output DP);

	// Inverse of cathode
	reg [6:0] cathode_inv;
	// Register for input counter
	reg [3:0] in_count;

	// Assignments
	assign DP = 1;
	assign RESET = 0;

	localparam max = 50000000;


	always @ (posedge CLK)
	begin
		case (1)
			RESET == 1'b1: begin
				freq 		<= 0;
				in_count 		<= 0;
				count 		<= 0;
			end

			count == max - 1: begin
				count <= 32'b0;
				freq <= in_count;
				in_count <= 32'b0;
			end

			freq < 10:
				anode <= freq;

			default: begin
				count <= count + 1'b1;
				case(IN)
					1'b1: in_count <= in_count + 1;
					default: in_count <= in_count;
				endcase
			end
		endcase
	end

	always @ (anode)
		begin
		cathode_inv <= ~cathode;
		case(anode)
		4'b0000: cathode_inv = 7'b1111110;  // 0
		4'b0001: cathode_inv = 7'b0110000;  // 1
		4'b0010: cathode_inv = 7'b1101101;  // 2
		4'b0011: cathode_inv = 7'b1111001;  // 3
		4'b0100: cathode_inv = 7'b0110011;  // 4
		4'b0101: cathode_inv = 7'b1011011;  // 5
		4'b0110: cathode_inv = 7'b1011111;  // 6
		4'b0111: cathode_inv = 7'b1110000;  // 7
		4'b1000: cathode_inv = 7'b1111111;  // 8
		4'b1001: cathode_inv = 7'b1110011;  // 9
		4'b1010: cathode_inv = 7'b1110111;  // A
		4'b1011: cathode_inv = 7'b0011111;  // b
		4'b1100: cathode_inv = 7'b0001101;  // c
		4'b1101: cathode_inv = 7'b0111101;  // d
		4'b1110: cathode_inv = 7'b1001111;  // E
		4'b1111: cathode_inv = 7'b1000111;  // F
		default: cathode_inv = 7'bxxxxxxx;
		endcase
		end
endmodule
