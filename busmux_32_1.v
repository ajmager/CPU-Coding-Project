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
	input		[4:0]		select,
	input clk
);

	always @ (select, clk, BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5,
	BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13,
	BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_ZHI, BusMuxIn_ZLOW, BusMuxIn_PC, BusMuxIn_MDR,
	BusMuxIn_InPort, C_sign_extended) begin
	
		case(select)
			23		:			mux_out = BusMuxIn_R0;
			22		:			mux_out = BusMuxIn_R1;
			21		:			mux_out = BusMuxIn_R2;
			20		:			mux_out = BusMuxIn_R3;
			19		:			mux_out = BusMuxIn_R4;
			18		:			mux_out = BusMuxIn_R5;
			17		:			mux_out = BusMuxIn_R6;
			16		:			mux_out = BusMuxIn_R7;
			15		:			mux_out = BusMuxIn_R8;
			14		:			mux_out = BusMuxIn_R9;
			13		:			mux_out = BusMuxIn_R10;
			12		:			mux_out = BusMuxIn_R11;
			11		:			mux_out = BusMuxIn_R12;
			10		:			mux_out = BusMuxIn_R13;
			9		:			mux_out = BusMuxIn_R14;
			8		:			mux_out = BusMuxIn_R15;
			7		:			mux_out = BusMuxIn_HI;
			6		:			mux_out = BusMuxIn_LO;
			5		:			mux_out = BusMuxIn_ZHI;
			4		:			mux_out = BusMuxIn_ZLOW;
			3		:			mux_out = BusMuxIn_PC;
			2		:			mux_out = BusMuxIn_MDR;
			1		:			mux_out = BusMuxIn_InPort;
			0		:			mux_out = C_sign_extended;
			default:				mux_out = 32'bx;
		endcase
	end
endmodule
