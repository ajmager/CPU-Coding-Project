'timescale 1ns / 1ps

module BoothTop(
	input [31:0] M, 
	input {32:0] Q, 
	output [7,0] Z //no clue how to update this one
	);
	
	wire [31:0] A_out1; 
	wire [32:0] Q_out1;
	
	Booth Booth1(
		.A_in(4'b0000),
		.M(M),
		.Q_in({Q,1'b0}),
		.A_out(A_out1),
		.Q_out(Q_out1)
	);

	wire [31:0] A_out2; 
	wire [32:0] Q_out2;

	Booth Booth2(
		.A_in(A_out1),
		.M(M),
		.Q_in(Q_out1),
		.A_out(A_out2),
		.Q_out(Q_out2)
	);

	wire [31:0] A_out3; 
	wire [32:0] Q_out3;

	Booth Booth3(
		.A_in(A_out2),
		.M(M),
		.Q_in(Q_out2),
		.A_out(A_out3),
		.Q_out(Q_out3)
	);

	wire [31:0] A_out4; 
	wire [32:0] Q_out4;

	Booth Booth4(
		.A_in(A_out3),
		.M(M),
		.Q_in(Q_out3),
		.A_out(A_out4),
		.Q_out(Q_out4)
	);
	       
	wire [31:0] A_out5; 
	wire [32:0] Q_out5;

	Booth Booth5(
		.A_in(A_out4),
		.M(M),
		.Q_in(Q_out4),
		.A_out(A_out5),
		.Q_out(Q_out5)
	);

	wire [31:0] A_out6; 
	wire [32:0] Q_out6;

	Booth Booth6(
		.A_in(A_out5),
		.M(M),
		.Q_in(Q_out5),
		.A_out(A_out6),
		.Q_out(Q_out6)
	);
	
	wire [31:0] A_out7; 
	wire [32:0] Q_out7;

	Booth Booth7(
		.A_in(A_out6),
		.M(M),
		.Q_in(Q_out6),
		.A_out(A_out7),
		.Q_out(Q_out7)
	);
	
	wire [31:0] A_out5; 
	wire [32:0] Q_out5;

	Booth Booth8(
		.A_in(A_out7),
		.M(M),
		.Q_in(Q_out7),
		.A_out(A_out8),
		.Q_out(Q_out8)
	);
	
	wire [31:0] A_out9; 
	wire [32:0] Q_out9;

	Booth Booth9(
		.A_in(A_out8),
		.M(M),
		.Q_in(Q_out8),
		.A_out(A_out9),
		.Q_out(Q_out9)
	);

	wire [31:0] A_out10; 
	wire [32:0] Q_out10;

	Booth Booth10(
		.A_in(A_out9),
		.M(M),
		.Q_in(Q_out9),
		.A_out(A_out10),
		.Q_out(Q_out10)
	);

	wire [31:0] A_out11; 
	wire [32:0] Q_out11;

	Booth Booth11(
		.A_in(A_out10),
		.M(M),
		.Q_in(Q_out10),
		.A_out(A_out11),
		.Q_out(Q_out11)
	);

	wire [31:0] A_out12; 
	wire [32:0] Q_out12;

	Booth Booth12(
		.A_in(A_out11),
		.M(M),
		.Q_in(Q_out11),
		.A_out(A_out12),
		.Q_out(Q_out12)
	);
	
	wire [31:0] A_out13; 
	wire [32:0] Q_out13;

	Booth Booth13(
		.A_in(A_out11),
		.M(M),
		.Q_in(Q_out11),
		.A_out(A_out13),
		.Q_out(Q_out13)
	);
	
	wire [31:0] A_out14; 
	wire [32:0] Q_out14;

	Booth Booth14(
		.A_in(A_out13),
		.M(M),
		.Q_in(Q_out13),
		.A_out(A_out14),
		.Q_out(Q_out14)
	);
	
	wire [31:0] A_out15; 
	wire [32:0] Q_out15;

	Booth Booth15(
		.A_in(A_out14),
		.M(M),
		.Q_in(Q_out14),
		.A_out(A_out15),
		.Q_out(Q_out15)
	);
	
	wire [31:0] A_out16; 
	wire [32:0] Q_out16;

	Booth Booth16(
		.A_in(A_out15),
		.M(M),
		.Q_in(Q_out15),
		.A_out(A_out16),
		.Q_out(Q_out16)
	);

	wire [31:0] A_out17; 
	wire [32:0] Q_out17;

	Booth Booth17(
		.A_in(A_out16),
		.M(M),
		.Q_in(Q_out16),
		.A_out(A_out17),
		.Q_out(Q_out17)
	);

	wire [31:0] A_out18; 
	wire [32:0] Q_out18;

	Booth Booth18(
		.A_in(A_out17),
		.M(M),
		.Q_in(Q_out17),
		.A_out(A_out18),
		.Q_out(Q_out18)
	);
	
	wire [31:0] A_out19; 
	wire [32:0] Q_out19;

	Booth Booth19(
		.A_in(A_out18),
		.M(M),
		.Q_in(Q_out18),
		.A_out(A_out19),
		.Q_out(Q_out19)
	);
	
	wire [31:0] A_out20; 
	wire [32:0] Q_out20;

	Booth Booth20(
		.A_in(A_out19),
		.M(M),
		.Q_in(Q_out19),
		.A_out(A_out20),
		.Q_out(Q_out20)
	);
	
	wire [31:0] A_out21; 
	wire [32:0] Q_out21;

	Booth Booth21(
		.A_in(A_out20),
		.M(M),
		.Q_in(Q_out20),
		.A_out(A_out21),
		.Q_out(Q_out21)
	);
	
	wire [31:0] A_out22; 
	wire [32:0] Q_out22;

	Booth Booth22(
		.A_in(A_out21),
		.M(M),
		.Q_in(Q_out21),
		.A_out(A_out22),
		.Q_out(Q_out22)
	);
	
	wire [31:0] A_out23; 
	wire [32:0] Q_out23;

	Booth Booth23(
		.A_in(A_out22),
		.M(M),
		.Q_in(Q_out22),
		.A_out(A_out23),
		.Q_out(Q_out23)
	);
	
	wire [31:0] A_out24; 
	wire [32:0] Q_out24;

	Booth Booth24(
		.A_in(A_out23),
		.M(M),
		.Q_in(Q_out23),
		.A_out(A_out24),
		.Q_out(Q_out24)
	);
	
	wire [31:0] A_out25; 
	wire [32:0] Q_out25;

	Booth Booth25(
		.A_in(A_out24),
		.M(M),
		.Q_in(Q_out24),
		.A_out(A_out25),
		.Q_out(Q_out25)
	);
	
	wire [31:0] A_out26; 
	wire [32:0] Q_out26;

	Booth Booth26(
		.A_in(A_out25),
		.M(M),
		.Q_in(Q_out25),
		.A_out(A_out26),
		.Q_out(Q_out26)
	);
	
	wire [31:0] A_out27; 
	wire [32:0] Q_out27;

	Booth Booth27(
		.A_in(A_out26),
		.M(M),
		.Q_in(Q_out26),
		.A_out(A_out27),
		.Q_out(Q_out27)
	);
	
	wire [31:0] A_out28; 
	wire [32:0] Q_out28;

	Booth Booth28(
		.A_in(A_out27),
		.M(M),
		.Q_in(Q_out27),
		.A_out(A_out28),
		.Q_out(Q_out28)
	);

	wire [31:0] A_out29; 
	wire [32:0] Q_out29;

	Booth Booth29(
		.A_in(A_out28),
		.M(M),
		.Q_in(Q_out28),
		.A_out(A_out29),
		.Q_out(Q_out29)
	);
	
	wire [31:0] A_out30; 
	wire [32:0] Q_out30;

	Booth Booth30(
		.A_in(A_out29),
		.M(M),
		.Q_in(Q_out29),
		.A_out(A_out30),
		.Q_out(Q_out30)
	);
	
	wire [31:0] A_out31; 
	wire [32:0] Q_out31;

	Booth Booth31(
		.A_in(A_out30),
		.M(M),
		.Q_in(Q_out30),
		.A_out(A_out31),
		.Q_out(Q_out31)
	);
	       
	wire [31:0] A_out32; 
	wire [32:0] Q_out32;

	Booth Booth32(
		.A_in(A_out31),
		.M(M),
		.Q_in(Q_out31),
		.A_out(A_out32),
		.Q_out(Q_out32)
	);
	
	////
	// continue pattern for remaining 28 bits - if we need 32 bit multiplecation
	////

	assign Z = {A_out32, Q_out4{32:1]};

////
// need to connect 2 files to each other - i dont know how to atm 
////

endmodule