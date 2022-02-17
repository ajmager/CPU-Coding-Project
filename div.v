module div(Dividend,Divisor,Z);

	input [31:0] Dividend;
	input [31:0] Divisor;
	
	output [63:0] Z;
	//output ready;
	reg [31:0] Q;
	reg[31:0] R;
	
	reg [31:0] Q;
	reg [31:0] Dividend_copy, Divisor_copy, diff;
	wire[31:0] remainder = Dividend_copy[31:0];
	
	reg [31:0] bit;
	wire ready = !bit;
	
	initial bit = 0;
	
	always@(Dividend, Divisor)
		if(ready)
			begin
				bit = 32;
				Q = 0; 
				Dividend_copy = {32'd0,Dividend};
				Divisor_copy = {1'b0,Divisor,31'b0};
			end
		else
			begin
				diff = Dividend_copy - Divisor_copy;
				Q = Q<<1;
				
			if (!diff[31])
				begin 
					Dividend_copy = diff;
					Q[0] = 1'd1;
				end
				
				Divisor_copy = Divisor_copy >> 1;
				bit = bit - 1;
				
	end
	Z[31:0] = R[31:0];
	Z[63:32] = Q[31:0];
endmodule
				
	
