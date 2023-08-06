`timescale 1ns/1ns
module Mult(
    input[15:0] B, input[1:0] SA,
    output reg[15:0]out);

    always@(SA)begin
      out = 16'b0;
      case(SA)
        2'b00: out = 16'b0;
        2'b01: out = B;
        2'b10: out = {B[15:1],0};
        2'b11: out = 16'b0;
        default: out <= 16'b0;
      endcase
    end

endmodule
