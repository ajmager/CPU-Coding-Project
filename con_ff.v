//CON FF
// Phase 2 - Select and Encode
module con_ff (
	input clk,
	input [31:0] bus_data,
	input [20:19] IR,
	input CON_in
	output CONFF;
	
);
	wire [3:0] decoderOut;
	wire norOutput;
	wire norNotOutput;
	wire notOutput;
	
	wire equalOutput;
	wire notEqualOutput;
	wire greaterThanOutput;
	wire lessThanOutput;
	wire CONinput;

	always (posedge clk) begin
		//initial logic
		norOutput <= ~(bus_data | bus_data);
		norNOTOutput <= ~norOutput;
		notOutput <= ~bus_data;		
		
		//decoder
		case(IR)
			2'b00:  	decoderOut <= 4'b0001; 
			2'b01:	decoderOut <= 4'b0010; 
			2'b10:	decoderOut <= 4'0100; 
			2'b11:	decoderOut <= 4'1000; 
			default: decoderOut <= 4'bx;
		endcase
		
		//logic
		if(norOutput&decoderOut[0] == 0)begin
			equalOutput <= norOutput&decoderOut[0];
		end
		
		if(norNotOutput&decoderOut[1] != 0)begin
			notEqualOutput <= norNotOutput&decoderOut[1];
		end
		
		if(notOutput&decoderOut[2] >= 0)begin
			greaterThanOutput <= notOutput&decoderOut[2];
		end
		
		if(bus_data&decoderOut[4] < 0)begin
			lessThanOutput <= bus_data&decoderOut[4];
		end
		
		CONinput <= equalOutput | notEqualOutput | greaterThanOutput | lessThanOutput;
		
		if(CON_in) begin
			CONFF <= CONinput;
		end
		
	end


endmodule
