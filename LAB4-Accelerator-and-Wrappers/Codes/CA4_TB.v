`timescale 1ns/1ns
module CA4_TB();
	reg clk = 0,rst = 0, start = 0, read = 0;
	wire[0:6] displ1, displ2, displ3, displ4;
	wire done;
	CA4 CUT(clk, rst, start, read, displ1, displ2, displ3, displ4, done);

	always #10 clk = ~clk;
	initial begin
		#6 rst = 1;
		#6 rst = 0;
		#20 start = 1;
		#20 start = 0;
		while (~done) #10;
		#70 read = 1;
		#70 read = 0;
		#70 read = 1;
		#70 read = 0;
		#70 read = 1;
		#70 read = 0;
		#70 read = 1;
		#70 read = 0;
		#70 read = 1;
		#70 read = 0;
		#1000 $stop;
	end

endmodule
