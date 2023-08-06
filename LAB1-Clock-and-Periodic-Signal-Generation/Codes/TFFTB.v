`timescale 1ps/1ps
module TFFTB();
	wire RO_clk,divided_clk;
	reg DN,preset;
	reg [7:0]in;
	wire[7:0]out;

	TFF1 FFTB(out[0], in[3], in[2], in[1], in[0], RO_clk, in[7], in[6], in[5], in[4], preset, out[2],
				out[1], out[3], out[4], out[5], out[6], out[7], divided_clk);
	ring_oscillator #(2000,5)ringosc(RO_clk,1'b1);

	initial begin
		#0 {in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]}=8'd151;
		#0 {preset,DN}=2'b01;
		#10000 preset = 1'b1;
		#2500000 {in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]} = 8'd100;
		#0 {preset,DN}=2'b01;
		#10000 preset = 1'b1;
		#2500000 {in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]} = 8'd123;
		#0 {preset,DN}=2'b01;
		#10000 preset = 1'b1;
	end
endmodule
