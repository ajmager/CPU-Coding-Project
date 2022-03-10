//register for r0

module register_r0(

	input	clk, clr, enable,
  	input	[31:0]	input_D32, input BAout,
  	output reg [31:0] output_r0
);
  
  wire [31:0]	output_Q32; 
  wire [31:0] BAtemp;
  
always @ (posedge clk) begin

if (clr) begin
	output_Q32 <= 32'h00000000;
end
else if (enable) begin
	output_Q32 <= input_D32;
  	BAtemp <= ~BAout;
  	output_r0 <= BAtemp & output_Q32;
end

end
endmodule
