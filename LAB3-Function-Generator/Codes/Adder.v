`timescale 1ns/1ns
module Adder(
	input[7:0] a,
	output[7:0] out);

	assign out = a + 8'd1;

endmodule
