//A PC register

module register_PC(

	input						clk, clr, enable, IncPC,
	input			[31:0]	input_DPC,
	output reg	[31:0]	output_QPC
);

always @ (posedge clk) begin

if (clr) begin
	output_QPC <= 32'h00000000;
end
else if (enable) begin
	output_QPC <= input_DPC;
end
else if(IncPC) begin
	output_QPC <= output_QPC + 1;
end
end
endmodule
