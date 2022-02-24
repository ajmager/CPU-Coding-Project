//An MDR register

module register_MDR(

	input						clk, clr, enable,
	input			[31:0]	bus_data, Mdatain, read,
	output reg	[31:0]	output_Q
);

always @ (posedge clk) begin

if (clr) begin
	output_Q = 0;
end
else if (enable) begin
	if(read)begin
		output_Q = Mdatain;
	end
	else begin
		output_Q = bus_data;
	end
end

end
endmodule
