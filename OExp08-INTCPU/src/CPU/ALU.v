`include "ALUOP_Define.v"
`include "Global_Define.v"
module ALU(
			input clk,
			input reset,
			input [5:0] ALU_control,
			input [31:0] src0,
			input [31:0] src1,
			
			output Zero,
			output reg [31:0] ALU_result,
			output reg Ov
			);
	

	wire signed [31:0] src1_s = $signed(src1);
	
	assign Zero = (ALU_result == 32'b0) ? 1'b1 : 1'b0;
	
	always@(posedge clk or negedge reset)
		begin
			if(!reset)
				begin
				ALU_result <= 32'b0;
				end
			else
				begin
					case(ALU_control)
						// Arithmetic
						`ALUOP_ADD,
						`ALUOP_ADDU:
							ALU_result <= src0 + src1;

						`ALUOP_SUB,
						`ALUOP_SUBU:
							ALU_result <= src0 - src1;

						// Logic 
						`ALUOP_SLL,
						`ALUOP_SLLV:
							ALU_result <= src1 << (src0 % 32);

						`ALUOP_SRA,
						`ALUOP_SRAV:
							ALU_result <= src1_s << (src0 % 32);

						`ALUOP_SRL,
						`ALUOP_SRLV:
							ALU_result <= src1 >> (src0 % 32);

						`ALUOP_AND:
							ALU_result <= src0 & src1;

						`ALUOP_OR:
							ALU_result <= src0 | src1;

						`ALUOP_XOR:
							ALU_result <= src0 ^ src1;

						`ALUOP_NOR:
							ALU_result <= ~(src0 | src1);

						`ALUOP_SLT:
							ALU_result <= (((src0 >= src1) && (src0[31] == src1[31])) || (src0[31] < src1[31])) ? 32'd0 : 32'd1;

						`ALUOP_SLTU:
							ALU_result <= (src0 >= src1) ? 32'd0 : 32'd1;

						`ALUOP_SGT:
							ALU_result <= (((src1 >= src0) && (src1[31] == src0[31])) || (src1[31] < src0[31])) ? 32'd0 : 32'd1;

						`ALUOP_SGTU:
							ALU_result <= (src1 >= src0) ? 32'd0 : 32'd1;

						`ALUOP_LUI:
							ALU_result <= {src1[15:0], 16'd0};

						// JUMP
						`ALUOP_JUMP:
							ALU_result <= {src0[31:28], src1[27:0]};

						default:
							ALU_result <= 32'b0;
					endcase
				end

		end
		
	always@(*)// Overflow detecttion
		begin
		if(!reset)
			Ov <= `DISABLE;

		else
			begin
				case(ALU_control)
					`ALUOP_ADD:
						begin
							if(((src0[31] == 1'b1) && (src1[31] == 1'b1) && (ALU_result[31] == 1'b0)) || ((src0[31] == 1'b0) && (src1[31] == 1'b0) && (ALU_result[31] == 1'b1)))
								Ov <= `ENABLE;
							else
								Ov <= `DISABLE;
						end
					`ALUOP_SUB:
						begin
							if(((src0[31] == 1'b1) && (src1[31] == 1'b0) && (ALU_result[31] == 1'b0)) || ((src0[31] == 1'b0) && (src1[31] == 1'b1) && (ALU_result[31] == 1'b1)))
								Ov <= `ENABLE;
							else
								Ov <= `DISABLE;
						end
					default:
						Ov <= `DISABLE;
				endcase
			end
		end
endmodule