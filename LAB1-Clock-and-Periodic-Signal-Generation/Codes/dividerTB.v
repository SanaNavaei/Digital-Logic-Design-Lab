`timescale 1ps/1ps
module dividerTB();
	wire UP , Q;
	reg DN,preset;
	reg [7:0]in;
	wire[7:0]out;
	divider dividerTB1(out[0],in[3],in[2],in[1],in[0],UP,DN,in[7],in[6],in[5],in[4],preset,out[1],out[2],out[3],out[4],out[5],out[6],out[7],Q);
	ring_oscillator #(415,5)ringosc(UP,1'b1);
	initial begin
		#0 {in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]}=8'b10011001;
		#0 {preset,DN}=2'b01;
		#15000 preset = 1'b1;
		#2500000 $stop;
	end
endmodule