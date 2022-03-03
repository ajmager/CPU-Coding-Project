module boothmul(X, Y, Z);
	input signed [31:0] X, Y;
	output signed[63:0] Z;
	reg [63:0] tempZ;
	reg [1:0] temp;
	integer i;
	//reg E1;
	reg [31:0] Y1;
	always @ (X, Y)
	begin
		tempZ = 64'd0;
		//E1 = 1'd0;
		Y1 = ~Y;
		tempZ[63:0]=X;
		for (i = 0; i < 32; i = i + 1)
		begin
			temp = X[i];
			case (temp)
				2'd2 : tempZ [63 : 32] = tempZ [63 : 32] + Y1;
				2'd1 : tempZ [63 : 32] = tempZ [63 : 32] + Y;
				default : begin end
			endcase
			tempZ = tempZ >> 1;
			tempZ[63] = tempZ[62];
			//E1 = X[i];
		end
	end
	assign Z = tempZ;
endmodule
