`timescale 1ns/1ns
module MUX2to1(
	input[7:0] WGP, DDS, input[1:0] SW,
	output reg[7:0] out);
	wire selector;
	assign selector = SW[1] & SW[0];

	always@(selector, WGP, DDS)begin
		if(selector == 1'b1)
			out <= DDS;
		else if(selector == 1'b0)
			out <= WGP;
	end

endmodule
