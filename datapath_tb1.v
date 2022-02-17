
module datapath_tb;
	reg R5in, R2in, R4in;
	reg ZLOW_out, ZHI_out;
	reg clk;
	
	initial begin 
		clk <= 1'b1; forever #5 clk <= ~clk;
	end 
	
	initial begin 
		//T0 - assert control signals, etc
		#10 $display("...") // T1 assert control signals etc
		//..
	end
endmodule 