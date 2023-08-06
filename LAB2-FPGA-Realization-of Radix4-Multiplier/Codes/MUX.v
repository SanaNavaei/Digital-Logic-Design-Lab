module MUX(
	input [31:0] in, input select,
	output reg[15:0]out);

	always@(select,in) begin
		out = 16'b0;
		if (select == 1'b1)
			out = in[31:16];
		else if(select == 1'b0)
			out = in[15:0];
	end

endmodule
