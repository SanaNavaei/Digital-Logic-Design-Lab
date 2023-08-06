`timescale 1ps/1ps
module Datapath_UART(
	input BRGCLK, cnt_en, cnt_rst, ld_en,
	output reg[7:0] reg_out, cnt_out);

	always@(posedge BRGCLK) begin
		if(cnt_rst)cnt_out <= 8'd0;
		else if(cnt_en) cnt_out <= cnt_out + 1;
	end

	always @(posedge BRGCLK) begin
 		if(cnt_rst) reg_out <= 8'd0;
 		else if(ld_en) reg_out <= cnt_out;
	end
endmodule
