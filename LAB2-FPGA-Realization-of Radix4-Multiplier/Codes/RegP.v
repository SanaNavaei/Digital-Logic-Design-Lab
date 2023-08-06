`timescale 1ns/1ns
module RegP(
	input [15:0] in, input load, init, clk, rst,
	output reg [15:0]out);

	always@(posedge clk, posedge rst)begin
		if(rst)
			out<=16'b0;
		else if (init)
			out<=16'b0;
		else if (load)
			out <= in;
	end

endmodule
