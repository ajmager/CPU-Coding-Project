//32:1 BusMux

module BusMux_32_1(
output reg	[31:0]	mux_out,
input		[31:0]	BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15,
input		[31:0]	BusMuxIn_HI, BusMuxIn_LO,
input		[31:0]	BusMuxIn_ZHI, BusMuxIn_ZLOW,
input 	[31:0]	BusMuxIn_PC,
input		[31:0]	BusMuxIn_MDR,
input		[31:0]	BusMuxIn_InPort,
input		[31:0]	C_sign_extended,
input		[4:0]		select
);

always @ (BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, 
BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, 
BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI,
BusMuxIn_LO, BusMuxIn_ZHI, BusMuxIn_ZLOW, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_InPort,
C_sign_extended, select) begin

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
9:			mux_out = BusMuxIn_R9;
10:		mux_out = BusMuxIn_R10;
11:		mux_out = BusMuxIn_R11;
12:		mux_out = BusMuxIn_R12;
13:		mux_out = BusMuxIn_R13;
14:		mux_out = BusMuxIn_R14;
15:		mux_out = BusMuxIn_R15;
16:		mux_out = BusMuxIn_HI;
17:		mux_out = BusMuxIn_LO;
18:		mux_out = BusMuxIn_ZHI;
29:		mux_out = BusMuxIn_ZLOW;
20:		mux_out = BusMuxIn_PC;
21:		mux_out = BusMuxIn_MDR;
22:		mux_out = BusMuxIn_InPort;
23:		mux_out = C_sign_extended;
default:	mux_out = 32'bx;
endcase
end
endmodule
