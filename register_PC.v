//A PC register

module register_PC(

	input						clk, clr, enable, IncPC,
	input			[31:0]	input_D,
	output reg	[31:0]	output_Q
);

always @ (posedge clk) begin

if (clr) begin
	output_Q = 0;
end
else if (enable) begin
	output_Q = input_D;
end
else if(IncPC) begin
	output_Q = output_Q + 1;
end
end
endmodule
