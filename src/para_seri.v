`timescale 1ns/1ns
//
// pararel serial converter
//
module para_seri (
    input CLK,			// 11.2896MHz
    input XRST,
    input wire [15:0] soundData,
    output reg sdout,            // serial sound data
    output reg LRCLK,		// 44.1KHz
    output reg FSMCLK,		// 176.4 KHz
    output reg FSM_XRST,
    input wire soundOn,
    output reg SCK		// 1.41MHz
);
//----------------------------------------------------------------------
reg [7:0] count; // 11.2896MHz free-run counter
                 // 0 -- 5644.8 KHz これは設計意図であり出来上がりは誤差有り
                 // 1 -- 2822.4 KHz
                 // 2 -- 1411.2 KHz (SCLK=BCLK)
		 // 3 --  705.6 KHz
		 // 4 --  352.8 KHz 
		 // 5 --  176.4 KHz (FSMCLK)
		 // 6 --   88.2 KHz
		 // 7 --   44.1 KHz (LRCLK)

/*
設計結果計	設計意図	
	11.290	        11.2896	MHz
	 5.645	         5.6448	MHz
	 2.8225	         2.8224	MHz
 	 1.41125         1.4112	MHz
       705.625	       705.6	KHz
       352.8125	       352.8	KHz
       176.40625       176.4	KHz
	88.203125       88.2	KHz
	44.1015625      44.1	KHz
*/

wire [31:0] sound;
wire [15:0] lsound, rsound;
reg sdout1, sdout2, sdout3, sdout4;

assign lsound = soundData;
assign rsound = soundData;

reg [4:0] sc;  // 0,1,...,31; serial data position in 32bit data
reg SCLK;		// 1.41MHz

always @(posedge CLK or negedge XRST)
begin
   if (~XRST) begin
      count <= #1 0;
      FSM_XRST <= #1 0;
   end else begin
      count <= #1 count + 1;
      if (count == 'h34)
      FSM_XRST <= #1 1;
   end
end

always @* begin
   SCK <= #1 1'b0;  // Internal Clock Mode
   SCLK <= #1 count[2];
   FSMCLK <= #1 count[5];
end

assign sound = soundOn ? {lsound, rsound}: 0; // sound data

always @(negedge SCLK or negedge XRST)
begin
   if (~XRST) begin
      sdout1 <= #1 0;
      sdout2 <= #1 0;
      sdout3 <= #1 0;
      sdout4 <= #1 0;
      sdout <= #1 0;
      LRCLK  <= #1 0;
   end else begin
      sdout1 <= #1 sound[sc];
      sdout2 <= #1 sdout1;
      sdout3 <= #1 sdout2;
      sdout4 <= #1 sdout3;
      sdout <= #1 sdout4;
      LRCLK <= #1 ~count[7];
   end
end

wire tmpreset;
assign tmpreset = XRST & soundOn;

always @(posedge SCLK or negedge tmpreset)
begin
   if (~tmpreset) begin
      sc <= #1 0;
   end else begin
      sc <= #1 sc - 1; // sound data pointer
   end
end

endmodule
