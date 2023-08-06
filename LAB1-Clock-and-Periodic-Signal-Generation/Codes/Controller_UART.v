`timescale 1ps/1ps
module Controller_UART(
	input BRGCLK, UxRX, ABAUD,
	output reg cnt_en, cnt_rst, ld_en, UxRXIF);

	reg[3:0]ns,ps;
	parameter[3:0] IDLE = 0,initialization = 1, BEGINS = 2, step0= 3, step1= 4, step2= 5 , step3= 6, step4 = 7,
	step5 = 8, step6 = 9, step7 = 10, step8 = 11;

	always@(ps,UxRX,ABAUD) begin
		ns = 0;
		case(ps)
			IDLE: ns = ~ABAUD ? IDLE : initialization;
	   		initialization: begin cnt_rst = ~UxRX ? 1'b0 : 1'b1; ns = ~UxRX ? BEGINS : initialization; end
	   		BEGINS: begin cnt_rst = 0; ld_en = ~UxRX ? 1'b0 : 1'b1; cnt_en = ~UxRX ? 1'b0 : 1'b1; ns = ~UxRX ? BEGINS : step0; end
	   		step0: ns = ~UxRX ? step1 : step0;
	   		step1: ns = ~UxRX ? step1 : step2;
	   		step2: ns = ~UxRX ? step3 : step2;
	   		step3: ns = ~UxRX ? step3 : step4;
	   		step4: ns = ~UxRX ? step5 : step4;
	   		step5: ns = ~UxRX ? step5 : step6;
	   		step6: begin ld_en = ~UxRX ? 1'b1 : 1'b0; cnt_en = ~UxRX ? 1'b1 : 1'b0; ns = ~UxRX ? step7 : step6; end
	   		step7: ns = ~UxRX ? step7 : step8;
	   		step8: begin UxRXIF = ~ABAUD ? 1'b1 : 1'b0; ns = ~ABAUD ? IDLE : step8;end
	   		default ns = IDLE;
		endcase
	end
	
	always@(posedge BRGCLK)begin
		ps <= ns;
	end
endmodule