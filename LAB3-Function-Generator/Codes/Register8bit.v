`timescale 1ns/1ns
module Register8bit(
	input [7:0] in, input clk, rst,
	output reg [7:0]out);

	always@(posedge clk, posedge rst)begin
		if(rst)
			out <= 8'b0;
		else
			out <= in;
	end

endmodule
