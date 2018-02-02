`timescale 1 ns / 1 ps
// Frequency Counter Module
// Developer: 	 Victoria Rodriguez
// Description: This module counts the number of inputs it receives in one second using the 100 MHz
// 			 clock.
// Methodology: This module was coded for a 100 MHz clock, meaning that there should be 100 million
//			 ticks in one second. That means that after the counter has counted 100 million ticks
// 			 we know that one second has passed. Another counter works simultaneously to count
// 			 the number of inputs coming in from the Pmod port. After one second has elapsed,
// 			 then we know that the number of inputs (cycles) is the frequency of of the signal
// 			 coming into the Pmod port. Hertz is measured in cycles/sec, and since we know it's
// 			 been one second, we don't have to do any further math-- the input counter should be
// 			 the frequency of the input as is.

module freq_counter(
     // 100 MHz clock
	input CLK,
	// Pmod port input JA1, renamed in constraints file to IN
	input [1:0] IN,
	// 7-segment Display Cathodes
	output [6:0] cathode,
	// 7-segment Display Anodes
	output [3:0] anode,
	output DP);
	// Register for frequency, use for other modules
	reg [15:0] freq = 16'b0;
	// Register for regular counter
	reg[31:0] count = 32'b0;

	// Register for input counter
	reg [3:0]edge_count = 0;
	// reg [3:0] in_count;
	reg last = 0;

	// Assignments
	assign DP = 1;
	localparam max = 100000000;

	always @(posedge CLK) begin
		last <= IN;
	end

	always @ (posedge CLK)
	begin
		case (1)
			count < max: begin
				if(~last & IN)
				edge_count <= edge_count + 1;
				end

			// freq < 10:
			// 	anode <= freq;

			default: begin
				freq <= edge_count;
				edge_count <= 0;
				count <= 0;
			end
		endcase
	end

	disp_controller(
		.clk(CLK),
		.displayed_number(freq),
		.digits(anode),
		.segments(~cathode)
		);

endmodule
