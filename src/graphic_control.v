`timescale 1ns/1ns
// Graphic Controller
//
// Display HD   VD   Freq   HFP HSP HBP VFP VSP VBP
// VGA     640  480  27.175  16  96  48  10   2  33
// SVGA    800  600  40.0    40 128  88   1   4  23
// XGA    1024  768  65.0    24 136 160   3   6  29
// SXGA   1280 1024 108.0    48 112 248   1   3  38

module graphic_control(
	input wire CLK,
	input wire XRST,
	output reg XHS,
	output reg XVS,
	output reg DT,
	output reg [15:0] address
);
parameter HD=800;  // Phyisical Display Timing Horizontal
parameter HFP=40;
parameter HSP=128;
parameter HBP=88;
parameter HO=HFP+HSP+HBP;
parameter HL=HD+HO;	// 1056

parameter VD=600;  // Phyisical Display Timing Vertical
parameter VFP=1;
parameter VSP=4;
parameter VBP=23;
parameter VO=VFP+VSP+VBP;
parameter VL=VD+VO;	// 628

parameter EHD=512; // Embedded Display Timing Horizontal
parameter EVD=512; // Embedded Display Timing Vertical

parameter HW=11;
parameter VW=10;
parameter EHOFF = (HD-EHD)/2; // Embedded Display Offset Horizontal
parameter EVOFF = (VD-EVD)/2; // Embedded Display Offset Vertical

reg VCE = 0; // Vcounter Enable
reg HS;
reg VS;
reg [10:0] hcounter; // reg [HW-1:0] hcounter;
reg [9:0] vcounter;  // reg [VW-1:0] vcounter;
reg LHDT; // local horizontal display timing
reg LVDT; // local vertical display timing
reg [7:0] xaddress;
reg [7:0] yaddress;

// Horizontal Counter
always @(posedge CLK) begin
  if (XRST == 0) begin
     hcounter <= 0;
     VCE <= 0;
  end else if (hcounter == (HL - 1)) begin
     hcounter <= 0;
     VCE <= 1;
  end else begin
     hcounter <= hcounter + 1;
     VCE <= 0;
  end
  if (((HD + HFP) < hcounter) && (hcounter <= (HD + HFP + HSP))) HS <= 1;
  else HS <= 0;
  if (((EHOFF) < hcounter) && (hcounter <= (EHOFF + EHD))) LHDT <= 1;
  else LHDT <= 0;
end

// Vertical Counter
always @(posedge CLK) begin
  if (XRST == 0) begin
     vcounter <= 0;
  end else if ((vcounter == (VL - 1)) && VCE) begin
     vcounter <= 0;
  end else if (VCE) begin
    vcounter <= vcounter + 1;
  end
  if ((VD + VFP < vcounter) && (vcounter <= (VD + VFP + VSP))) VS <= 1;
  else VS <= 0;
  if (((EVOFF) < vcounter) && (vcounter <= (EVOFF + EVD))) LVDT <= 1;
  else LVDT <= 0;
end

always @* begin
    XHS = ~HS;
    XVS = ~VS;
    DT = LHDT & LVDT;
    xaddress = (hcounter - EHOFF) >> 1;
    yaddress = (vcounter - EVOFF) >> 1;
    address = {yaddress, xaddress};
end

endmodule
