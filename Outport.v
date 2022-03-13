module outport(
  input clk, clr, enable,
  input [31:0] BusDatain,
  output [31:0] outUnit
);
  
 always @ (posedge clk) begin
  if (clr) begin
	  outUnit <= 32'h00000000;
  end
  else if (enable) begin
	  outUnit <= BusDatain;
  end
end
endmodule
