`timescale 1ns/1ns
module Counter8bit(
	input clk, rst, cen,
	output reg[7:0]out);

	always @(posedge clk, posedge rst) begin
    		if(rst)
      			out <= 8'b0;
    		else if(cen)
      			out <= out + 1;
	end

endmodule
