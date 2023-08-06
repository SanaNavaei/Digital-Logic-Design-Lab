`timescale 1ns/1ns
module TB();
    reg clk = 0 , rst = 1, cen = 1;
    reg[2:0] func;
    wire [7:0] waveform;
    waveform_generator CUT(clk, rst, cen, func, waveform);

    always #20 clk = ~clk;
    initial begin
        #40 rst = 0;
        #200 func = 3'b001;
        #16000 func = 3'b010;
        #16000 func = 3'b011;
    end
endmodule
