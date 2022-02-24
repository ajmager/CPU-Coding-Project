//An MDR register

module register_MDR(

	input						clk, clr, enable,
	input			[31:0]	bus_data, Mdatain, 
	input 					read,
	output reg	[31:0]	output_QMDR
);

always @ (posedge clk) begin

if (clr) begin
	output_QMDR <= 32'h00000000;
end
else if (enable) begin
	if(read)begin
		output_QMDR <= Mdatain;
	end
	else begin
		output_QMDR <= bus_data;
	end
end

end
endmodule
