`include"LAB_4.vo"
`timescale 1ns/1ns

module expTB();
	reg start = 0, read = 0, clk = 0, rst = 0;
	wire done;
	wire [17:0] q;
	LAB_4 CUT(done,clk,rst,start,read,q);

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
