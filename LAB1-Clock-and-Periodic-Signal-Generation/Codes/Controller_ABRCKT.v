`timescale 1ps/1ps
module Controller_ABRCKT(
	input BRGCLK, UxRX, ABAUD,
	output reg cnt_en, cnt_rst, ld_en, UxRXIF);

	reg[3:0]ns,ps;
	parameter[3:0] IDLE = 0,initialization = 1, BEGINS = 2, step0= 3, step1= 4, step2= 5 , step3= 6, step4 = 7,
	step5 = 8, step6 = 9, step7 = 10, step8 = 11, end1 = 12;

	always@(ps,UxRX,ABAUD) begin
		ns = 0;
		case(ps)
			IDLE: ns = ~ABAUD ? IDLE : initialization;
	   		initialization: begin cnt_rst = 1'b1; ns = ~UxRX ? BEGINS : initialization; end
	   		BEGINS: begin cnt_en = ~UxRX ? 1'b0 : 1'b1; ns = ~UxRX ? BEGINS : step0; end
	   		step0: begin cnt_en = 1; ns = ~UxRX ? step1 : step0; end
	   		step1: begin cnt_en = 1; ns = ~UxRX ? step1 : step2; end
	   		step2: begin cnt_en = 1; ns = ~UxRX ? step3 : step2; end
	   		step3: begin cnt_en = 1; ns = ~UxRX ? step3 : step4; end
	   		step4: begin cnt_en = 1; ns = ~UxRX ? step5 : step4; end
	   		step5: begin cnt_en = 1; ns = ~UxRX ? step5 : step6; end
	   		step6: begin cnt_en = 1; ns = ~UxRX ? step7 : step6; end
	   		step7: begin cnt_en = 1;ns = ~UxRX ? step7 : step8; end
	   		step8: begin cnt_en = ~UxRX ? 1'b0 : 1'b1; ns = ~ABAUD ? IDLE : step8;end
			end1: begin ld_en = 1'b1; UxRXIF = 1'b1; ns = IDLE; end
	   		default ns = IDLE;
		endcase
	end

	always@(posedge BRGCLK)begin
		ps <= ns;
	end
endmodule
