module alu(
           input [31:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [31:0] ALU_Out, // ALU 8-bit Output
           output [31:0] Z_High, Z_Low;
           output CarryOut // Carry Out Flag
    );
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = A + B;
    assign CarryOut = tmp[32]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel) begin
        4'b0000: // Addition
           ALU_Result = A + B; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Multiplication  NEEDS TO BE CHANGED
           boothmul multiplication(A, B, Z_Low, Z_High); 
        4'b0011: // Division - NEEDS TO BE CHANGED
           div division(clk, ready, A, B, Z_High, Z_Low); //Z_High is Q, Z_Low is R
        4'b0100: // AND
           ALU_Result = A & B;
        4'b0101: // OR
           ALU_Result = A | B;
        4'b0110: // shift left
           ALU_Result = B<<1 ;
        4'b0111: // shift right
           ALU_Result = B>>1; 
        4'b1000: // rotate left
           ALU_Result = {B[30:0,B[31]};
        4'b1001: // rotate right
           ALU_Result = {B[0],B[31:1]};
        4'b1010: // negate
           ALU_Result = ~B; 
        4'b1011: // XOR   
           ALU_Result = A ^ B; 
        4'b1100: // NOR
           ALU_Result = ~(A | B);
        4'b1101: //NAND
           ALU_Result = ~(A & B);
                           
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule
