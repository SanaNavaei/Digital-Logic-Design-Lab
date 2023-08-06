`timescale 1ns/1ns
module waveform_generator(
    input clk, rst, cen, input [1:0] func,
    output[7:0] waveform);

    wire [7:0] count_out;
    Counter8bit counter8bit(clk, rst, cen, count_out);
    WGP wgp(count_out, func, waveform);

endmodule
