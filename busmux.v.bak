//32:1 BusMux

module Mux_Bus(
output	[31:0]	mux_out,
input		[31:0]	BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15,
input		[31:0]	BusMuxIn_HI, BusMuxIn_LO,
input		[31:0]	BusMuxIn_ZHI, BUSMuxIn_ZLOW,
input 	[31:0]	BusMuxIn_PC, 
input		[31:0]	BusMuxIn_MDR,
input		[31:0]	BusMuxIn_InPort,
input		[31:0]	C_sign_extended,
input		[4:0]		select
);

always @ (BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, 
BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, 
BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI,
BusMuxIn_LO, BusMuxIn_MDR, BusMuxIn_InPort, C_sign_extended, select)

case(select)
0:			mux_out = BusMuxIn_R0;
1:			mux_out = BusMuxIn_R1;
2:			mux_out = BusMuxIn_R2;
3:			mux_out = BusMuxIn_R3;
4:			mux_out = BusMuxIn_R4;
5:			mux_out = BusMuxIn_R5;
6:			mux_out = BusMuxIn_R6;
7:			mux_out = BusMuxIn_R7;
8:			mux_out = BusMuxIn_R8;
9:			mux_out = BusMuxIn_R7;
10:		mux_out = BusMuxIn_R8;
11:		mux_out = BusMuxIn_R10;
12:		mux_out = BusMuxIn_R11;
13:		mux_out = BusMuxIn_R12;
14:		mux_out = BusMuxIn_R13;
15:		mux_out = BusMuxIn_R14;
16:		mux_out = BusMuxIn_R15;
17:		mux_out = BusMuxIn_HI;
18:		mux_out = BusMuxIn_LO;
19:		mux_out = BusMuxIn_ZHI;
20:		mux_out = BusMuxIn_ZLOW;
21:		mux_out = BusMuxIn_PC;
22:		mux_out = BusMuxIn_MDR;
23:		mux_out = BusMuxIn_InPort;
24:		mux_out = C_sign_extended
default:	mux_out = 32'bx;
endcase
endmodule
