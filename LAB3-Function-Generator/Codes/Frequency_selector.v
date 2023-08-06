module Frequency_selector(
	input [5:0] sel, input clr, clk, rst,
	output co);

	wire [7:0] comp;
	assign comp = {1'b11, sel};
	wire coLsb, coMsb;
	wire [3:0] outLsb, outMsb;

	Counter4bit #(4) lsb(.loadData(comp[3:0]), .load(coMsb), .en(1'b1), .clr(clr), .clk(clk), .rst(rst), .out(outLsb), .co(coLsb));
	Counter4bit #(4) msb(.loadData(comp[7:4]), .load(coMsb), .en(coLsb), .clr(clr), .clk(clk), .rst(rst), .out(outMsb), .co(coMsb));

	TFlipFlop TFF(.j(1'b1), .k(1'b1), .clk(coMsb), .rst(rst), .q(co));

endmodule
