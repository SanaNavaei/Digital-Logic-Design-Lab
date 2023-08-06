`timescale 1ns/1ns
module datapath(
	input[7:0] A, B, input[1:0] SA, input initA, initP, initC, loadlsbA, loadmsbA, loadP, loadlsbB, loadmsbB,
	loadA, SA2, clk, rst, select,
	output [2:0] op,output [31:0] result16);

	wire [15:0] regB_out, regP_out, mult_out, adder_out, regP_in;
	wire [16:0] regA_out, out_A;
	wire [31:0] result;

	assign result = {regP_in, regA_out[16:1]};
	assign op = regA_out[2:0];
	assign out_A = {adder_out[1:0], regA_out[16:2]};

	RegA reg_A(A, out_A, loadlsbA, loadmsbA, loadA, 1'b0, clk, rst, regA_out);
	RegB reg_b(B, loadlsbB, loadmsbB, clk, rst, regB_out);
	Mult multiplexer(regB_out, SA, mult_out);
	Adder add(regP_out, mult_out, SA2, adder_out);
	assign regP_in = {adder_out[15], adder_out[15], adder_out[15:2]};
	RegP reg_P(regP_in, loadP, initP, clk, rst, regP_out);
	MUX mux(result, select, result16);

endmodule
