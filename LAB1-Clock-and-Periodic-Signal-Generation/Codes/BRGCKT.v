// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Wed Apr 20 22:47:34 2022"

module BRGCKT(
	UP,
	UxRX,
	ABAUD,
	preset,
	BRGCLK,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	out8,
	Q,
	TFF_Q,
	UxRXIF
);


input wire	UP;
input wire	UxRX;
input wire	ABAUD;
input wire	preset;
input wire	BRGCLK;
output wire	out1;
output wire	out2;
output wire	out3;
output wire	out4;
output wire	out5;
output wire	out6;
output wire	out7;
output wire	out8;
output wire	Q;
output wire	TFF_Q;
output wire	UxRXIF;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_4 = 1;




ABRCKT	b2v_input1(
	.BRGCLK(BRGCLK),
	.UxRX(UxRX),
	.ABAUD(ABAUD),
	.UxRXIF(UxRXIF),
	.reg_1(SYNTHESIZED_WIRE_0),
	.reg_2(SYNTHESIZED_WIRE_1),
	.reg_3(SYNTHESIZED_WIRE_2),
	.reg_4(SYNTHESIZED_WIRE_3),
	.reg_5(SYNTHESIZED_WIRE_5),
	.reg_6(SYNTHESIZED_WIRE_6),
	.reg_7(SYNTHESIZED_WIRE_7),
	.reg_8(SYNTHESIZED_WIRE_8));



TFF1	b2v_output1(
	.preset(preset),
	.in1(SYNTHESIZED_WIRE_0),
	.in2(SYNTHESIZED_WIRE_1),
	.in3(SYNTHESIZED_WIRE_2),
	.in4(SYNTHESIZED_WIRE_3),
	.DN(SYNTHESIZED_WIRE_4),
	.UP(UP),
	.in5(SYNTHESIZED_WIRE_5),
	.in6(SYNTHESIZED_WIRE_6),
	.in7(SYNTHESIZED_WIRE_7),
	.in8(SYNTHESIZED_WIRE_8),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.out4(out4),
	.out5(out5),
	.out6(out6),
	.out7(out7),
	.out8(out8),
	.Q(Q),
	.TFF_Q(TFF_Q));


endmodule
