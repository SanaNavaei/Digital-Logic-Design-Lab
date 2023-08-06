`timescale 1ns/1ns
module TB();
	reg [7:0]A,B;
	reg rst,getA,getB;
	reg clk = 0;
	reg start = 0;
	wire [31:0]result;
	CA2 CUT(A,B,start,clk,rst,getA,getB, result);

	always begin #10 clk = ~clk;end
	initial begin
		A = 8'b11111111;
		B = 8'd4;
		rst = 1;
		#20 rst = 0;
		getA = 1;
		getB = 1;
		#40 start =  1;
		#40 start = 0;
		#60 getA = 0;
		#60 getA = 1;
		#400;
		A = 8'b11111111;
		#60 getA = 0;
		#60 getB = 0;getA=1;
		#60 getB = 1;
		#400;
		B = 8'd0;
		#60 getB = 0;
		#40 getB = 1;
		#10000 $stop;
	end

endmodule
