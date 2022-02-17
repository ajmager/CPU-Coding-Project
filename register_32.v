//A typical register

module register_32(

	input						clk, clr, enable,
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

end
endmodule
