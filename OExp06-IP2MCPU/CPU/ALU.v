

module ALU(aluout_o,zero_o,src0_i,src1_i,ALUOp,shamt);

	input  [31:0] 		src0_i;		
	input  [31:0]		src1_i;		
	input  [2:0]		ALUOp;		
	input  [4:0]      shamt;
	output reg[31:0]		aluout_o;		
	output reg[0:0]				zero_o;		
	
	initial								
	begin
		zero_o = 0;
		aluout_o = 0;
	end	
	

	reg[31:0] src0_i_sign;
	reg[31:0] src1_i_sign;
	
	
	always@(src0_i or src1_i or ALUOp)
	begin
	src0_i_sign = src0_i>>>31;
	src1_i_sign = src1_i>>>31;
		case(ALUOp)
			0:aluout_o = src0_i+src1_i;
			1:aluout_o = src0_i-src1_i;
			2:aluout_o = src0_i|src1_i;
			3:aluout_o = src0_i&src1_i;
			4:aluout_o = ~(src0_i|src1_i);
			5:aluout_o = (src0_i<src1_i)?1:0;
			6:aluout_o = src1_i>>>shamt;
			7:aluout_o = {src1_i[15:0],16'b0};
			
			
			
		endcase
		
		begin
		if(aluout_o == 0)
			zero_o = 1;
		else
			zero_o = 0;
		end
	end

endmodule