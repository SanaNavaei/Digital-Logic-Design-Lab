`timescale 1ns/1ns
module RegB(
    input[7:0] in, input loadlsb, loadmsb, clk, rst,
    output reg [15:0] out);

    always@(posedge clk, posedge rst)begin
      if(rst)
          out<=16'b0;
      else if (loadlsb)
          out[7:0] <= in;
      else if (loadmsb)
          out[15:8] <= in;
    end

endmodule
