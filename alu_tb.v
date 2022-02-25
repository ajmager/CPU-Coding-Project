`timescale 1ns / 1ps

module alu_tb;

input [31:0] A, B;
input [4:0] ALU_Select;
input clk; 

output [63:0] ALU_Out;
//wire CarryOut; 

integer i; 

alu test(
	A,B,
	ALU_Select,
	ALU_Out,
	//CarryOut	
);
initial begin
	A <= 8'h0A;
	B <= 4'h02;
	ALU_Select <= 4'h0;
	
	for (i = 0; i <= 13; i = i + 1)
	begin	
		ALU_Select <= ALU_Select + 8'h01;
		#10; 
	end;
	
	A <= 8'hF6;
	B <= 8'h0A;

end
endmodule
	
	
