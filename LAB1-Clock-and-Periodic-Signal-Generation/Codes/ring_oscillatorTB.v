`timescale 1ps/1ps
module ring_oscillatorTB();
	reg in = 1;
	wire out;

	ring_oscillator #(2000,5)ringTB(out, in);

	initial begin
		#20 in=0;
		#30 in=1;
		#40 in=0;
		#10 in=1;
	end
endmodule
