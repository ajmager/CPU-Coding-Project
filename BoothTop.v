'timescale 1ns / 1ps

module BoothTop(
	input [3:0] M, 
	input {4:0] Q, 
	output [7,0] Z
	);
	
wire [3:0] A_out1; 
wire [4:0] Q_out1;
	
Booth Booth1(
	.A_in(4'b0000),
	.M(M),
	.Q_in({Q,1'b0}),
	.A_out(A_out1),
	.Q_out(Q_out1)
);

wire [3:0] A_out2; 
wire [4:0] Q_out2;
	
Booth Booth2(
	.A_in(A_out1),
	.M(M),
	.Q_in(Q_out1),
	.A_out(A_out2),
	.Q_out(Q_out2)
);

wire [3:0] A_out3; 
wire [4:0] Q_out3;
	
Booth Booth3(
	.A_in(A_out2),
	.M(M),
	.Q_in(Q_out2),
	.A_out(A_out3),
	.Q_out(Q_out3)
);
	
wire [3:0] A_out4; 
wire [4:0] Q_out4;
	
Booth Booth4(
	.A_in(A_out3),
	.M(M),
	.Q_in(Q_out3),
	.A_out(A_out4),
	.Q_out(Q_out4)
);

////
// continue pattern for remaining 28 bits - if we need 32 bit multiplecation
////

assign Z = {A_out4, Q_out4{4:1]};

////
// need to connect 2 files to each other - i dont know how to atm 
////

endmodule