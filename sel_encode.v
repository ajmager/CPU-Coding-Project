// Phase 2 - Select and Encode
module sel_encode (
	input Gra, Grb, Grc, Rin, Rout, BAout,
	input IR,
	output [31:0] C_sign_extended,
	output R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R11in, R12in, R13in, R14in, R15in,
	output R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out
);

	wire [3:0] Ra, Rb, Rc;
	wire [15:0] logic_to_reg;
	wire [3:0] logic_out;
	wire RandBlogicOut;

	always (*) begin
	
		//initial logic
		Ra <= Ra&Gra;
		Rb <= Rb&Grb;
		Rc <= Rc&Grc;
		
		logic_out <= Ra | Rb | Rc;
		
		RandBlogicOut <= Rout | BAout;
		
		
		//decoder
		
		case(logic_out)
			3'b0000: begin logic_to_reg = 16'b0000000000000001; end
			3'b0001:	begin logic_to_reg = 16'b0000000000000010; end
			3'b0010:	begin logic_to_reg = 16'b0000000000000100; end
			3'b0011:	begin logic_to_reg = 16'b0000000000001000; end
			3'b0100:	begin logic_to_reg = 16'b0000000000010000; end
			3'b0101:	begin logic_to_reg = 16'b0000000000100000; end
			3'b0110:	begin logic_to_reg = 16'b0000000001000000; end
			3'b0111:	begin logic_to_reg = 16'b0000000010000000; end
			3'b1000:	begin logic_to_reg = 16'b0000000100000000; end
			3'b1001:	begin logic_to_reg = 16'b0000001000000000; end
			3'b1010:	begin logic_to_reg = 16'b0000010000000000; end
			3'b1011:	begin logic_to_reg = 16'b0000100000000000; end
			3'b1100:	begin logic_to_reg = 16'b0001000000000000; end
			3'b1101:	begin logic_to_reg = 16'b0010000000000000; end
			3'b1110:	begin logic_to_reg = 16'b0100000000000000; end
			3'b1111:	begin logic_to_reg = 16'b1000000000000000; end
			
			//Logic out of decoder - Rin's
			R0in <=  Rin & logic_to_reg [0];
			R1in <=  Rin & logic_to_reg [1];
			R2in <=  Rin & logic_to_reg [2];
			R3in <=  Rin & logic_to_reg [3];
			R4in <=  Rin & logic_to_reg [4];
			R5in <=  Rin & logic_to_reg [5];
			R6in <=  Rin & logic_to_reg [6];
			R7in <=  Rin & logic_to_reg [7];
			R8in <=  Rin & logic_to_reg [8];
			R9in <=  Rin & logic_to_reg [9];
			R10in <=  Rin & logic_to_reg [10];
			R11in <=  Rin & logic_to_reg [11];
			R12in <=  Rin & logic_to_reg [12];
			R13in <=  Rin & logic_to_reg [13];
			R14in <=  Rin & logic_to_reg [14];
			R15in <=  Rin & logic_to_reg [15];
			
			//Logic out of decoder - Rout's
			R0out <=  RandBlogicOut & logic_to_reg [0];
			R1out <=  RandBlogicOut & logic_to_reg [1];
			R2out <=  RandBlogicOut & logic_to_reg [2];
			R3out <=  RandBlogicOut & logic_to_reg [3];
			R4out <=  RandBlogicOut & logic_to_reg [4];
			R5out <=  RandBlogicOut & logic_to_reg [5];
			R6out <=  RandBlogicOut & logic_to_reg [6];
			R7out <=  RandBlogicOut & logic_to_reg [7];
			R8out <=  RandBlogicOut & logic_to_reg [8];
			R9out <=  RandBlogicOut & logic_to_reg [9];
			R10out <=  RandBlogicOut & logic_to_reg [10];
			R11out <=  RandBlogicOut & logic_to_reg [11];
			R12out <=  RandBlogicOut & logic_to_reg [12];
			R13out <=  RandBlogicOut & logic_to_reg [13];
			R14out <=  RandBlogicOut & logic_to_reg [14];
			R15out <=  RandBlogicOut & logic_to_reg [15];
			
		
	end


endmodule
