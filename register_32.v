//A typical register

module register_32(

	input						clk, clr, enable,
	input			[31:0]	input_D32,
	output reg	[31:0]	output_Q32
);

always @ (posedge clk) begin

if (clr) begin
	output_Q32 <= 32'h00000000;
end
else if (enable) begin
	output_Q32 <= input_D32;
end

end
endmodule
