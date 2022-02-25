module division(Dividend, Divisor, Z);

	input [31:0] Dividend,Divisor;
	output[63:0] Z;
	
	reg[31:0] Q, R;
	reg[63:0] Z = 0;
	reg[31:0] a,b;
	reg[31:0] p;
	
	integer i = 0; 
	
	always@(Dividend or Divisor)
	begin 
		a = Dividend;
		b = Divisor;
		p = 0; 
		for(i = 0; i < 32; i = i+1)
		begin	
			p = {p[30:0],a[31]};
			a[31:1] = a[30:0]; 
			p = p-b; 
			if (p[31] == 1)
			begin	
				a[0] = 0;
				p = p+b;
			end
			else
				a[0] = 1; 
		end
		Q = a; 
		R = Dividend - Q; 
		Z[63:32] = Q;
		Z[31:0] = R; 
	end
endmodule
				
	
