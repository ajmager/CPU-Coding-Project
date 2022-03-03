//datapath.v
module datapath (
input clk, clr, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in, r8_in, r9_in, r10_in, r11_in, r12_in, r13_in, r14_in, r15_in,	//Input Signals
input PC_in, Inc_PC, IR_in, Y_in, Z_in, HI_in, LO_in,	//Input signals
input MAR_in, MDR_in, read, //Input Signals
input inPort_in,	//Input Signal
input r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out,	//Output Signals
input PCout, ZLOWout, ZHIout, LOout, HIout, MDRout, inPortout, Cout,	//Output Signals
input [3:0] ALU_select,
input [31:0] MdataIn,
output[63:0] ALU_out
);

	//data out wires
	
	//register out r0-r15 wires
	wire [31:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out;
	
	wire [31:0] PC_out;
	wire [31:0] HI_out;	//back to datapath
	wire [31:0] LO_out;	//back to datapath
	wire IR_out;
	wire [31:0] Y_out;	//to ALU
	wire [63:0] Z_out;	//out of Z register into Zlow/Zhi
	wire [31:0] MAR_out;	//To memory chip
	wire [31:0] MDR_out;	//To memory chip
	wire [31:0] outPort_out;	//To I/O Units
	wire [31:0] inPort_out; //to itself
	wire [31:0] C_out;
	
	
	wire [31:0] BUS_data;
	
	//32 bit Register setup
	register_32 R0(clk, clr, r0_in, BUS_data, r0_out);
	register_32 R1(clk, clr, r1_in, BUS_data, r1_out);
	register_32 R2(clk, clr, r2_in, BUS_data, r2_out);
	register_32 R3(clk, clr, r3_in, BUS_data, r3_out);
	register_32 R4(clk, clr, r4_in, BUS_data, r4_out);
	register_32 R5(clk, clr, r5_in, BUS_data, r5_out);
	register_32 R6(clk, clr, r6_in, BUS_data, r6_out);
	register_32 R7(clk, clr, r7_in, BUS_data, r7_out);
	register_32 R8(clk, clr, r8_in, BUS_data, r8_out);
	register_32 R9(clk, clr, r9_in, BUS_data, r9_out);
	register_32 R10(clk, clr, r10_in, BUS_data, r10_out);
	register_32 R11(clk, clr, r11_in, BUS_data, r11_out);
	register_32 R12(clk, clr, r12_in, BUS_data, r12_out);
	register_32 R13(clk, clr, r13_in, BUS_data, r13_out);
	register_32 R14(clk, clr, r14_in, BUS_data, r14_out);
	register_32 R15(clk, clr, r15_in, BUS_data, r15_out);
	
	register_32 IR(clk, clr, IR_in, BUS_data, IR_out);
	register_PC PC(clk, clr, PC_in, Inc_PC, BUS_data, PC_out);
	
	register_32 MAR(clk, clr, MAR_in, BUS_data, MAR_out);
	register_MDR MDR(clk, clr, MDR_in, BUS_data, MdataIn, read, MDR_out);
	
	register_32 HI(clk, clr, HI_in, BUS_data, HI_out);
	register_32 LO(clk, clr, LO_in, BUS_data, LO_out);
	
	register_32 Y(clk, clr, Y_in, BUS_data, Y_out); 
	register_64 Z(clk, clr, Z_in, ZHIout, ZLOWout, ALU_out, Z_out);
	
	
	//ALU
	alu ALU(Y_out, BUS_data, clk, ALU_select, ALU_out);
	
	
	bus bus_module(
		r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out, HI_out, LO_out, Z_out, Z_out, PC_out, MDR_out, inPort_out, C_sign_extended,
		r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out, HIout, LOout, ZHIout, ZLOWout, PCout, MDRout, inPortout, Cout,
		BUS_data,
		clk
	);
	
endmodule
