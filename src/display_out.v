`timescale 1ns/1ns
module display_out (
	input wire [2:0] indata,	// R,G,B
	input wire DT,		// ディスプレイタイミング
	input wire EXP,		// 爆発時は赤
	output reg RD,
	output reg GD,
	output reg BD
	);
	always @* begin
	    if (~EXP) begin
	        RD <= #1 indata[2] & DT;
	        GD <= #1 indata[1] & DT;
	        BD <= #1 indata[0] & DT;
	    end else begin
	        RD <= #1 (indata[2] | indata[1] | indata[0]) & DT;
	        GD <= #1 1'b0;
	        BD <= #1 1'b0;
	    end
	end
endmodule
