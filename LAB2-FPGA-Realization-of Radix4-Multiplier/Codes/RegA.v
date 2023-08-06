`timescale 1ns/1ns
module RegA(
    input[7:0] in8, input [16:0] in17, input loadlsb, loadmsb, loadA, init, clk, rst,
    output reg [16:0]out);

    always@(posedge clk, posedge rst)begin
      if(rst)
          out<=16'b0;
      else if (init)
          out <= 16'b0;
      else if (loadA)
          out <= in17;
      else begin
          if (loadlsb)
              out[8:0] <= {in8,0};
          if (loadmsb)
              out[16:9] <= in8;
      end
    end

endmodule
