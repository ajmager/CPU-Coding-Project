//datapath.v
module datapath (clk, clr, reset, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in, 
r8_in, r9_in, r10_in, r11_in, r12_in, r13_in, r14_in, r15_in, PC_in, IR_in, Y_in, Z_in);

	//data out wires
	
	//register out r0-r15
	wire [31:0] r0_out;
	wire [31:0] r1_out;
	wire [31:0] r2_out;
	wire [31:0] r3_out;
	wire [31:0] r4_out;
	wire [31:0] r5_out;
	wire [31:0] r6_out;
	wire [31:0] r7_out;
	wire [31:0] r8_out;
	wire [31:0] r9_out;
	wire [31:0] r10_out;
	wire [31:0] r11_out;
	wire [31:0] r12_out;
	wire [31:0] r13_out;
	wire [31:0] r14_out;
	wire [31:0] r15_out;
	
	wire [31:0] PC_out;
	wire [31:0] HI_out;	//back to datapath
	wire [31:0] LO_out;	//back to datapath
	wire [31:0] IR_out;	
	wire [31:0] Y_out;	//to ALU
	wire [31:0] ZHI_out;	//Out from Z
	wire [31:0] ZLOW_out;//Out from Z
	wire [31:0] MAR_out;	//To memory chip
	
	wire [31:0] BUS_data;
	
	register_32bit R0(clk, clr, r0_in, BUS_data, r0_out);
	register_32bit R1(clk, clr, r1_in, BUS_data, r1_out);
	register_32bit R2(clk, clr, r2_in, BUS_data, r2_out);
	register_32bit R3(clk, clr, r3_in, BUS_data, r3_out);
	register_32bit R4(clk, clr, r4_in, BUS_data, r4_out);
	register_32bit R5(clk, clr, r5_in, BUS_data, r5_out);
	register_32bit R6(clk, clr, r6_in, BUS_data, r6_out);
	register_32bit R7(clk, clr, r7_in, BUS_data, r7_out);
	register_32bit R8(clk, clr, r8_in, BUS_data, r8_out);
	register_32bit R9(clk, clr, r9_in, BUS_data, r9_out);
	register_32bit R10(clk, clr, r10_in, BUS_data, r10_out);
	register_32bit R11(clk, clr, r11_in, BUS_data, r11_out);
	register_32bit R12(clk, clr, r12_in, BUS_data, r12_out);
	register_32bit R13(clk, clr, r13_in, BUS_data, r13_out);
	register_32bit R14(clk, clr, r14_in, BUS_data, r14_out);
	register_32bit R15(clk, clr, r15_in, BUS_data, r15_out);
	
	register_32bit PC(clk, clr, PC_in, BUS_data, PC_out);
	register_32bit HI(clk, clr, HI_in, BUS_data, HI_out);
	register_32bit LO(clk, clr, LO_in, BUS_data, LO_out);
	register_32bit IR(clk, clr, IR_in, BUS_data, IR_out);
	register_32bit Y(clk, clr, Y_in, BUS_data, Y_out);
	register_32bit ZHI(clk, clr, Z_in, BUS_data, ZHI_out);
	register_32bit ZLOW(clk, clr, Z_in, BUS_data, ZLOW_out);
	register_32bit MAR(clk, clr, MAR_in, BUS_data, MAR_out);
	
endmodule