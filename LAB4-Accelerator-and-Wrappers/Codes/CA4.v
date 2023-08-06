`include"Hexdisplay.v"
`include"LAB_4.vo"

module CA4(
	input clk, rst, start, read,
	output[6:0] displ1, displ2, displ3, displ4,output done);

	wire[17:0]q;
	Hexdisplay HEX1(q[17:14], displ1);
	Hexdisplay HEX2(q[13:10], displ2);
	Hexdisplay HEX3(q[9:6], displ3);
	Hexdisplay HEX4(q[5:2], displ4);
	LAB_4 CUT(done, clk, rst, start, read, q);
	
endmodule
