//datapath.v
module datapath (clk, clr, reset, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in, 
r8_in, r9_in, r10_in, r11_in, r12_in, r13_in, r14_in, r15_in, 
PC_in, IR_in, Y_in, Z_in,
MAR_in, MDR_in, 
inPort_in);

	//data out wires
	
	//register out r0-r15 wires
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
	wire [31:0] MDR_out;	//To memory chip
	wire [31:0] outPort_out;	//To I/O Units
	//wire [31:0] inPort_out; 
	
	wire [31:0] BUS_data;
	
	integer ready = 5'b00000;
	
	if (r0_out) begin
		ready <= 5'b00001;
	end
	if (r1_out) begin
		ready <= 5'b00010;
	end
	if (r2_out) begin
		ready <= 5'b00011;
	end	
	if (r3_out) begin
		ready <= 5'b00100;
	end
	if (r4_out) begin
		ready <= 5'b00101;
	end
	if (r5_out) begin
		ready <= 5'b00110;
	end
	if (r6_out) begin
		ready <= 5'b00111;
	end
	if (r7_out) begin
		ready <= 5'b01000;
	end
	if (r8_out) begin
		ready <= 5'b01001;
	end
	if (r9_out) begin
		ready <= 5'b01010;
	end
	if (r10_out) begin
		ready <= 5'b01011;
	end
	if (r11_out) begin
		ready <= 5'b01100;
	end
	if (r12_out) begin
		ready <= 5'b01101;
	end
	if (r13_out) begin
		ready <= 5'b01110;
	end
	if (r14_out) begin
		ready <= 5'b01111;
	end
	if (r15_out) begin
		ready <= 5'b10000;
	end
	if (PC_out) begin
		ready <= 5'b10001;
	end
	if (HI_out) begin
		ready <= 5'b10010;
	end
	if (LO_out) begin
		ready <= 5'b10011;
	end
	if (IR_out) begin
		ready <= 5'b10100;
	end
	if (Y_out) begin
		ready <= 5'b10101;
	end
	if (ZHI_out) begin
		ready <= 5'b10110;
	end	
	if (ZLOW_out) begin
		ready <= 5'b10111;
	end
	if (MDR_out) begin
		ready <= 5'b11000;
	endhgbbbhghg
	

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
	
	register_32 PC(clk, clr, PC_in, BUS_data, PC_out);
	register_32 HI(clk, clr, HI_in, BUS_data, HI_out);
	register_32 LO(clk, clr, LO_in, BUS_data, LO_out);
	register_32 IR(clk, clr, IR_in, BUS_data, IR_out);
	register_32 Y(clk, clr, Y_in, BUS_data, Y_out);
	register_32 ZHI(clk, clr, Z_in, BUS_data, ZHI_out);
	register_32 ZLOW(clk, clr, Z_in, BUS_data, ZLOW_out);
	register_32 MAR(clk, clr, MAR_in, BUS_data, MAR_out);
	register_32 MDR(clk, clr, MDR_in, BUS_data, MDR_out);
	//register_32 inPort(clk, clr, inPort_in, BUS_data, inPort_out);
	
	integer select;
	
	//Encoder - select signals S0 - S4
	encoder_32_5 encoder(select, ready);
	
	output [31:0] data_out;
	
	//Bus
	BusMux bus(data_out, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, ZHI, ZLOW, PC, MDR, inPort, C_sign_extended, select);
	
endmodule
