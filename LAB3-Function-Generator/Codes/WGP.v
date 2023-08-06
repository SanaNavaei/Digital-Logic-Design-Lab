`timescale 1ns/1ns
module WGP(
	input[7:0] count_num, input[1:0] func,
	output reg[7:0] waveform);

	always@(func,count_num)begin
		waveform = 8'b0;
		case(func)
			2'b00:begin
				if(count_num <8'd128)
					waveform = 8'd127;
				else
					waveform = 1'b0;
				end
			2'b01:begin
				if(count_num == 8'd255)
					waveform = 8'd1;
				else
					waveform = 8'd255 / (8'd255 - count_num);
				end
			2'b10:begin
				if(count_num < 8'd128)
					waveform = count_num;
				else
					waveform = 8'd255 - count_num;
				end
			default: waveform = 8'bx;
		endcase
	end

endmodule
