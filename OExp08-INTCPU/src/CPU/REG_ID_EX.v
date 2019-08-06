module ID_EX_REG(
					input clk,
					input reset,
					input ID_EX_Stall,
					input ID_EX_Flush,
					input RegWrite,	
					input MemRead,
					input MemWrite,
					input Reverse,
					input syscall,
					input eret,
					input RI,
					input CR_Read,
					input CR_Write,
					input [31:0] Instruction,
					input [31:0] PCplus4,	
					input [31:0] Read_data1,	
					input [31:0] Read_data2,	
					input [31:0] Sign_Extend,	
					input [31:0] Logic_Extend,	
					input [1:0] RegDst,	
					input [1:0] ALUSrcA,
					input [1:0] ChangeType,
					input [1:0] MemtoReg,
					input [1:0] StoreType,	
					input [2:0] ALUSrcB,
					input [2:0] LoadType,
					input [5:0] ALUOp,


					output ID_EX_RegWrite_data,	
					output ID_EX_MemRead_data,
					output ID_EX_MemWrite_data,	
					output ID_EX_Reverse_data,
					output ID_EX_syscall_data,
					output ID_EX_eret_data,
					output ID_EX_RI_data,
					output ID_EX_CR_Read_data,
					output ID_EX_CR_Write_data,
					output [1:0] ID_EX_RegDst_data,
					output [1:0] ID_EX_ALUSrcA_data,
					output [1:0] ID_EX_ChangeType_data,
					output [1:0] ID_EX_MemtoReg_data,
					output [1:0] ID_EX_StoreType_data,
					output [2:0] ID_EX_LoadType_data,
					output [2:0] ID_EX_ALUSrcB_data,
					output [5:0] ID_EX_ALUOp_data,
					output [31:0] ID_EX_Instruction_data,
					output [31:0] ID_EX_PCplus4_data,
					output [31:0] ID_EX_Read_data1_data,
					output [31:0] ID_EX_Read_data2_data,
					output [31:0] ID_EX_Sign_Extend_data,
					output [31:0] ID_EX_Logic_Extend_data
					);

	// ID_EX_Instruction
	flopr #(32) U_ID_EX_Instruction(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(Instruction),
									.q(ID_EX_Instruction_data)
									);
	
	// ID_EX_PCplus4
	flopr #(32) U_ID_EX_PCplus4(
									.clk(clk),
									.reset(reset),
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(PCplus4),
									.q(ID_EX_PCplus4_data)
									);
	
	
	// ID_EX_Read_data1
	flopr #(32) U_ID_EX_Read_data1(
									.clk(clk),
									.reset(reset),
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(Read_data1), 
									.q(ID_EX_Read_data1_data)
									);
	
	// ID_EX_Read_data2
	flopr #(32) U_ID_EX_Read_data2(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(Read_data2),
									.q(ID_EX_Read_data2_data)
									);
	
	// ID_EX_Sign_Extend
	flopr #(32) U_ID_EX_Sign_Extend(
									.clk(clk), 
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(Sign_Extend),
									.q(ID_EX_Sign_Extend_data)
									);
	
	// ID_EX_Logic_Extend
	flopr #(32) U_ID_EX_Logic_Extend(
									.clk(clk), 
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(Logic_Extend),
									.q(ID_EX_Logic_Extend_data)
									);
	
	// ID_EX_RegDst
	flopr #(2) U_ID_EX_RegDst(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(RegDst),
									.q(ID_EX_RegDst_data)
									);
	
	// ID_EX_RegWrite
	flopr #(1) U_ID_EX_RegWrite(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(RegWrite),
									.q(ID_EX_RegWrite_data)
									);
	
	// ID_EX_ALUSrcA
	flopr #(2) U_ID_EX_ALUSrcA(
									.clk(clk), 
									.reset(reset), 
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush), 
									.d(ALUSrcA), 
									.q(ID_EX_ALUSrcA_data)
									);
	
	// ID_EX_ALUSrcB
	flopr #(3) U_ID_EX_ALUSrcB(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(ALUSrcB),
									.q(ID_EX_ALUSrcB_data)
									);
	
	
	// ID_EX_ALUOp
	flopr #(6) U_ID_EX_ALUOp(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(ALUOp),
									.q(ID_EX_ALUOp_data)
									);
	
	// ID_EX_ChangeType
	flopr #(2) U_ID_EX_ChangeType(
									.clk(clk), 
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(ChangeType),
									.q(ID_EX_ChangeType_data)
									);
	
	// ID_EX_MemRead
	flopr #(1) U_ID_EX_MemRead(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(MemRead), 
									.q(ID_EX_MemRead_data)
									);
	
	// ID_EX_MemWrite
	flopr #(1) U_ID_EX_MemWrite(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(MemWrite),
									.q(ID_EX_MemWrite_data)
									);
	
	// ID_EX_MemtoReg
	flopr #(2) U_ID_EX_MemtoReg(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(MemtoReg), 
									.q(ID_EX_MemtoReg_data)
									);
	
	// ID_EX_StoreType
	flopr #(2) U_ID_EX_StoreType(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(StoreType),
									.q(ID_EX_StoreType_data)
									);
	
	// ID_EX_LoadType
	flopr #(3) U_ID_EX_LoadType(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(LoadType), 
									.q(ID_EX_LoadType_data)
									);
	
	// ID_EX_Reverse
	flopr #(1) U_ID_EX_Reverse(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(Reverse), 
									.q(ID_EX_Reverse_data)
									);
	
	// ID_EX_syscall
	flopr #(1) U_ID_EX_syscall(
									.clk(clk), 
									.reset(reset), 
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(syscall), 
									.q(ID_EX_syscall_data)
									);
	
	// ID_EX_eret
	flopr #(1) U_ID_EX_eret(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(eret), 
									.q(ID_EX_eret_data)
									);
	
	// ID_EX_RI
	flopr #(1) U_ID_EX_RI(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush), 
									.d(RI), 
									.q(ID_EX_RI_data)
									);
	
	// ID_EX_CR_Read
	flopr #(1) U_ID_EX_CR_Read(
									.clk(clk), 
									.reset(reset),
									.stall(ID_EX_Stall), 
									.flush(ID_EX_Flush),
									.d(CR_Read), 
									.q(ID_EX_CR_Read_data)
									);
	
	// ID_EX_CR_Write
	flopr #(1) U_ID_EX_CR_Write(
									.clk(clk),
									.reset(reset), 
									.stall(ID_EX_Stall),
									.flush(ID_EX_Flush),
									.d(CR_Write),
									.q(ID_EX_CR_Write_data)
									);
endmodule