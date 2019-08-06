module MEM_WB_REG(
					input clk,
					input reset,
					input MEM_WB_Stall,
					input MEM_WB_Flush,
					input RegWrite,
					input [1:0] RegDst,
					input [1:0] MemtoReg,
					input [31:0] Instruction,
					input [31:0] PCplus4,	
					input [31:0] ALU_result,	
					input [31:0] MemData,
					
					output MEM_WB_RegWrite_data,
					output [1:0] MEM_WB_MemtoReg_data,	
					output [31:0] MEM_WB_Instruction_data,
					output [31:0] MEM_WB_PCplus4_data,
					output [31:0] MEM_WB_ALU_result_data,
					output [31:0] MEM_WB_MemData_data,
					output [1:0] MEM_WB_RegDst_data
					);

	// MEM_WB_Instruction
	flopr #(32) U_MEM_WB_Instruction(
										.clk(clk),
										.reset(reset), 
										.stall(MEM_WB_Stall),
										.flush(MEM_WB_Flush),
										.d(Instruction), 
										.q(MEM_WB_Instruction_data)
										);
	
	// MEM_WB_PCplus4
	flopr #(32) U_MEM_WB_PCplus4(
										.clk(clk),
										.reset(reset), 
										.stall(MEM_WB_Stall), 
										.flush(MEM_WB_Flush), 
										.d(PCplus4),
										.q(MEM_WB_PCplus4_data)
										);
	
	// MEM_WB_ALU_result
	flopr #(32) U_MEM_WB_ALU_result(
										.clk(clk), 
										.reset(reset), 
										.stall(MEM_WB_Stall),
										.flush(MEM_WB_Flush), 
										.d(ALU_result), 
										.q(MEM_WB_ALU_result_data)
										);
	
	// MEM_WB_MemData
	flopr #(32) U_MEM_WB_MemData(
										.clk(clk), 
										.reset(reset), 
										.stall(MEM_WB_Stall),
										.flush(MEM_WB_Flush), 
										.d(MemData),
										.q(MEM_WB_MemData_data)
										);
	
	// MEM_WB_RegDst
	flopr #(2) U_MEM_WB_RegDst(
										.clk(clk), 
										.reset(reset), 
										.stall(MEM_WB_Stall), 
										.flush(MEM_WB_Flush),
										.d(RegDst), 
										.q(MEM_WB_RegDst_data)
										);
	
	// MEM_WB_RegWrite
	flopr #(1) U_MEM_WB_RegWrite(
										.clk(clk),
										.reset(reset), 
										.stall(MEM_WB_Stall), 
										.flush(MEM_WB_Flush), 
										.d(RegWrite),
										.q(MEM_WB_RegWrite_data)
										);
	
	// MEM_WB_MemtoReg
	flopr #(2) U_MEM_WB_MemtoReg(
										.clk(clk),
										.reset(reset), 
										.stall(MEM_WB_Stall),
										.flush(MEM_WB_Flush),
										.d(MemtoReg), 
										.q(MEM_WB_MemtoReg_data)
										);
endmodule