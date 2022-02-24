//A 64bit typical register

module register_64(

	input						clk, clr, enable,
	input 					Zhi, Zlow,
	input			[63:0]	input_DZ,
	output reg	[31:0]	output_QZ
);

always @ (posedge clk) begin

if (clr) begin
	output_QZ <= 64'h0000000000000000;
end
else if (enable) begin
	
	if(Zlow)begin
		output_QZ <= input_DZ [31:0];
	end
	
	else if(Zhi) begin
		output_QZ <= input_DZ [63:32];
	end
end

end
endmodule
