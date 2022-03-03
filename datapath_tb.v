//and datapath_tb.v file <file name>
`timescale 1ns/10ps
module datapath_tb;
	reg HIout, LOout, PCout, Cout, Zlowout, Zhighout, MDRout;
	reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;	//add any other signals to see in your simulation
	reg IncPC, Read, clr;
	reg R0in, R1in, R2in,R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
	
	reg HIin, LOin, PCin, IRin, Yin, inPortout, Zin;
	reg MARin, MDRin;
	reg inPortin;
	reg [3:0] ALU_select;
	reg Clock;
	reg [31:0] Mdatain;
	wire [63:0] OutputData;
	wire [31:0] BUS_data;
	
	parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
	
	reg[3:0] Present_state = Default;
	
	
	datapath DUT(
		.clk(Clock),
		.r0_in(R0in),
		.r1_in(R1in),
		.r2_in(R2in),
		.r3_in(R3in),		
		.r4_in(R4in), 
		.r5_in(R5in),
		.r6_in(R6in),
		.r7_in(R7in),
		.r8_in(R8in),
		.r9_in(R9in),
		.r10_in(R10in),
		.r11_in(R11in),
		.r12_in(R12in),
		.r13_in(R13in),
		.r14_in(R14in),
		.r15_in(R15in),
		
		.r0out(R0out),
		.r1out(R1out),
		.r2out(R2out),
		.r3out(R3out),
		.r4out(R4out),
		.r5out(R5out),
		.r6out(R6out),
		.r7out(R7out),
		.r8out(R8out),
		.r9out(R9out),
		.r10out(R10out),
		.r11out(R11out),
		.r12out(R12out),
		.r13out(R13out),
		.r14out(R14out),
		.r15out(R15out),
		
		.HI_in(HIin),
		.LO_in(LOin),
		.HIout(HIout),
		.LOout(LOout),
		
		.PC_in(PCin),
		.PCout(PCout),
		
		.Inc_PC(IncPC),
		.read(Read),
		
		.IR_in(IRin), 
		.Y_in(Yin), 
		.Z_in(Zin),
		.ZLOWout(Zlowout),
		.ZHIout(Zhighout),
		
		.MAR_in(MARin), 
		.MDR_in(MDRin),
		.MDRout(MDRout),
		
		.inPort_in(inPortin),
		.inPortout(inPortout),
		
		.ALU_select(ALU_select),
		.MdataIn(Mdatain),
		.ALU_out(OutputData),
		
		.Cout(Cout),
		
		.BUS_data(BUS_data),
		
		.clr(clr)
	);
//add test logic here
initial
	begin
		Clock = 0;
		forever #10 Clock =~ Clock;
end

always @(posedge Clock)	//finite state machine; if clock rising-edge
	begin
		case(Present_state)
			Default			:		#40 Present_state = Reg_load1a;
			Reg_load1a		:		#40 Present_state = Reg_load1b;
			Reg_load1b		:		#40 Present_state = Reg_load2a;
			Reg_load2a		:		#40 Present_state = Reg_load2b;
			Reg_load2b		:		#40 Present_state = Reg_load3a;
			Reg_load3a		:		#40 Present_state = Reg_load3b;
			Reg_load3b		:		#40 Present_state = T0;
			T0					:		#40 Present_state = T1;
			T1					:		#40 Present_state = T2;
			T2					:		#40 Present_state = T3;
			T3					:		#40 Present_state = T4;
			T4					:		#40 Present_state = T5;
		endcase
	end
always@(Present_state)	//do the required job in each state

begin
	case(Present_state)		//assert the required signals in each clock cycle
		Default: begin
							
							
							PCout <=0;	Zlowout<=0; Zhighout<=0;	MDRout<=0;												//initialize the signals
							
							R0out<=0;	R1out<=0;	R3out<=0;
							R6out<=0;	R7out<=0;	R8out<=0;
							R9out<=0;	R10out<=0;	R11out<=0;
							R12out<=0;	R13out<=0;	R14out<=0;
							R15out<=0;
							
							R2out<=0;	R4out<=0;	R5out<=0;	MARin<=0;	Zin<=0;
							
							PCin<=0;		MDRin<=0;	IRin<=0;	Yin<=0;
							
							HIin<=0;		LOin<=0;		HIout<=0;	LOout<=0;
							
							IncPC<=0;	Read<=0; 	ALU_select<=0;
							
							R0in<=0;		R1in<=0;		R3in<=0;
							R6in<=0;		R7in<=0;		R8in<=0;
							R9in<=0;		R10in<=0;	R11in<=0;
							R12in<=0;	R13in<=0;	R14in<=0;
							R15in<=0;
							
							inPortin<=0;	inPortout<=0; Cout<=0;
							
							R5in<=0;		R2in<=0;		R4in<=0;		Mdatain<=32'h00000000;
							clr<=0;
							
		end
		Reg_load1a: begin	
							Mdatain <=32'h00000022;		
							Read = 0;	MDRin = 0;		//the first zero is there for completeness
							#10 Read<=1; MDRin<=1;
							#15 Read<=0; MDRin<=0;
							
		end
		Reg_load1b: begin
							#10 MDRout <=1; R2in<=1;
							#15 MDRout<=0;	R2in<=0;		//initialize R2 with the value $22

		end
		Reg_load2a: begin
							Mdatain<= 32'h00000024;
							#10 Read<=1; MDRin<=1;
							#15 Read<=0; MDRin<=0;
		end
		Reg_load2b: begin
							#10 MDRout<=1; R4in<=1;
							#15 MDRout<=0;	R4in<=0;		//initialize R4 with the value $24
							
		end
		Reg_load3a: begin 
							Mdatain<=32'h00000026;
							#10 Read<=1; MDRin<=1;
							#15 Read<=0; MDRin<=0;
		end
		Reg_load3b:	begin
							#10 MDRout<=1;	R5in<=1;
							#15 MDRout<=0; R5in<=0;		//initialize R5 with the value $26
		end
		
		T0: begin								//see if you need to de-assert these signals
							#10 PCout<=1;	MARin<=1; IncPC<=1;	Zin<=1;
							#25 PCout<=0;	MARin<=0; IncPC<=0;	Zin<=0;
		end
		T1: begin
							#10 Zlowout<=1;	PCin<=1;	MDRin<=1;
							#25 Zlowout<=0;	PCin<=0;	MDRin<=0;
							//Mdatain<= 32'h4A920000;		//opcode for "and R5, R2, R4"
		end
		T2: begin
							MDRout<=1;	IRin<=1;
							#10 MDRout<=0;	IRin<=0;
		end
		T3: begin
							#10 R2out<=1;	Yin<=1;
							#15 R2out<=0;	Yin<=0;
		end
		T4: begin
							R4out<=1;	ALU_select<=4'b0011;	Zin<=1;   // opcode hardco
							#25 R4out<=0;	Zin<=0;
		end
		T5: begin
							Zlowout<=1;	R5in<=1;
							#25 Zlowout<=0;	R5in<=0;
		end
	endcase
end
endmodule
		
		
		
							
		
		
		
		
							
							
							
							
			
