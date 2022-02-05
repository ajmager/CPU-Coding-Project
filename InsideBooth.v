'timescale 1ns / 1ps 

module Booth (
	input [31:0] A_in,
	input [31:0] M,
	input [32:0] Q_in,
	output [31:0] A_out,
	output [32:0] Q_out
	);
	
	reg [31:0] A_temp;
	reg [32:0] Q_temp;
	
	wire [31:0] A_sum = A_in + M;
	wire [31:0] A_sub = A_in + ~M + 1; // adding the 2's compliment of M
	
	always@(A_in, M, Q_in, A_sum, A_sub)begin
		
		case(Q_in[1:0])
		
			2'b00, 2'b11:	begin	
				A_temp = {A_in[31], A_in[31:1]}; //copy most sig bit and shift
				Q_temp = {A_in[0], Q_in[32:1]};
					end
			2'b01: 		begin
				A_temp = {A_sum[31], A_sum[31:1]};
				Q_temp = {A_sum[0], Q_in[32:1]};
					end
			2'b10:		begin
				A_temp = {A_sub[31], A_sub[31:1]};
				Q_temp = {A_sub[0], Q_in[32:1]};
					end
		endcase
	end

	assign A_out = A_temp;
	assign Q_out = Q_temp;						
	
endmodule
