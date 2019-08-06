module EX_MEM_REG(
					input clk,
					input reset,
					input EX_MEM_Stall,
					input EX_MEM_Flush,
					input RegWrite,
					input MemRead,	
					input MemWrite,
					input [1:0] RegDst,
					input [1:0] MemtoReg,
					input [1:0] StoreType,
					input [1:0] ExcCode,
					input [2:0] LoadType,					
					input [31:0] Instruction,
					input [31:0] PCplus4,
					input [31:0] Memory_Write_data,
					input [31:0] ALU_result,
					
					output EX_MEM_RegWrite_data,					
					output EX_MEM_MemRead_data,				
					output EX_MEM_MemWrite_data,
					output [1:0] EX_MEM_RegDst_data,
					output [1:0] EX_MEM_MemtoReg_data,
					output [1:0] EX_MEM_StoreType_data,
					output [1:0] EX_MEM_ExcCode_data,
					output [2:0] EX_MEM_LoadType_data,					
					output [31:0] EX_MEM_Instruction_data,
					output [31:0] EX_MEM_PCplus4_data,
					output [31:0] EX_MEM_Memory_Write_data_data,
					output [31:0] EX_MEM_ALU_result_data
					);

	// EX_MEM_Instruction
	flopr #(32) U_EX_MEM_Instruction(
										.clk(clk), 
										.reset(reset),
										.stall(EX_MEM_Stall),
										.flush(EX_MEM_Flush), 
										.d(Instruction), 
										.q(EX_MEM_Instruction_data)
										);
										
	// EX_MEM_PCplus4
	flopr #(32) U_EX_MEM_PCplus4(
									.clk(clk), 
									.reset(reset), 
									.stall(EX_MEM_Stall), 
									.flush(EX_MEM_Flush), 
									.d(PCplus4),
									.q(EX_MEM_PCplus4_data)
									);
	
	// EX_MEM_Memory_Write_data
	flopr #(32) U_EX_MEM_Memory_Write_data(
											.clk(clk), 
											.reset(reset), 
											.stall(EX_MEM_Stall),
											.flush(EX_MEM_Flush),
											.d(Memory_Write_data),
											.q(EX_MEM_Memory_Write_data_data)
											);
	
	// EX_MEM_ALU_result
	flopr #(32) U_EX_MEM_ALU_result(
										.clk(clk), 
										.reset(reset),
										.stall(EX_MEM_Stall), 
										.flush(EX_MEM_Flush),
										.d(ALU_result), 
										.q(EX_MEM_ALU_result_data)
										);
	
	// EX_MEM_RegDst
	flopr #(2) U_EX_MEM_RegDst(
									.clk(clk), 
									.reset(reset), 
									.stall(EX_MEM_Stall),
									.flush(EX_MEM_Flush),
									.d(RegDst),
									.q(EX_MEM_RegDst_data)
									);
	
	// EX_MEM_RegWrite
	flopr #(1) U_EX_MEM_RegWrite(
									.clk(clk), 
									.reset(reset),
									.stall(EX_MEM_Stall),
									.flush(EX_MEM_Flush),
									.d(RegWrite), 
									.q(EX_MEM_RegWrite_data)
									);
	
	// EX_MEM_MemRead
	flopr #(1) U_EX_MEM_MemRead(
									.clk(clk), 
									.reset(reset), 
									.stall(EX_MEM_Stall), 
									.flush(EX_MEM_Flush), 
									.d(MemRead), 
									.q(EX_MEM_MemRead_data)
									);
	
	// EX_MEM_MemWrite
	flopr #(1) U_EX_MEM_MemWrite(
									.clk(clk),
									.reset(reset),
									.stall(EX_MEM_Stall),
									.flush(EX_MEM_Flush), 
									.d(MemWrite),
									.q(EX_MEM_MemWrite_data)
									);
	
	// EX_MEM_MemtoReg
	flopr #(2) U_EX_MEM_MemtoReg(
									.clk(clk),
									.reset(reset),
									.stall(EX_MEM_Stall), 
									.flush(EX_MEM_Flush), 
									.d(MemtoReg),
									.q(EX_MEM_MemtoReg_data)
									);
	
	// EX_MEM_StoreType
	flopr #(2) U_EX_MEM_StoreType(
									.clk(clk), 
									.reset(reset),
									.stall(EX_MEM_Stall), 
									.flush(EX_MEM_Flush), 
									.d(StoreType),
									.q(EX_MEM_StoreType_data)
									);
	
	// EX_MEM_LoadType
	flopr #(3) U_EX_MEM_LoadType(
									.clk(clk), 
									.reset(reset), 
									.stall(EX_MEM_Stall),
									.flush(EX_MEM_Flush),
									.d(LoadType), 
									.q(EX_MEM_LoadType_data)
									);
	
	// EX_MEM_ExcCode
	flopr #(2) U_EX_MEM_ExcCode(
									.clk(clk), 
									.reset(reset),
									.stall(EX_MEM_Stall), 
									.flush(EX_MEM_Flush),
									.d(ExcCode), 
									.q(EX_MEM_ExcCode_data)
									);
endmodule