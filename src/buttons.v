`timescale 1ns/1ns
module buttons (
	input START_BUTTON,
	input FIRE_BUTTON,
	input LEFT_BUTTON,
	input RIGHT_BUTTON,
	input XSTART_SW,
	input XFIRE_SW,
	input XLEFT_SW,
	input XRIGHT_SW,
	output START_OUT,
	output FIRE_OUT,
	output LEFT_OUT,
	output RIGHT_OUT
);

assign START_OUT = START_BUTTON | ~XSTART_SW;
assign FIRE_OUT = FIRE_BUTTON | ~XFIRE_SW;
assign LEFT_OUT = LEFT_BUTTON | ~XLEFT_SW;
assign RIGHT_OUT = RIGHT_BUTTON | ~XRIGHT_SW;

endmodule