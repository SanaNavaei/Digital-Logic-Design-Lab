`timescale 1ns/1ns
module Adder(
    input [15:0] a, b, input SA2,
    output[15:0]add_out);

    assign add_out = SA2 ? (a+b) : (a-b);
endmodule
