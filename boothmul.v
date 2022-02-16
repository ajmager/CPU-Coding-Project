module boothmul(X, Y, Z_Low, Z_High,en);
	input signed [31:0] X, Y;
	input en;
	output signed [31:0] Z_Low, Z_High;
	signed [63:0] Z;
	reg signed [31:0] Z_High;
	reg [31:0] Z_Low
	reg signed [63:0] Z;
	reg [1:0] temp;
	integer i;
	reg E1;
	reg [31:0] Y1;
	always @ (X, Y,en)
	begin
		Z = 64'd0;
		E1 = 1'd0;
		Y1 = ~Y;
		Z[63:0]=X;
		for (i = 0; i < 32; i = i + 1)
			begin
				temp = {X[i], E1};
				case (temp)
					2'd2 : Z [63 : 32] = Z [63 : 32] + Y1;
					2'd1 : Z [63 : 32] = Z [63 : 32] + Y;
					default : begin end
				endcase
				Z = Z >> 1;
				Z[63] = Z[62];
				E1 = X[i];
		Z_Low[31:0] = Z[31:0];
		Z_High[31:0] = Z[63:32];
	end
endmodule
