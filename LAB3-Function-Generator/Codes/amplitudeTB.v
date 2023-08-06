`timescale 1ns/1ns
module amplitudeTB();
    reg[1:0] division = 2'd0;
    reg[7:0] in = 8'd120;
    wire[7:0] out;
    amplitude_selector CUT(division, in, out);

    initial begin
        #100 division = 2'd0;
        #100 division = 2'd1;
        #100 division = 2'd2;
        #100 division = 2'd3;
        #500 in = 8'd80;
        #100 division = 2'd0;
        #100 division = 2'd1;
        #100 division = 2'd2;
        #100 division = 2'd3;
        #500 in = 8'd200;
        #100 division = 2'd0;
        #100 division = 2'd1;
        #100 division = 2'd2;
        #100 division = 2'd3;
        #5000 $stop;
    end

endmodule
