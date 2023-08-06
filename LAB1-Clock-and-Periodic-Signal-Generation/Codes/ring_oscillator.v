`timescale 1ps/1ps
module ring_oscillator#(parameter delay, num)(output out, input in);
	reg[num:0] delay_inv;
	integer i;
	assign delay_inv[0] = in;
	assign out = delay_inv[num];

	initial begin
		while(1)begin
			for(i = 1; i <= num ; i = i + 1)
				#delay delay_inv[i] = ~delay_inv[i - 1];
			delay_inv[0] = delay_inv[num];
		end
	end
endmodule
