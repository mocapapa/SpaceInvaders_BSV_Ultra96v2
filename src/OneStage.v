module OneStage(
		input 	     srst,
		input 	     clk, 

		input 	     wr_en,
		input 	     wr_clk,
		input [3:0]  din,

		output [3:0] outp,
		output 	     empty,
		input 	     rd_en,
		input 	     rd_clk
		);

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [3:0]		outp;
   reg			empty;
   reg 			rd_dly, wr_dly;
   // End of automatics
   /*AUTOWIRE*/
   always@(posedge clk) begin
      if (srst) begin
	 rd_dly <= 0;
	 wr_dly <= 0;
      end else begin
	 rd_dly <= rd_en;
	 wr_dly <= wr_en;
      end
   end
   always@(posedge clk) begin
      if (srst) begin
	 outp <= 4'ha;
	 empty <= 1;
      end else if(wr_dly & wr_clk) begin
	 outp <= din;
	 empty <= 0;
      end else if (rd_dly & rd_clk) begin
	 empty <= 1;
      end
   end

endmodule // OneStage
