`timescale 1 ns / 1 ps
// Frequency Counter Module
// Victoria Rodriguez
// This module counts the number of inputs it receives in one second using the 100 MHz clock.
module freq_counter(
	input RESET,
	input CLK,
	input IN,
	// Register for frequency, use for other modules
	output reg [3:0] freq,
	// Register for regular counter
	output reg[64:0] count);
	// Register for input counter
	reg [3:0] in_count;


	always@(posedge CLK)
	begin
		// RESET
		case (RESET)
		1'b1: 
			begin
				freq 		<= 0;
				in_count 	<= 0;
				count 		<= 0;
			end
		endcase

		// If counter hasn't reached max, keep counting
		case (1)
		count < 100000000: 
			begin
				count <= count + 1;
				if(IN)
					in_count <= in_count+1;
			end
		// If counter reached max, reset counter, update frequency register
		count = 100000000: 
			begin
				count <= 0;
				in_count <= 0;
				freq <= in_count;
			end
		endcase

	end

endmodule
