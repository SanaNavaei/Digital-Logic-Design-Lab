`timescale 1ns/1ns
module WaveformGenTB();
	reg clk=0, rst=1, cen=1;
	reg[2:0] sel;
	reg[7:0] phase_cntrl = 8'd1;
	wire [7:0] waveform;
	waveformgenerator CUT1(waveform, clk, rst, phase_cntrl, sel, cen);

	always #5 clk = ~clk;
	initial begin
		#40 rst = 0;
		#16000 sel = 3'b111;
		#16000 phase_cntrl = 8'd15;
		#16000 phase_cntrl = 8'd25;
	end

endmodule
