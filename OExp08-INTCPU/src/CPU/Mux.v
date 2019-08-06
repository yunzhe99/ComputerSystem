
module Mux2T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				output reg [width - 1:0] y
				);
	
	parameter width = 32, signWidth = 1;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
		begin
			case(s)
				0: y = d0;
				1: y = d1;
				default: y = 0;
			endcase
		end
endmodule


module Mux3T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				output reg [width - 1:0] y
				);
	
	parameter width = 32, signWidth = 2;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
		begin
			case(s)
				0: y = d0;
				1: y = d1;
				2: y = d2;
				default: y = 0;
			endcase
		end
endmodule


module Mux4T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				input [width - 1:0] d3,
				output reg [width - 1:0] y
				);
	parameter width = 32, signWidth = 2;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
	begin
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
			default: y = 0;
		endcase
	end
endmodule


module Mux5T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				input [width - 1:0] d3,
				input [width - 1:0] d4,
				output reg [width - 1:0] y
				);

	parameter width = 32, signWidth = 3;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
	begin
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
			4: y = d4;
			default: y = 0;
		endcase
	end
endmodule



module Mux6T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				input [width - 1:0] d3,
				input [width - 1:0] d4,
				input [width - 1:0] d5,
				output reg [width - 1:0] y
				);

	parameter width = 32, signWidth = 3;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
		begin
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
			4: y = d4;
			5: y = d5;
			default: y = 0;
		endcase
		end
endmodule

module Mux8T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				input [width - 1:0] d3,
				input [width - 1:0] d4,
				input [width - 1:0] d5,
				input [width - 1:0] d6,
				input [width - 1:0] d7,
				output reg [width - 1:0] y
				);
	
	parameter width = 32, signWidth = 3;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
	begin
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
			4: y = d4;
			5: y = d5;
			6: y = d6;
			7: y = d7;
			default: y = 0;
		endcase 
	end
endmodule


module Mux16T1(
				input [signWidth - 1:0] s,
				input [width - 1:0] d0,
				input [width - 1:0] d1,
				input [width - 1:0] d2,
				input [width - 1:0] d3,
				input [width - 1:0] d4,
				input [width - 1:0] d5,
				input [width - 1:0] d6,
				input [width - 1:0] d7,
				input [width - 1:0] d8,
				input [width - 1:0] d9,
				input [width - 1:0] d10,
				input [width - 1:0] d11,
				input [width - 1:0] d12,
				input [width - 1:0] d13,
				input [width - 1:0] d14,
				input [width - 1:0] d15,
				output reg [width - 1:0] y
				);

	parameter width = 32, signWidth = 4;
	
	initial
		begin
		y = 0;
		end
	
	always@(*)
		begin
		case(s)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			3: y = d3;
			4: y = d4;
			5: y = d5;
			6: y = d6;
			7: y = d7;
			8: y = d8;
			9: y = d9;
			10: y = d10;
			11: y = d11;
			12: y = d12;
			13: y = d13;
			14: y = d14;
			15: y = d15;
			default: y = 0;
		endcase
		end
endmodule