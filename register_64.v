//A 64bit typical register

module register_64(

	input						clk, clr, enable,
	input			[63:0]	input_D,
	output reg	[63:0]	output_Q
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
