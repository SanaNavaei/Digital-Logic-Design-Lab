`timescale 1ps/1ps
module TFFTB();
	wire divided_clk;
	reg RO_clk = 1'b1;
	reg [5:0]in;
	reg rst = 1'b1;
	wire[11:0]out;
	TFF1 FFTB(out[0], in[3], in[2], in[1], in[0], rst, RO_clk, in[5], in[4], out[2],
	out[1], out[3], out[4], out[5], out[6], out[7], divided_clk, out[9], out[8], out[10], out[11]);

	always #10000 RO_clk = ~RO_clk;
	initial begin
		#1000 rst = 1'b0;
		#0 {in[5],in[4],in[3],in[2],in[1],in[0]}=6'd15;
		#2500000 {in[5],in[4],in[3],in[2],in[1],in[0]} = 6'd50;
		#2500000 {in[5],in[4],in[3],in[2],in[1],in[0]} = 6'd1;
	end

endmodule
