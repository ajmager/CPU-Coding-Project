//A typical register

module register_32(

input 				clk, clr, enable;
input		[31:0]	input_D;
output	[31:0]	output_Q;
reg		[31;0]	output_Q;
);

always @ (posedge clk)

if (clr)
	Q = 0;
else if (enable)
	Q = D;

endmodule
