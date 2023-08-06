`timescale 1ns/1ns
module Counter(
    input clk, rst, initC, cen,
    output reg[3:0] out, output co);

    always @(posedge clk) begin
        if(rst)
          out <= 3'b0;
        if(cen)
          out <= out + 1;
        if(initC)
          out <= 3'b0;
    end
    assign co = &out;
endmodule
