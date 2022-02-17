module alu(
           input [31:0] A,B,  // ALU 31-bit Inputs
           input [4:0] ALU_Sel,// ALU Selection
           output [63:0] ALU_Out // ALU 64-bit Output
    );
    reg [63:0] ALU_Result;
    assign ALU_Out = ALU_Result; // ALU out
	 reg [31:0] zeros = 32'h00000000;
	 
	 reg [63:0] tempMulOut;
	 reg [63:0] tempDivOut;
	 boothmul multiplication(A, B, tempMulOut);
	 div division(A, B, tempDivOut);
	 
    always @(*)
    begin
        case(ALU_Sel)
        0 : // Addition
           ALU_Result <= {zeros[31:0], A + B};
        1 : // Subtraction
           ALU_Result <= {zeros[31:0], A - B};
        2 : // Multiplication
			  ALU_Result <= tempMulOut;
        3 : // Division
			  ALU_Result <= tempDivOut;
        4 : // AND
           ALU_Result <= {zeros[31:0], A & B};
        5 : // OR
           ALU_Result <= {zeros[31:0], A | B};
        6 : // shift left
           ALU_Result <= {zeros[31:0], B<<1};
        7 : // shift right
           ALU_Result <= {zeros[31:0], B>>1}; 
        8 : // rotate left
           ALU_Result <= {zeros[31:0], {B[30:0],B[31]}};
        9: // rotate right
           ALU_Result <= {zeros[31:0], {B[0],B[31:1]}};
        10 : // negate
           ALU_Result <= {zeros[31:0],~B}; 
        11 : // XOR   
           ALU_Result <= {zeros[31:0], A ^ B}; 
        12 : // NOR
           ALU_Result <= {zeros[31:0], ~(A | B)};
        13 : //NAND
           ALU_Result <= {zeros[31:0], ~(A & B)};
                           
          default: ALU_Result = 64'bx ; 
        endcase
    end
endmodule
