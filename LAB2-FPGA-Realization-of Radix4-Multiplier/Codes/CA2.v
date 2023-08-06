`timescale 1ns/1ns
module CA2(
    input[7:0]A, B, input start, clk, rst, getA, getB,
    output[31:0] result);

    wire [1:0]SA,op;
    wire initA,initP,initC,loadlsbA,loadmsbA,loadP,loadlsbB,loadmsbB,loadA,SA2;

    datapath DP(A,B,SA, initA,initP, initC,loadlsbA,loadmsbA,loadP,loadlsbB,loadmsbB,loadA,SA2,clk,rst,op,result);

    controller CU(start,clk,rst,getA,getB,op,initA,initP, initC,loadlsbA,loadmsbA,loadP,loadA,loadlsbB,loadmsbB,SA2,SA);
endmodule
