module alu(
	input signed [31:0] A,B,  // ALU 31-bit Inputs
	input clk,
	input [3:0] ALU_Sel,// ALU Selection
	output [63:0] ALU_Out // ALU 64-bit Output
);
	 
	wire [63:0] tempMulOut;
	wire [63:0] tempDivOut;
	reg [31:0] RHi, RLo;
	assign ALU_Out = {RHi, RLo}; // ALU out
	initial RHi = 0; 
	
	boothmul multiplication(A, B, tempMulOut);
	division divisionModule(A, B, tempDivOut);
	
	 
    always @(posedge clk)
    begin
        case(ALU_Sel)
        4'b0001 : // Addition
           		RLo <= A + B;
        4'b0010 : // Subtraction
           		RLo <= A - B;
        4'b0011 : // Multiplication
			begin
				RLo <= tempMulOut[31:0];
				RHi <= tempMulOut[63:32];
			end
        4'b0100 : // Division
			begin
				RLo <= tempDivOut[31:0];
				RHi <= tempDivOut[63:32];
			end
        4'b0101 : // AND
           		RLo <=  A & B;
        4'b0110 : // OR
           		RLo <= A | B;
        4'b0111 : // shift left
           		RLo <= A<<B;
        4'b1000 : // shift right
           		RLo <= A>>B;
        4'b1001 : // rotate left
					RLo <= 32'b0;//{A[30:0],A[31]};
        4'b1010 : // rotate right
					RLo <= 32'b0;//{A[0],A[31:1]};
        4'b1011 : // negate
           		RLo <= ~B+1; 
        4'b1100 : // XOR   
           		RLo <=  A ^ B; 
        4'b1101 : // NOR
           		RLo <=  ~(A | B);
        4'b1110 : //NAND
			RLo <= ~(A & B);
                           
        default: RLo = 32'bx; 
       endcase
    end
endmodule
