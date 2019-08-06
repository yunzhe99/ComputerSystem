`include "Global_Define.v"
module EXT(
			input [1:0] EXTOp,
			input [15:0] Imm16,
			
			output reg [31:0] Imm32
			);
	
	always@(*)
		begin
			case(EXTOp)
				`LogicEXT:
					Imm32 = {16'b0, Imm16};

				`ArithmeticEXT:
					Imm32 = (Imm16[15] == 1) ? {16'hFFFF, Imm16} : {16'b0, Imm16};

				`LUIEXT:
					Imm32 = {Imm16, 16'b0};

			endcase
		end
endmodule