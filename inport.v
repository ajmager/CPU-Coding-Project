module inport(
  input clk, clr,
  input [31:0] InputData,
  output [31:0] BusMuxin
);
  
 always @ (posedge clk) begin
  if (clr) begin
	  outUnit <= 32'h00000000;
  end
  else  begin
	  BusMuxin <= InputData;
  end
end
endmodule
