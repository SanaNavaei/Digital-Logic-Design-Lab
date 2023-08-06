`timescale 1ps/1ps
module ABRCKT(
	input BRGCLK,UxRX,ABAUD,
	output UxRXIF,reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7,reg_8);

	wire [7:0]cnt_out,out_reg;
	wire ld_en, cnt_en, cnt_rst;

	Controller_ABRCKT c(BRGCLK, UxRX, ABAUD, cnt_en, cnt_rst, ld_en, UxRXIF);
	Datapath_ABRCKT d(BRGCLK, cnt_en, cnt_rst, ld_en, out_reg, cnt_out);

	assign reg_1 = out_reg[0];
	assign reg_2 = out_reg[1];
	assign reg_3 = out_reg[2];
	assign reg_4 = out_reg[3];
	assign reg_5 = out_reg[4];
	assign reg_6 = out_reg[5];
	assign reg_7 = out_reg[6];
	assign reg_8 = out_reg[7];
endmodule