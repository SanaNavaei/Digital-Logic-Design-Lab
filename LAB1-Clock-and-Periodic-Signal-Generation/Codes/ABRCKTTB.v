`timescale 1ps/1ps
module ABRCKTTB();
	wire UP,out1,out2,out3,out4,out5,out6,out7,out8,Q,TFF_Q,UxRXIF;
	reg preset,ABAUD,UxRX,k;
	ring_oscillator #(1900,5)ring(UP,1'b1);

	BRGCKT brg(UP,UxRX,ABAUD,preset,BRGCLK,out1,out2,out3,out4,out5,out6,out7,out8,Q,TFF_Q,UxRXIF);
	
	initial begin
		#0 UxRX = 1;
		#10 ABAUD = 0;
		#10 preset = 0;
		#11400 ABAUD = 1;
		#11400 UxRX = 0;
		#11400 UxRX = 1;
		#11400 UxRX = 0;
		#11400 UxRX = 1;
		#11400 UxRX = 0;
		#11400 UxRX = 1;
		#11400 UxRX = 0;
		#11400 UxRX = 1;
		#11400 UxRX = 0;
		#100000 ABAUD = 0;
	end
endmodule