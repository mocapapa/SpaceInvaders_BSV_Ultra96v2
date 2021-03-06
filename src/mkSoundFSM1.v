//
// Generated by Bluespec Compiler (build 38534dc)
//
// On Sat Apr 18 19:00:43 JST 2020
//
//
// Ports:
// Name                         I/O  size props
// readstate                      O     5 reg
// rom_address                    O    15 reg
// sdout                          O     8 reg
// soundon                        O     1 reg
// fifo_ren                       O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// sound_code                     I     4
// rom_indata                     I     8 reg
// sync_lrclk                     I     1
// empty_flag                     I     1 reg
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkSoundFSM1(CLK,
		   RST_N,

		   sound_code,

		   rom_indata,

		   sync_lrclk,

		   empty_flag,

		   readstate,

		   rom_address,

		   sdout,

		   soundon,

		   fifo_ren);
  input  CLK;
  input  RST_N;

  // action method sound
  input  [3 : 0] sound_code;

  // action method rom
  input  [7 : 0] rom_indata;

  // action method sync
  input  sync_lrclk;

  // action method empty
  input  empty_flag;

  // value method readstate
  output [4 : 0] readstate;

  // value method rom_address
  output [14 : 0] rom_address;

  // value method sdout
  output [7 : 0] sdout;

  // value method soundon
  output soundon;

  // value method fifo_ren
  output fifo_ren;

  // signals for module outputs
  wire [14 : 0] rom_address;
  wire [7 : 0] sdout;
  wire [4 : 0] readstate;
  wire fifo_ren, soundon;

  // register addr
  reg [14 : 0] addr;
  wire [14 : 0] addr$D_IN;
  wire addr$EN;

  // register current
  reg [3 : 0] current;
  wire [3 : 0] current$D_IN;
  wire current$EN;

  // register data
  reg [7 : 0] data;
  wire [7 : 0] data$D_IN;
  wire data$EN;

  // register dcount
  reg [14 : 0] dcount;
  wire [14 : 0] dcount$D_IN;
  wire dcount$EN;

  // register dout
  reg [7 : 0] dout;
  reg [7 : 0] dout$D_IN;
  wire dout$EN;

  // register emptyf
  reg emptyf;
  wire emptyf$D_IN, emptyf$EN;

  // register fNO9
  reg fNO9;
  wire fNO9$D_IN, fNO9$EN;

  // register fUFO
  reg fUFO;
  wire fUFO$D_IN, fUFO$EN;

  // register i
  reg [7 : 0] i;
  wire [7 : 0] i$D_IN;
  wire i$EN;

  // register ren
  reg ren;
  wire ren$D_IN, ren$EN;

  // register romaddr
  reg [14 : 0] romaddr;
  reg [14 : 0] romaddr$D_IN;
  wire romaddr$EN;

  // register romdata
  reg [7 : 0] romdata;
  wire [7 : 0] romdata$D_IN;
  wire romdata$EN;

  // register rs_0
  reg [4 : 0] rs_0;
  reg [4 : 0] rs_0$D_IN;
  wire rs_0$EN;

  // register rs_1
  reg [4 : 0] rs_1;
  reg [4 : 0] rs_1$D_IN;
  wire rs_1$EN;

  // register rs_2
  reg [4 : 0] rs_2;
  reg [4 : 0] rs_2$D_IN;
  wire rs_2$EN;

  // register son
  reg son;
  wire son$D_IN, son$EN;

  // register sonEarly
  reg sonEarly;
  wire sonEarly$D_IN, sonEarly$EN;

  // register sp
  reg [1 : 0] sp;
  reg [1 : 0] sp$D_IN;
  wire sp$EN;

  // register state
  reg [4 : 0] state;
  reg [4 : 0] state$D_IN;
  wire state$EN;

  // register worka
  reg [14 : 0] worka;
  wire [14 : 0] worka$D_IN;
  wire worka$EN;

  // register workd
  reg [31 : 0] workd;
  wire [31 : 0] workd$D_IN;
  wire workd$EN;

  // rule scheduling signals
  wire WILL_FIRE_RL_rule_DATALEN_rule_S0,
       WILL_FIRE_RL_rule_DATALEN_rule_S1,
       WILL_FIRE_RL_rule_FORMAT_rule_S0,
       WILL_FIRE_RL_rule_FORMAT_rule_S1,
       WILL_FIRE_RL_rule_GETPACKET_rule_S0,
       WILL_FIRE_RL_rule_GETPACKET_rule_S1,
       WILL_FIRE_RL_rule_PLAY_rule_S0,
       WILL_FIRE_RL_rule_PLAY_rule_S1,
       WILL_FIRE_RL_rule_PLAY_rule_S2,
       WILL_FIRE_RL_rule_PLAY_rule_S3,
       WILL_FIRE_RL_rule_READCOUNT_rule_S0,
       WILL_FIRE_RL_rule_READCOUNT_rule_S1,
       WILL_FIRE_RL_rule_READCOUNT_rule_S2,
       WILL_FIRE_RL_rule_READMEM_rule_S0,
       WILL_FIRE_RL_rule_READMEM_rule_S1,
       WILL_FIRE_RL_rule_READMEM_rule_S2,
       WILL_FIRE_RL_rule_SYNCLRCLK_rule_S0,
       WILL_FIRE_RL_rule_SYNCLRCLK_rule_S1,
       WILL_FIRE_RL_rule_WAIT_rule_S0,
       WILL_FIRE_RL_rule_WAIT_rule_S1;

  // inputs to muxes for submodule ports
  wire [31 : 0] MUX_workd$write_1__VAL_1;
  wire [14 : 0] MUX_dcount$write_1__VAL_1,
		MUX_dcount$write_1__VAL_2,
		MUX_romaddr$write_1__VAL_1,
		MUX_romaddr$write_1__VAL_2,
		MUX_romaddr$write_1__VAL_5,
		MUX_romaddr$write_1__VAL_6,
		MUX_worka$write_1__VAL_2;
  wire [7 : 0] MUX_dout$write_1__VAL_1,
	       MUX_dout$write_1__VAL_2,
	       MUX_dout$write_1__VAL_3,
	       MUX_i$write_1__VAL_1;
  wire [4 : 0] MUX_state$write_1__VAL_3,
	       MUX_state$write_1__VAL_7,
	       MUX_state$write_1__VAL_8;
  wire [1 : 0] MUX_sp$write_1__VAL_1;
  wire MUX_dcount$write_1__SEL_1,
       MUX_dcount$write_1__SEL_2,
       MUX_dout$write_1__SEL_1,
       MUX_i$write_1__SEL_1,
       MUX_ren$write_1__SEL_1,
       MUX_romaddr$write_1__SEL_3,
       MUX_rs_0$write_1__PSEL_1,
       MUX_rs_0$write_1__SEL_1,
       MUX_rs_0$write_1__SEL_2,
       MUX_rs_0$write_1__SEL_3,
       MUX_rs_0$write_1__SEL_4,
       MUX_rs_1$write_1__SEL_1,
       MUX_rs_1$write_1__SEL_2,
       MUX_rs_1$write_1__SEL_3,
       MUX_rs_1$write_1__SEL_4,
       MUX_rs_2$write_1__SEL_1,
       MUX_rs_2$write_1__SEL_2,
       MUX_rs_2$write_1__SEL_3,
       MUX_rs_2$write_1__SEL_4,
       MUX_son$write_1__SEL_1,
       MUX_sonEarly$write_1__SEL_1,
       MUX_sp$write_1__SEL_3,
       MUX_sp$write_1__SEL_4,
       MUX_state$write_1__SEL_1,
       MUX_state$write_1__SEL_10,
       MUX_state$write_1__SEL_3,
       MUX_state$write_1__SEL_4,
       MUX_state$write_1__SEL_5,
       MUX_state$write_1__SEL_9;

  // remaining internal signals
  reg [2 : 0] CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4,
	      CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2;
  reg [1 : 0] CASE_state_BITS_1_TO_0_0_1_1_2_3__q1,
	      CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3;
  wire [4 : 0] SEL_ARR_rs_0_1_BITS_4_TO_2_2_rs_1_3_BITS_4_TO__ETC___d105,
	       state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
  wire [1 : 0] x__h3286;
  wire sp_5_EQ_0_6_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d80,
       sp_5_EQ_1_7_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d81,
       sp_5_EQ_2_8_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d82;

  // value method readstate
  assign readstate = state ;

  // value method rom_address
  assign rom_address = addr ;

  // value method sdout
  assign sdout = dout ;

  // value method soundon
  assign soundon = son ;

  // value method fifo_ren
  assign fifo_ren = ren ;

  // rule RL_rule_GETPACKET_rule_S0
  assign WILL_FIRE_RL_rule_GETPACKET_rule_S0 =
	     state[4:2] == 3'd0 && state[1:0] == 2'd0 && !emptyf ;

  // rule RL_rule_GETPACKET_rule_S1
  assign WILL_FIRE_RL_rule_GETPACKET_rule_S1 =
	     state[4:2] == 3'd0 && state[1:0] == 2'd1 ;

  // rule RL_rule_SYNCLRCLK_rule_S0
  assign WILL_FIRE_RL_rule_SYNCLRCLK_rule_S0 =
	     state[4:2] == 3'd1 && state[1:0] == 2'd0 ;

  // rule RL_rule_SYNCLRCLK_rule_S1
  assign WILL_FIRE_RL_rule_SYNCLRCLK_rule_S1 =
	     state[4:2] == 3'd1 && state[1:0] == 2'd1 ;

  // rule RL_rule_FORMAT_rule_S0
  assign WILL_FIRE_RL_rule_FORMAT_rule_S0 =
	     state[4:2] == 3'd2 && state[1:0] == 2'd0 ;

  // rule RL_rule_FORMAT_rule_S1
  assign WILL_FIRE_RL_rule_FORMAT_rule_S1 =
	     state[4:2] == 3'd2 && state[1:0] == 2'd1 ;

  // rule RL_rule_DATALEN_rule_S0
  assign WILL_FIRE_RL_rule_DATALEN_rule_S0 =
	     state[4:2] == 3'd3 && state[1:0] == 2'd0 ;

  // rule RL_rule_DATALEN_rule_S1
  assign WILL_FIRE_RL_rule_DATALEN_rule_S1 =
	     state[4:2] == 3'd3 && state[1:0] == 2'd1 ;

  // rule RL_rule_PLAY_rule_S0
  assign WILL_FIRE_RL_rule_PLAY_rule_S0 =
	     state[4:2] == 3'd4 && state[1:0] == 2'd0 ;

  // rule RL_rule_PLAY_rule_S1
  assign WILL_FIRE_RL_rule_PLAY_rule_S1 =
	     state[4:2] == 3'd4 && state[1:0] == 2'd1 ;

  // rule RL_rule_PLAY_rule_S2
  assign WILL_FIRE_RL_rule_PLAY_rule_S2 =
	     state[4:2] == 3'd4 && state[1:0] == 2'd2 ;

  // rule RL_rule_PLAY_rule_S3
  assign WILL_FIRE_RL_rule_PLAY_rule_S3 =
	     state[4:2] == 3'd4 && state[1:0] == 2'd3 ;

  // rule RL_rule_READCOUNT_rule_S0
  assign WILL_FIRE_RL_rule_READCOUNT_rule_S0 =
	     state[4:2] == 3'd5 && state[1:0] == 2'd0 ;

  // rule RL_rule_READCOUNT_rule_S1
  assign WILL_FIRE_RL_rule_READCOUNT_rule_S1 =
	     state[4:2] == 3'd5 && state[1:0] == 2'd1 ;

  // rule RL_rule_READCOUNT_rule_S2
  assign WILL_FIRE_RL_rule_READCOUNT_rule_S2 =
	     state[4:2] == 3'd5 && state[1:0] == 2'd2 ;

  // rule RL_rule_READMEM_rule_S0
  assign WILL_FIRE_RL_rule_READMEM_rule_S0 =
	     state[4:2] == 3'd6 && state[1:0] == 2'd0 ;

  // rule RL_rule_READMEM_rule_S1
  assign WILL_FIRE_RL_rule_READMEM_rule_S1 =
	     state[4:2] == 3'd6 && state[1:0] == 2'd1 ;

  // rule RL_rule_READMEM_rule_S2
  assign WILL_FIRE_RL_rule_READMEM_rule_S2 =
	     state[4:2] == 3'd6 && state[1:0] == 2'd2 ;

  // rule RL_rule_WAIT_rule_S0
  assign WILL_FIRE_RL_rule_WAIT_rule_S0 =
	     state[4:2] == 3'd7 && state[1:0] == 2'd0 ;

  // rule RL_rule_WAIT_rule_S1
  assign WILL_FIRE_RL_rule_WAIT_rule_S1 =
	     state[4:2] == 3'd7 && state[1:0] == 2'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_dcount$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code != 4'd3 || emptyf) &&
	     dcount != 15'd0 ;
  assign MUX_dcount$write_1__SEL_2 =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i == 8'd0 ;
  assign MUX_dout$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ;
  assign MUX_i$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i != 8'd0 ;
  assign MUX_ren$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_GETPACKET_rule_S0 && sound_code == 4'd3 ;
  assign MUX_romaddr$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 && current == 4'd3 ;
  assign MUX_rs_0$write_1__PSEL_1 =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 ;
  assign MUX_rs_0$write_1__SEL_1 = MUX_rs_0$write_1__PSEL_1 && sp == 2'd0 ;
  assign MUX_rs_0$write_1__SEL_2 =
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd0 ;
  assign MUX_rs_0$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_0_6_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d80 ;
  assign MUX_rs_0$write_1__SEL_4 =
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd0 ;
  assign MUX_rs_1$write_1__SEL_1 = MUX_rs_0$write_1__PSEL_1 && sp == 2'd1 ;
  assign MUX_rs_1$write_1__SEL_2 =
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd1 ;
  assign MUX_rs_1$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_1_7_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d81 ;
  assign MUX_rs_1$write_1__SEL_4 =
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd1 ;
  assign MUX_rs_2$write_1__SEL_1 = MUX_rs_0$write_1__PSEL_1 && sp == 2'd2 ;
  assign MUX_rs_2$write_1__SEL_2 =
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd2 ;
  assign MUX_rs_2$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_2_8_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d82 ;
  assign MUX_rs_2$write_1__SEL_4 =
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd2 ;
  assign MUX_son$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code == 4'd3 && !emptyf || dcount == 15'd0) ;
  assign MUX_sonEarly$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && !sonEarly ;
  assign MUX_sp$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_WAIT_rule_S1 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S2 ;
  assign MUX_sp$write_1__SEL_4 =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 ;
  assign MUX_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rule_SYNCLRCLK_rule_S0 && sync_lrclk ;
  assign MUX_state$write_1__SEL_3 =
	     WILL_FIRE_RL_rule_SYNCLRCLK_rule_S1 && !sync_lrclk ;
  assign MUX_state$write_1__SEL_4 =
	     WILL_FIRE_RL_rule_WAIT_rule_S0 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S1 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S0 ;
  assign MUX_state$write_1__SEL_5 =
	     WILL_FIRE_RL_rule_FORMAT_rule_S1 ||
	     WILL_FIRE_RL_rule_GETPACKET_rule_S1 ;
  assign MUX_state$write_1__SEL_9 =
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 ;
  assign MUX_state$write_1__SEL_10 =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 ;
  assign MUX_dcount$write_1__VAL_1 = dcount - 15'd1 ;
  assign MUX_dcount$write_1__VAL_2 = { workd[6:0], romdata } ;
  assign MUX_dout$write_1__VAL_1 = son ? romdata : 8'h80 ;
  assign MUX_dout$write_1__VAL_2 = sonEarly ? romdata : 8'h80 ;
  assign MUX_dout$write_1__VAL_3 =
	     (sound_code == 4'd3 && !emptyf || dcount == 15'd0) ?
	       8'h80 :
	       (son ? romdata : 8'h80) ;
  assign MUX_i$write_1__VAL_1 = i - 8'd1 ;
  assign MUX_romaddr$write_1__VAL_1 = romaddr + 15'd1 ;
  assign MUX_romaddr$write_1__VAL_2 = romaddr + 15'd4 ;
  assign MUX_romaddr$write_1__VAL_5 = romaddr + dcount ;
  assign MUX_romaddr$write_1__VAL_6 = romaddr - 15'd1 ;
  assign MUX_sp$write_1__VAL_1 = sp + 2'd1 ;
  assign MUX_state$write_1__VAL_3 =
	     { CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4, 2'd0 } ;
  assign MUX_state$write_1__VAL_7 =
	     (sound_code == 4'd3 && !emptyf || dcount == 15'd0) ?
	       5'd0 :
	       5'd24 ;
  assign MUX_state$write_1__VAL_8 =
	     (i == 8'd0) ?
	       SEL_ARR_rs_0_1_BITS_4_TO_2_2_rs_1_3_BITS_4_TO__ETC___d105 :
	       { state[4:2], 2'd1 } ;
  assign MUX_worka$write_1__VAL_2 = romaddr + { 7'd0, i } ;
  assign MUX_workd$write_1__VAL_1 = { workd[23:0], romdata } ;

  // register addr
  assign addr$D_IN = worka ;
  assign addr$EN = WILL_FIRE_RL_rule_READMEM_rule_S0 ;

  // register current
  assign current$D_IN = sound_code ;
  assign current$EN = MUX_ren$write_1__SEL_1 ;

  // register data
  assign data$D_IN = romdata ;
  assign data$EN = WILL_FIRE_RL_rule_READMEM_rule_S2 ;

  // register dcount
  assign dcount$D_IN =
	     MUX_dcount$write_1__SEL_1 ?
	       MUX_dcount$write_1__VAL_1 :
	       MUX_dcount$write_1__VAL_2 ;
  assign dcount$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code != 4'd3 || emptyf) &&
	     dcount != 15'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i == 8'd0 ;

  // register dout
  always@(MUX_dout$write_1__SEL_1 or
	  MUX_dout$write_1__VAL_1 or
	  WILL_FIRE_RL_rule_PLAY_rule_S0 or
	  MUX_dout$write_1__VAL_2 or
	  WILL_FIRE_RL_rule_PLAY_rule_S3 or
	  MUX_dout$write_1__VAL_3 or WILL_FIRE_RL_rule_GETPACKET_rule_S0)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dout$write_1__SEL_1: dout$D_IN = MUX_dout$write_1__VAL_1;
      WILL_FIRE_RL_rule_PLAY_rule_S0: dout$D_IN = MUX_dout$write_1__VAL_2;
      WILL_FIRE_RL_rule_PLAY_rule_S3: dout$D_IN = MUX_dout$write_1__VAL_3;
      WILL_FIRE_RL_rule_GETPACKET_rule_S0: dout$D_IN = 8'h80;
      default: dout$D_IN = 8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign dout$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S3 ||
	     WILL_FIRE_RL_rule_GETPACKET_rule_S0 ;

  // register emptyf
  assign emptyf$D_IN = empty_flag ;
  assign emptyf$EN = 1'd1 ;

  // register fNO9
  assign fNO9$D_IN = 1'b0 ;
  assign fNO9$EN = 1'b0 ;

  // register fUFO
  assign fUFO$D_IN = 1'b0 ;
  assign fUFO$EN = 1'b0 ;

  // register i
  assign i$D_IN = MUX_i$write_1__SEL_1 ? MUX_i$write_1__VAL_1 : 8'd3 ;
  assign i$EN =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i != 8'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S0 ;

  // register ren
  assign ren$D_IN = MUX_ren$write_1__SEL_1 ;
  assign ren$EN =
	     WILL_FIRE_RL_rule_GETPACKET_rule_S0 && sound_code == 4'd3 ||
	     WILL_FIRE_RL_rule_GETPACKET_rule_S1 ;

  // register romaddr
  always@(MUX_dcount$write_1__SEL_1 or
	  MUX_romaddr$write_1__VAL_1 or
	  MUX_dcount$write_1__SEL_2 or
	  MUX_romaddr$write_1__VAL_2 or
	  MUX_romaddr$write_1__SEL_3 or
	  WILL_FIRE_RL_rule_DATALEN_rule_S0 or
	  WILL_FIRE_RL_rule_FORMAT_rule_S1 or
	  MUX_romaddr$write_1__VAL_5 or
	  WILL_FIRE_RL_rule_DATALEN_rule_S1 or MUX_romaddr$write_1__VAL_6)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dcount$write_1__SEL_1: romaddr$D_IN = MUX_romaddr$write_1__VAL_1;
      MUX_dcount$write_1__SEL_2: romaddr$D_IN = MUX_romaddr$write_1__VAL_2;
      MUX_romaddr$write_1__SEL_3: romaddr$D_IN = 15'd16;
      WILL_FIRE_RL_rule_DATALEN_rule_S0:
	  romaddr$D_IN = MUX_romaddr$write_1__VAL_2;
      WILL_FIRE_RL_rule_FORMAT_rule_S1:
	  romaddr$D_IN = MUX_romaddr$write_1__VAL_5;
      WILL_FIRE_RL_rule_DATALEN_rule_S1:
	  romaddr$D_IN = MUX_romaddr$write_1__VAL_6;
      default: romaddr$D_IN = 15'b010101010101010 /* unspecified value */ ;
    endcase
  end
  assign romaddr$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code != 4'd3 || emptyf) &&
	     dcount != 15'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i == 8'd0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 && current == 4'd3 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S1 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 ;

  // register romdata
  assign romdata$D_IN = rom_indata ;
  assign romdata$EN = 1'd1 ;

  // register rs_0
  always@(MUX_rs_0$write_1__SEL_4 or
	  state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17 or
	  MUX_rs_0$write_1__SEL_1 or
	  MUX_rs_0$write_1__SEL_2 or MUX_rs_0$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rs_0$write_1__SEL_4:
	  rs_0$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_0$write_1__SEL_1:
	  rs_0$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_0$write_1__SEL_2 || MUX_rs_0$write_1__SEL_3: rs_0$D_IN = 5'd16;
      default: rs_0$D_IN = 5'b01010 /* unspecified value */ ;
    endcase
  end
  assign rs_0$EN =
	     MUX_rs_0$write_1__PSEL_1 && sp == 2'd0 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd0 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_0_6_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d80 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd0 ;

  // register rs_1
  always@(MUX_rs_1$write_1__SEL_4 or
	  state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17 or
	  MUX_rs_1$write_1__SEL_1 or
	  MUX_rs_1$write_1__SEL_2 or MUX_rs_1$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rs_1$write_1__SEL_4:
	  rs_1$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_1$write_1__SEL_1:
	  rs_1$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_1$write_1__SEL_2 || MUX_rs_1$write_1__SEL_3: rs_1$D_IN = 5'd16;
      default: rs_1$D_IN = 5'b01010 /* unspecified value */ ;
    endcase
  end
  assign rs_1$EN =
	     MUX_rs_0$write_1__PSEL_1 && sp == 2'd1 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_1_7_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d81 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd1 ;

  // register rs_2
  always@(MUX_rs_2$write_1__SEL_4 or
	  state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17 or
	  MUX_rs_2$write_1__SEL_1 or
	  MUX_rs_2$write_1__SEL_2 or MUX_rs_2$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rs_2$write_1__SEL_4:
	  rs_2$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_2$write_1__SEL_1:
	  rs_2$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_rs_2$write_1__SEL_2 || MUX_rs_2$write_1__SEL_3: rs_2$D_IN = 5'd16;
      default: rs_2$D_IN = 5'b01010 /* unspecified value */ ;
    endcase
  end
  assign rs_2$EN =
	     MUX_rs_0$write_1__PSEL_1 && sp == 2'd2 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 && sp == 2'd2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     sp_5_EQ_2_8_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d82 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && sp == 2'd2 ;

  // register son
  assign son$D_IN = !MUX_son$write_1__SEL_1 && sonEarly ;
  assign son$EN = MUX_son$write_1__SEL_1 || WILL_FIRE_RL_rule_PLAY_rule_S0 ;

  // register sonEarly
  assign sonEarly$D_IN = MUX_sonEarly$write_1__SEL_1 ;
  assign sonEarly$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S0 && !sonEarly ||
	     MUX_son$write_1__SEL_1 ;

  // register sp
  always@(MUX_dcount$write_1__SEL_1 or
	  MUX_sp$write_1__VAL_1 or
	  MUX_dcount$write_1__SEL_2 or
	  x__h3286 or MUX_sp$write_1__SEL_3 or MUX_sp$write_1__SEL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dcount$write_1__SEL_1: sp$D_IN = MUX_sp$write_1__VAL_1;
      MUX_dcount$write_1__SEL_2: sp$D_IN = x__h3286;
      MUX_sp$write_1__SEL_3: sp$D_IN = x__h3286;
      MUX_sp$write_1__SEL_4: sp$D_IN = MUX_sp$write_1__VAL_1;
      default: sp$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign sp$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code != 4'd3 || emptyf) &&
	     dcount != 15'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i == 8'd0 ||
	     WILL_FIRE_RL_rule_WAIT_rule_S1 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S2 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 ;

  // register state
  always@(MUX_state$write_1__SEL_1 or
	  state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17 or
	  MUX_ren$write_1__SEL_1 or
	  MUX_state$write_1__SEL_3 or
	  MUX_state$write_1__VAL_3 or
	  MUX_state$write_1__SEL_4 or
	  MUX_state$write_1__SEL_5 or
	  MUX_sp$write_1__SEL_3 or
	  SEL_ARR_rs_0_1_BITS_4_TO_2_2_rs_1_3_BITS_4_TO__ETC___d105 or
	  WILL_FIRE_RL_rule_PLAY_rule_S3 or
	  MUX_state$write_1__VAL_7 or
	  WILL_FIRE_RL_rule_READCOUNT_rule_S2 or
	  MUX_state$write_1__VAL_8 or
	  MUX_state$write_1__SEL_9 or
	  MUX_state$write_1__SEL_10 or WILL_FIRE_RL_rule_DATALEN_rule_S1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_state$write_1__SEL_1:
	  state$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_ren$write_1__SEL_1:
	  state$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_state$write_1__SEL_3: state$D_IN = MUX_state$write_1__VAL_3;
      MUX_state$write_1__SEL_4:
	  state$D_IN =
	      state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17;
      MUX_state$write_1__SEL_5: state$D_IN = MUX_state$write_1__VAL_3;
      MUX_sp$write_1__SEL_3:
	  state$D_IN =
	      SEL_ARR_rs_0_1_BITS_4_TO_2_2_rs_1_3_BITS_4_TO__ETC___d105;
      WILL_FIRE_RL_rule_PLAY_rule_S3: state$D_IN = MUX_state$write_1__VAL_7;
      WILL_FIRE_RL_rule_READCOUNT_rule_S2:
	  state$D_IN = MUX_state$write_1__VAL_8;
      MUX_state$write_1__SEL_9: state$D_IN = 5'd20;
      MUX_state$write_1__SEL_10: state$D_IN = 5'd24;
      WILL_FIRE_RL_rule_DATALEN_rule_S1: state$D_IN = 5'd28;
      default: state$D_IN = 5'b01010 /* unspecified value */ ;
    endcase
  end
  assign state$EN =
	     WILL_FIRE_RL_rule_SYNCLRCLK_rule_S0 && sync_lrclk ||
	     WILL_FIRE_RL_rule_GETPACKET_rule_S0 && sound_code == 4'd3 ||
	     WILL_FIRE_RL_rule_SYNCLRCLK_rule_S1 && !sync_lrclk ||
	     WILL_FIRE_RL_rule_WAIT_rule_S0 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S1 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S1 ||
	     WILL_FIRE_RL_rule_GETPACKET_rule_S1 ||
	     WILL_FIRE_RL_rule_WAIT_rule_S1 ||
	     WILL_FIRE_RL_rule_READMEM_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S3 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S0 ||
	     WILL_FIRE_RL_rule_FORMAT_rule_S0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S2 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S1 ||
	     WILL_FIRE_RL_rule_PLAY_rule_S0 ||
	     WILL_FIRE_RL_rule_DATALEN_rule_S1 ;

  // register worka
  assign worka$D_IN =
	     MUX_dcount$write_1__SEL_1 ?
	       MUX_romaddr$write_1__VAL_1 :
	       MUX_worka$write_1__VAL_2 ;
  assign worka$EN =
	     WILL_FIRE_RL_rule_PLAY_rule_S3 &&
	     (sound_code != 4'd3 || emptyf) &&
	     dcount != 15'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S1 ;

  // register workd
  assign workd$D_IN =
	     MUX_i$write_1__SEL_1 ? MUX_workd$write_1__VAL_1 : 32'd0 ;
  assign workd$EN =
	     WILL_FIRE_RL_rule_READCOUNT_rule_S2 && i != 8'd0 ||
	     WILL_FIRE_RL_rule_READCOUNT_rule_S0 ;

  // remaining internal signals
  assign SEL_ARR_rs_0_1_BITS_4_TO_2_2_rs_1_3_BITS_4_TO__ETC___d105 =
	     { CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2,
	       CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3 } ;
  assign sp_5_EQ_0_6_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d80 =
	     sp == 2'd0 && (sound_code != 4'd3 || emptyf) && dcount != 15'd0 ;
  assign sp_5_EQ_1_7_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d81 =
	     sp == 2'd1 && (sound_code != 4'd3 || emptyf) && dcount != 15'd0 ;
  assign sp_5_EQ_2_8_AND_NOT_code_wget__2_EQ_3_3_4_OR_e_ETC___d82 =
	     sp == 2'd2 && (sound_code != 4'd3 || emptyf) && dcount != 15'd0 ;
  assign state_BITS_4_TO_2_CONCAT_IF_state_BITS_1_TO_0__ETC___d17 =
	     { state[4:2], CASE_state_BITS_1_TO_0_0_1_1_2_3__q1 } ;
  assign x__h3286 = sp - 2'd1 ;
  always@(state)
  begin
    case (state[1:0])
      2'd0: CASE_state_BITS_1_TO_0_0_1_1_2_3__q1 = 2'd1;
      2'd1: CASE_state_BITS_1_TO_0_0_1_1_2_3__q1 = 2'd2;
      default: CASE_state_BITS_1_TO_0_0_1_1_2_3__q1 = 2'd3;
    endcase
  end
  always@(x__h3286 or rs_0 or rs_1 or rs_2)
  begin
    case (x__h3286)
      2'd0:
	  CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2 = rs_0[4:2];
      2'd1:
	  CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2 = rs_1[4:2];
      2'd2:
	  CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2 = rs_2[4:2];
      2'd3:
	  CASE_x286_0_rs_0_BITS_4_TO_2_1_rs_1_BITS_4_TO__ETC__q2 =
	      3'b010 /* unspecified value */ ;
    endcase
  end
  always@(x__h3286 or rs_0 or rs_1 or rs_2)
  begin
    case (x__h3286)
      2'd0:
	  CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3 = rs_0[1:0];
      2'd1:
	  CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3 = rs_1[1:0];
      2'd2:
	  CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3 = rs_2[1:0];
      2'd3:
	  CASE_x286_0_rs_0_BITS_1_TO_0_1_rs_1_BITS_1_TO__ETC__q3 =
	      2'b10 /* unspecified value */ ;
    endcase
  end
  always@(state)
  begin
    case (state[4:2])
      3'd0: CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4 = 3'd1;
      3'd1: CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4 = 3'd2;
      3'd2: CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4 = 3'd3;
      default: CASE_state_BITS_4_TO_2_0_1_1_2_2_3_4__q4 = 3'd4;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        dout <= `BSV_ASSIGNMENT_DELAY 8'h80;
	emptyf <= `BSV_ASSIGNMENT_DELAY 1'd1;
	fNO9 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fUFO <= `BSV_ASSIGNMENT_DELAY 1'd0;
	i <= `BSV_ASSIGNMENT_DELAY 8'd0;
	ren <= `BSV_ASSIGNMENT_DELAY 1'd0;
	son <= `BSV_ASSIGNMENT_DELAY 1'd0;
	sonEarly <= `BSV_ASSIGNMENT_DELAY 1'd0;
	sp <= `BSV_ASSIGNMENT_DELAY 2'd0;
	state <= `BSV_ASSIGNMENT_DELAY 5'd0;
      end
    else
      begin
        if (dout$EN) dout <= `BSV_ASSIGNMENT_DELAY dout$D_IN;
	if (emptyf$EN) emptyf <= `BSV_ASSIGNMENT_DELAY emptyf$D_IN;
	if (fNO9$EN) fNO9 <= `BSV_ASSIGNMENT_DELAY fNO9$D_IN;
	if (fUFO$EN) fUFO <= `BSV_ASSIGNMENT_DELAY fUFO$D_IN;
	if (i$EN) i <= `BSV_ASSIGNMENT_DELAY i$D_IN;
	if (ren$EN) ren <= `BSV_ASSIGNMENT_DELAY ren$D_IN;
	if (son$EN) son <= `BSV_ASSIGNMENT_DELAY son$D_IN;
	if (sonEarly$EN) sonEarly <= `BSV_ASSIGNMENT_DELAY sonEarly$D_IN;
	if (sp$EN) sp <= `BSV_ASSIGNMENT_DELAY sp$D_IN;
	if (state$EN) state <= `BSV_ASSIGNMENT_DELAY state$D_IN;
      end
    if (addr$EN) addr <= `BSV_ASSIGNMENT_DELAY addr$D_IN;
    if (current$EN) current <= `BSV_ASSIGNMENT_DELAY current$D_IN;
    if (data$EN) data <= `BSV_ASSIGNMENT_DELAY data$D_IN;
    if (dcount$EN) dcount <= `BSV_ASSIGNMENT_DELAY dcount$D_IN;
    if (romaddr$EN) romaddr <= `BSV_ASSIGNMENT_DELAY romaddr$D_IN;
    if (romdata$EN) romdata <= `BSV_ASSIGNMENT_DELAY romdata$D_IN;
    if (rs_0$EN) rs_0 <= `BSV_ASSIGNMENT_DELAY rs_0$D_IN;
    if (rs_1$EN) rs_1 <= `BSV_ASSIGNMENT_DELAY rs_1$D_IN;
    if (rs_2$EN) rs_2 <= `BSV_ASSIGNMENT_DELAY rs_2$D_IN;
    if (worka$EN) worka <= `BSV_ASSIGNMENT_DELAY worka$D_IN;
    if (workd$EN) workd <= `BSV_ASSIGNMENT_DELAY workd$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    addr = 15'h2AAA;
    current = 4'hA;
    data = 8'hAA;
    dcount = 15'h2AAA;
    dout = 8'hAA;
    emptyf = 1'h0;
    fNO9 = 1'h0;
    fUFO = 1'h0;
    i = 8'hAA;
    ren = 1'h0;
    romaddr = 15'h2AAA;
    romdata = 8'hAA;
    rs_0 = 5'h0A;
    rs_1 = 5'h0A;
    rs_2 = 5'h0A;
    son = 1'h0;
    sonEarly = 1'h0;
    sp = 2'h2;
    state = 5'h0A;
    worka = 15'h2AAA;
    workd = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rule_READMEM_rule_S2)
	$display("S2 %4x %2x", $unsigned(addr), $unsigned(romdata));
  end
  // synopsys translate_on
endmodule  // mkSoundFSM1

