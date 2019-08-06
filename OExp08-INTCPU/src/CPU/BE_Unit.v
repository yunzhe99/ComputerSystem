`include "Global_Define.v"
module BE(
			input [1:0] StoreType,
			input [1:0] ALUOut,
			
			output reg [3:0] be
			);
	
	initial
		begin
		be = 4'b0;
		end
	
	always@(*)
		begin
			case(StoreType)
				`StoreWord:
					be = 4'b1111;

				`StoreHalfWord:
					begin
						case(ALUOut)
							2'b00,
							2'b01:
								be = 4'b0011;

							2'b10,
							2'b11:
								be = 4'b1100;

							default:
								be = be;

						endcase
					end
				`StoreByte:
					begin
						case(ALUOut)
							2'b00:
								be = 4'b0001;

							2'b01:
								be = 4'b0010;

							2'b10:
								be = 4'b0100;

							2'b11:
								be = 4'b1000;

							default:
								be = be;

						endcase
					end
				default:
					be = 4'b0000;

			endcase
		end
endmodule