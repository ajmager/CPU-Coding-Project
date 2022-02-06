module alu(
           input [31:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [31:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [32:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Multiplication  NEEDS TO BE CHANGED
           ALU_Result = A * B;
        4'b0011: // Division - NEEDS TO BE CHANGED
           ALU_Result = A/B;
        4'b0100: // AND
           ALU_Result = A & B;
        4'b0101: // OR
           ALU_Result = A | B;
        4'b0110: // shift left
           ALU_Result = A<<1 ;
        4'b0111: // shift right
           ALU_Result = A>>1; 
        4'b1000: // rotate left
           ALU_Result = {A[30:0,A[31]};
        4'b1001: // rotate right
           ALU_Result = {A[0],A[31:1]};                      
        4'b1010: // negate
           ALU_Result = ~A; 
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
