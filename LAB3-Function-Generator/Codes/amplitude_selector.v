`timescale 1ns/1ns
module amplitude_selector(
	input[1:0] division, input[7:0] in,
	output[7:0]out);

	assign out = in >>> division;

endmodule
