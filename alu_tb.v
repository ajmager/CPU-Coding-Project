`timescale 1ns / 1ps

module alu_tb;

reg [31:0] A, B;
reg [3:0] ALU_Sel;
reg clk; 

wire [63:0] ALU_Out;

integer i; 

alu test(
	A,B,
	clk,
	ALU_Sel,
	ALU_Out	
);
initial begin
	A <= 8'h22;
	B <= 8'h24;
	ALU_Sel <= 4'b0100;
	
	for (i = 0; i <= 13; i = i + 1)
	begin	
		//ALU_Sel <= ALU_Sel + 4'b0001;
		#10; 
	end
	
	A <= 8'hF6;
	B <= 8'h0A;

end
endmodule
