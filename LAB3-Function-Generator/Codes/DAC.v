module DAC(
    input [7:0] in, input clk, rst,
    output reg out);

    wire [7:0] reg_out, counter_out;
    wire counter_co;
    reg load;
    Counter cnt(1'b0, 1'b1, 1'b0, clk, rst, counter_out, counter_co);
    Register inReg(in, load, 1'b0, clk, rst, reg_out);

    always @(reg_out, counter_out, counter_co) begin
            load = 1'b0;
        if (counter_co)
		    load = 1'b1;
        if (counter_out > reg_out)
		    out = 1'b0;
        else
		    out = 1'b1;
    end

endmodule
