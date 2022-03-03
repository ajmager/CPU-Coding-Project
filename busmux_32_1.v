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

	always @ (*) begin
	
		case(select)
			5'd23		:			mux_out <= BusMuxIn_R0;
			5'd22		:			mux_out <= BusMuxIn_R1;
			5'd21		:			mux_out <= BusMuxIn_R2;
			5'd20		:			mux_out <= BusMuxIn_R3;
			5'd19		:			mux_out <= BusMuxIn_R4;
			5'd18		:			mux_out <= BusMuxIn_R5;
			5'd17		:			mux_out <= BusMuxIn_R6;
			5'd16		:			mux_out <= BusMuxIn_R7;
			5'd15		:			mux_out <= BusMuxIn_R8;
			5'd14		:			mux_out <= BusMuxIn_R9;
			5'd13		:			mux_out <= BusMuxIn_R10;
			5'd12		:			mux_out <= BusMuxIn_R11;
			5'd11		:			mux_out <= BusMuxIn_R12;
			5'd10		:			mux_out <= BusMuxIn_R13;
			5'd9		:			mux_out <= BusMuxIn_R14;
			5'd8		:			mux_out <= BusMuxIn_R15;
			5'd7		:			mux_out <= BusMuxIn_HI;
			5'd6		:			mux_out <= BusMuxIn_LO;
			5'd5		:			mux_out <= BusMuxIn_ZHI;
			5'd4		:			mux_out <= BusMuxIn_ZLOW;
			5'd3		:			mux_out <= BusMuxIn_PC;
			5'd2		:			mux_out <= BusMuxIn_MDR;
			5'd1		:			mux_out <= BusMuxIn_InPort;
			5'd0		:			mux_out <= C_sign_extended;
			default:				mux_out <= 32'bx;
		endcase
	end
endmodule
