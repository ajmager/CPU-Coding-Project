//Bus
module bus(
	input [31:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out, HI_out, LO_out, ZHI_out, ZLOW_out, PC_out, MDR_out, inPort_out, C_sign_extended, 
	input r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out, HIout, LOout, ZHIout, ZLOWout, PCout, MDRout, inPortout,Cout,
	output [31:0] BUS_data,
	input clk
);
	integer ready = 32'hx;

	wire[4:0] select;
		
	//Encoder - select signals S0 - S4
	encoder_32_5 encoder(select, r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out, HIout, LOout, ZHIout, ZLOWout, PCout, MDRout, inPortout, Cout, clk);
		
	//assign C_sign_extended = {14{IR_out[17]}, IR_out [17:0]};
		
	//Bus
	BusMux_32_1 busmux(BUS_data, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out, HI_out, LO_out, ZHI_out, ZLOW_out, PC_out, MDR_out, inPort_out, C_sign_extended, select); 

endmodule
	