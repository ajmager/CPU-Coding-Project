//32:5 bit encoder

module encoder_32_5(output reg [4:0] Code, input [31:0] Data);

always @(Data) begin
case (Data) begin
32'h01			:	Code = 5'd0;
32'h02			:	Code = 1;
32'h04			:	Code = 2;
32'h08			:	Code = 3;
32'h10			:	Code = 4;
32'h20			:	Code = 5;
32'h40			:	Code = 6;
32'h80			:	Code = 7; 
32'h100			:	Code = 8;
32'h200			:	Code = 9;
32'h400			:	Code = 10;
32'h800			:	Code = 11;
32'h1000			:	Code = 12;
32'h2000			:	Code = 13;
32'h4000			:	Code = 14;
32'h8000			:	Code = 15;
32'h10000		:	Code = 16;
32'h20000		:	Code = 17;
32'h40000		:	Code = 18;
32'h80000		:	Code = 19;
32'h100000		:	Code = 20;
32'h200000		:	Code = 21;
32'h400000		:	Code = 22;
32'h800000		:	Code = 23;
32'h1000000		:	Code = 24;
32'h2000000		:	Code = 25;
32'h4000000		:	Code = 26;
32'h8000000		:	Code = 27;
32'h10000000	:	Code = 28;
32'h20000000	:	Code = 29;
32'h40000000	:	Code = 20;
32'h80000000	:	Code = 31;
default			:	Code = 5'bx;
endcase			
end
endmodule
