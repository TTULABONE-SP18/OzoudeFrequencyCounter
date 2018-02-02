`timescale 1 ns / 1 ps
// Frequency Counter Module
// Developer:   Victoria Rodriguez
// Description: This module counts the number of inputs it receives in one second using the 100 MHz
//              clock.
// Methodology: This module was coded for a 100 MHz clock, meaning that there should be 100 million
//              ticks in one second. That means that after the counter has counted 100 million ticks
//              we know that one second has passed. Another counter works simultaneously to count
//              the number of inputs coming in from the Pmod port. After one second has elapsed,
//              we know that the number of inputs (cycles) is the frequency of of the signal
//              into the Pmod port. Hertz is measured in cycles/sec, and since we know it's
//              one second, we don't have to do any further math-- the input counter should be
//              frequency of the input as is.

module freq_counter(
	// 100 MHz clock
	input CLK,
	// Pmod port input JA1, renamed in constraints file to IN
	input [1:0] IN,
	// Register for frequency
	output reg [15:0] freq = 16'b0);

	// Register for one second counter
	reg[31:0] count = 32'b0;
	// Register for input counter
	reg [15:0]edge_count = 0;
	// Register for storing last signal, used for detecting rising edge
	reg last = 0;

	// Assignments
	localparam max = 'd100000000;

	// Flip-flop stores last value in register
	always @(posedge CLK) begin
		last <= IN;
	end

	always @ (posedge CLK)
	begin
		case (1)
			count < max: begin
				// If detecting a HIGH and the last value was LOW, then it's a rising edge
				count <= count + 1;
				if(~last & IN)
					edge_count <= edge_count + 1;
				end


			default: begin
				freq <= edge_count;
				edge_count <= 0;
				count <= 0;
			end
		endcase
	end

endmodule
