`timescale 1ns/1ns
module controller(input start, clk, rst, getA, getB, put1, put2, input[2:0] op,
		  		output reg initA, initP, initC, loadlsbA, loadmsbA, loadP, loadA, loadlsbB, loadmsbB, SA2, select, ready,
				output reg[1:0] SA);

	reg cen;
	wire co;
	reg[3:0]ps,ns;
	parameter[3:0] Idle = 0, Begins = 1, LA1 = 2, WA = 3, LA2 = 4, LB1 = 5, WB = 6, LB2 = 7, Count = 8, Put1 = 9, Put2 = 10;

	always@(ps,co ,start, getA,getB,op,put1)begin
		{initA,initP,initC,loadlsbA,loadmsbA,loadlsbB,loadmsbB,loadP,cen,SA2,loadA,select,ready}=13'b0;
		SA=2'b0;ns=Idle;
		case(ps)
			Idle:begin ns = start ? Begins : Idle;end
			Begins:begin ns = getA ? Begins : LA1; loadlsbA = 1; initA=1; initP = 1; initC = 1;end
			LA1:begin ns = getA ? WA : LA1; loadlsbA = 1;end
			WA: begin ns = getA ? WA: LA2;end
			LA2:begin ns = getB ? LA2: LB1; loadmsbA = 1;end
			LB1:begin ns = getB ? WB: LB1; loadlsbB = 1;end
			WB:ns = getB ? WB : LB2;
			LB2:begin ns = Count; loadmsbB = 1;end
			Count:begin ns = co ? Put1 : Count; loadA = 1; loadP = 1; cen = 1;
					if (op == 3'b000 || op==3'b111)begin SA = 2'b00; SA2 = 1;end
					else if (op == 3'b101 || op == 3'b110)begin SA=2'b01; SA2 = 0;end
					else if (op == 3'b001 || op == 3'b010) begin SA = 2'b01; SA2 = 1;end
					else if (op == 3'b011) begin SA = 2'b10; SA2 = 1;end
					else if (op == 3'b100) begin SA = 2'b10; SA2 = 0;end
					end
			Put1:begin ns = put1 ? Put1 : Put2; select = 0;end
			Put2:begin ns = put1 ? Put2 : Idle; select = 1; ready = 1;end
			default: ns = Idle;
		endcase
	end

	always@(posedge clk,posedge rst)begin
		if(rst) ps <= Idle;
		else ps <= ns;
	end

	wire[2:0]out;
	Counter counter( clk,rst,initC,cen,out, co);
endmodule
