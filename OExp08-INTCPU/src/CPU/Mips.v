`include "Global_Define.v"
module Mips(
				input clk,
				input reset,
				input MIO_ready,
				input INT,
				input[31:0] inst_in,
				input[31:0] Data_in,	
				
				output mem_w,
				output CPU_MIO,
				output[31:0] PC_out,
				output[31:0] Addr_out,
				output[31:0] Data_out
				);

				
/********* VAR DEF **********/	
	wire [1:0] PC_Mux_select;
	wire [31:0] ID_EX_PCplus4_data;
	wire [31:0] ALU_result;
	wire [31:0] PC_Mux_data;
	wire [31:0] PCplus4;
	wire [31:0] CR_Read_Data;
	wire EPC_Selected;
	wire [31:0] PC_i;
	wire [31:0] PC_o;
	wire PC_Write;
	wire [31:0] branchPC;
	wire IMPC_Mux_select;
	wire [31:0] IMPC_Mux_data;	
	wire [31:0] Instruction;		
	wire IF_ID_Stall_Hazard;
	wire IF_ID_Stall;
	wire IF_ID_Flush_Hazard;
	wire IF_ID_Flush;
	wire IF_ID_Flush_CoPR0;
	wire [31:0] IF_ID_PCplus4_data;
	wire [31:0] IF_ID_Instruction_data;		
	wire [1:0] RegDst;
	wire RegWrite;
	wire [1:0] ALUSrcA;
	wire [2:0] ALUSrcB;
	wire [5:0] ALUOp;
	wire [1:0] ChangeType;
	wire MemRead;
	wire MemWrite;
	wire [1:0] MemtoReg;
	wire [1:0] StoreType;
	wire [2:0] LoadType;
	wire Reverse;
	wire syscall;
	wire eret;
	wire RI;
	wire CR_Read;
	wire CR_Write;
	wire [31:0] DEBUG_RFINFO;
	wire [15:0] DEBUG_CoPRINFO;		
	wire [31:0] signExtendedOffset;	
	wire [31:0] logicExtendedOffset;
	wire MEM_WB_RegWrite_data;
	wire [4:0] Write_register;
	wire [31:0] Write_data;
	wire [31:0] Read_data1;
	wire [31:0] Read_data2;	
	wire [1:0] branch_Or_Jump;
	wire ID_EX_MemRead_data;
	wire [31:0] ID_EX_Instruction_data;
	wire ID_EX_Flush_Hazard;
	wire ID_EX_Stall;
	wire ID_EX_Flush;
	wire ID_EX_Flush_CoPR0;
	wire INT_MASK;
	wire [31:0] ID_EX_Read_data1_data;
	wire [31:0] ID_EX_Read_data2_data;
	wire [31:0] ID_EX_Sign_Extend_data;
	wire [31:0] ID_EX_Logic_Extend_data;
	wire [1:0] ID_EX_RegDst_data;
	wire ID_EX_RegWrite_data;
	wire [1:0] ID_EX_ALUSrcA_data;
	wire [2:0] ID_EX_ALUSrcB_data;
	wire [5:0] ID_EX_ALUOp_data;
	wire [1:0] ID_EX_ChangeType_data;
	wire ID_EX_MemWrite_data;
	wire [1:0] ID_EX_MemtoReg_data;
	wire [1:0] ID_EX_StoreType_data;
	wire [2:0] ID_EX_LoadType_data;
	wire ID_EX_Reverse_data;
	wire ID_EX_syscall_data;
	wire ID_EX_eret_data;
	wire ID_EX_RI_data;
	wire ID_EX_CR_Read_data;
	wire ID_EX_CR_Write_data;		
	wire [31:0] ALUSrcA_Mux_data;
	wire [31:0] targetPCPre;
	wire [31:0] ALUSrcB_Mux_data;
	wire [1:0] ForwardA;
	wire [31:0] src0;
	wire [31:0] EX_MEM_ALU_result_data;
	wire [1:0] ForwardB;
	wire [31:0] src1;
	wire [1:0] ForwardC;
	wire [31:0] ForwardC_data;	
	wire [1:0] ForwardD;
	wire [31:0] ForwardD_data;	
	wire Ov;
	wire Zero;	
	wire [1:0] ExcCode;
	wire [1:0] EX_MEM_RegDst_data;
	wire EX_MEM_RegWrite_data;
	wire [1:0] MEM_WB_RegDst_data;
	wire [31:0] EX_MEM_Instruction_data;
	wire [31:0] MEM_WB_Instruction_data;
	wire [1:0] EX_MEM_ExcCode_data;
	wire Data_Selected;
	wire EX_MEM_Flush_CoPR0;
	wire MEM_WB_Flush_CoPR0;	
	wire [31:0] CR_Read_data_Mux_data;			
	wire EX_MEM_Stall;
	wire EX_MEM_Flush;
	wire [31:0] EX_MEM_PCplus4_data;
	wire [31:0] EX_MEM_Memory_Write_data_data;
	wire EX_MEM_MemRead_data;
	wire EX_MEM_MemWrite_data;
	wire [1:0] EX_MEM_MemtoReg_data;
	wire [1:0] EX_MEM_StoreType_data;
	wire [2:0] EX_MEM_LoadType_data;
	wire [3:0] be;
	wire [31:0] MemData;
	wire [31:0] LoadBE_data;
	wire MEM_WB_Stall;
	wire MEM_WB_Flush;	
	wire [31:0] MEM_WB_PCplus4_data;
	wire [31:0] MEM_WB_ALU_result_data;
	wire [31:0] MEM_WB_MemData_data;
	wire [1:0] MEM_WB_MemtoReg_data;	
	
// Mux for PC
Mux3T1 #(32, 2) U_PC_Mux(
							.s(PC_Mux_select), 
							.y(PC_Mux_data), 
							.d0(PCplus4), 
							.d1(ID_EX_PCplus4_data), 
							.d2(ALU_result)
						);
	
// Mux for EPC
Mux2T1 #(32, 1) U_EPC_Mux(
							.s(EPC_Selected), 
							.y(PC_i), 
							.d0(PC_Mux_data), 
							.d1(CR_Read_Data)
						);	
	
// PC
PC U_PC(
			.clk(clk), 
			.reset(reset), 
			.write_PC(PC_Write), 
			.PC_i(PC_i), 
			.PC_o(PC_o)
	);
	
// IMPC_Mux
Mux2T1 #(32, 1) U_IMPC_Mux(
							.s(IMPC_Mux_select), 
							.y(IMPC_Mux_data), 
							.d0(PC_o), 
							.d1(branchPC)
						);	

	
// NPC
PCIncrement U_PCIncrement(
							.PC_o(IMPC_Mux_data), 
							.NPC(PCplus4)
						);
	
	
	
/**************  IF/ID  ******************/
IF_ID_REG U_IF_ID_REG(
						.clk(clk), 
						.reset(reset), 
						.IF_ID_Stall(IF_ID_Stall), 
						.IF_ID_Flush(IF_ID_Flush), 
						.PCplus4(PCplus4), 
						.IF_ID_PCplus4_data(IF_ID_PCplus4_data), 
						.Instruction(Instruction), 
						.IF_ID_Instruction_data(IF_ID_Instruction_data)
					);
	
// Control

Control U_Control(
					.clk(clk), 
					.reset(reset), 
					.Op(IF_ID_Instruction_data[31:26]), 
					.Funct(IF_ID_Instruction_data[5:0]), 
					.Rs(IF_ID_Instruction_data[25:21]), 
					.Rt(IF_ID_Instruction_data[20:16]), 
					.RegDst(RegDst), 
					.RegWrite(RegWrite), 
					.ALUSrcA(ALUSrcA), 
					.ALUSrcB(ALUSrcB), 
					.ALUOp(ALUOp), 
					.ChangeType(ChangeType),
					.MemRead(MemRead), 
					.MemWrite(MemWrite), 
					.MemtoReg(MemtoReg), 
					.StoreType(StoreType), 
					.LoadType(LoadType), 
					.Reverse(Reverse), 
					.IMPC_Mux_select(IMPC_Mux_select), 
					.syscall(syscall), 
					.eret(eret), 
					.RI(RI),
					.CR_Read(CR_Read),
					.CR_Write(CR_Write)
				);

	
// Sign_Extend
EXT U_Sign_Extend(
					.EXTOp(`ArithmeticEXT), 
					.Imm16(IF_ID_Instruction_data[15:0]), 
					.Imm32(signExtendedOffset)
				);
	
// Logic_Extend
EXT U_Logic_Extend(
					.EXTOp(`LogicEXT), 
					.Imm16(IF_ID_Instruction_data[15:0]), 
					.Imm32(logicExtendedOffset)
				);
	
// Branch
BranchAdd U_BranchAdd(
						.PCplus4(IF_ID_PCplus4_data), 
						.signEXTOffset(signExtendedOffset), 
						.branchPC(branchPC)
					);
	
//Register file
Registers U_Registers(
						.clk(clk), 
						.reset(reset),
						.RegWrite(MEM_WB_RegWrite_data), 
						.Read_register1(IF_ID_Instruction_data[25:21]), 
						.Read_register2(IF_ID_Instruction_data[20:16]), 
						.Write_register(Write_register), 
						.Write_data(Write_data), 
						.Read_data1(Read_data1), 
						.Read_data2(Read_data2), 
						.CPU_MIO(CPU_MIO)
						);
	
// Hazard_detection
Hazard_detection_unit U_Hazard_detection_unit(
												.reset(reset),
												.branch_Or_Jump(branch_Or_Jump), 
												.ID_EX_MemRead(ID_EX_MemRead_data), 
												.ID_EX_Rt(ID_EX_Instruction_data[20:16]), 
												.IF_ID_Rs(IF_ID_Instruction_data[25:21]), 
												.IF_ID_Rt(IF_ID_Instruction_data[20:16]), 
												.IF_ID_Stall(IF_ID_Stall_Hazard), 
												.PC_Write(PC_Write), 
												.PC_Mux_select(PC_Mux_select), 
												.IF_ID_Flush(IF_ID_Flush_Hazard), 
												.ID_EX_Flush(ID_EX_Flush_Hazard),
												.EPC_Selected(EPC_Selected)
											);

/*****************  ID/EX  *****************/
ID_EX_REG U_ID_EX_REG(
						.clk(clk), 
						.reset(reset), 
						.ID_EX_Stall(ID_EX_Stall), 
						.ID_EX_Flush(ID_EX_Flush), 
						.Instruction(IF_ID_Instruction_data), 
						.ID_EX_Instruction_data(ID_EX_Instruction_data), 
						.PCplus4(IF_ID_PCplus4_data), 
						.ID_EX_PCplus4_data(ID_EX_PCplus4_data), 
						.Read_data1(Read_data1), 
						.ID_EX_Read_data1_data(ID_EX_Read_data1_data), 
						.Read_data2(Read_data2), 
						.ID_EX_Read_data2_data(ID_EX_Read_data2_data), 
						.Sign_Extend(signExtendedOffset), 
						.ID_EX_Sign_Extend_data(ID_EX_Sign_Extend_data), 
						.Logic_Extend(logicExtendedOffset), 
						.ID_EX_Logic_Extend_data(ID_EX_Logic_Extend_data), 
						.RegDst(RegDst), 
						.ID_EX_RegDst_data(ID_EX_RegDst_data), 
						.RegWrite(RegWrite), 
						.ID_EX_RegWrite_data(ID_EX_RegWrite_data), 
						.ALUSrcA(ALUSrcA), 
						.ID_EX_ALUSrcA_data(ID_EX_ALUSrcA_data), 
						.ALUSrcB(ALUSrcB), 
						.ID_EX_ALUSrcB_data(ID_EX_ALUSrcB_data), 
						.ALUOp(ALUOp), 
						.ID_EX_ALUOp_data(ID_EX_ALUOp_data), 
						.ChangeType(ChangeType), 
						.ID_EX_ChangeType_data(ID_EX_ChangeType_data), 
						.MemRead(MemRead), 
						.ID_EX_MemRead_data(ID_EX_MemRead_data), 
						.MemWrite(MemWrite), 
						.ID_EX_MemWrite_data(ID_EX_MemWrite_data), 
						.MemtoReg(MemtoReg), 
						.ID_EX_MemtoReg_data(ID_EX_MemtoReg_data), 
						.StoreType(StoreType), 
						.ID_EX_StoreType_data(ID_EX_StoreType_data), 
						.LoadType(LoadType), 
						.ID_EX_LoadType_data(ID_EX_LoadType_data), 
						.Reverse(Reverse), 
						.ID_EX_Reverse_data(ID_EX_Reverse_data), 
						.syscall(syscall), 
						.ID_EX_syscall_data(ID_EX_syscall_data), 
						.eret(eret), 
						.ID_EX_eret_data(ID_EX_eret_data), 
						.RI(RI), 
						.ID_EX_RI_data(ID_EX_RI_data),
						.CR_Read(CR_Read),
						.ID_EX_CR_Read_data(ID_EX_CR_Read_data),
						.CR_Write(CR_Write),
						.ID_EX_CR_Write_data(ID_EX_CR_Write_data)
					);


						
// ALUSrcA_Mux
Mux4T1 #(32, 2) U_ALUSrcA_Mux(
								.s(ID_EX_ALUSrcA_data), 
								.y(ALUSrcA_Mux_data), 
								.d0(32'b0), 
								.d1(ID_EX_Read_data1_data), 
								.d2({27'b0, ID_EX_Instruction_data[10:6]}), 
								.d3(ID_EX_PCplus4_data)
							);
		
// ALUSrcB_Mux
Mux8T1 #(32, 3) U_ALUSrcB_Mux(
								.s(ID_EX_ALUSrcB_data), 
								.y(ALUSrcB_Mux_data), 
								.d0(ID_EX_Read_data2_data), 
								.d1(32'd4), 
								.d2(ID_EX_Sign_Extend_data), 
								.d3((ID_EX_Sign_Extend_data << 2)), 
								.d4(ID_EX_Logic_Extend_data), 
								.d5(32'b0), 
								.d6(targetPCPre), 
								.d7(32'b0)
							);
	
// ForwardA_Mux
Mux3T1 #(32, 2) U_ForwardA_Mux(
								.s(ForwardA), 
								.y(src0), 
								.d0(ALUSrcA_Mux_data), 
								.d1(Write_data), 
								.d2(EX_MEM_ALU_result_data)
							);
	
// FrowardB_Mux
Mux3T1 #(32, 2) U_ForwardB_Mux(
								.s(ForwardB), 
								.y(src1), 
								.d0(ALUSrcB_Mux_data), 
								.d1(Write_data), 
								.d2(EX_MEM_ALU_result_data)
							);
	
// FrowardC_Mux
Mux3T1 #(32, 2) U_ForwardC_Mux(
								.s(ForwardC), 
								.y(ForwardC_data), 
								.d0(ID_EX_Read_data2_data), 
								.d1(Write_data), 
								.d2(EX_MEM_ALU_result_data)
							);
	
// FrowardD_Mux
Mux3T1 #(32, 2) U_ForwardD_Mux(
								.s(ForwardD), 
								.y(ForwardD_data), 
								.d0(ID_EX_Read_data2_data), 
								.d1(Write_data), 
								.d2(EX_MEM_ALU_result_data)
							);
	
// ALU
ALU U_ALU(
			.clk(clk), 
			.reset(reset),
			.ALU_control(ID_EX_ALUOp_data), 
			.src0(src0), 
			.src1(src1), 
			.Zero(Zero), 
			.ALU_result(ALU_result), 
			.Ov(Ov)
		);
	
// Exc_Detector
Exc_Detector U_Exc_Detector(
								.RI(ID_EX_RI_data), 
								.Ov(Ov), 
								.ExcCode(ExcCode)
							);
	
//Branch_Or_Jump
Branch_Or_Jump U_Branch_Or_Jump(
									.Reverse(ID_EX_Reverse_data), 
									.branchZero(Zero), 
									.ChangeType(ID_EX_ChangeType_data), 
									.branch_Or_Jump(branch_Or_Jump)
								);
	
//Forwarding_unit
Forwarding_unit U_Forwarding_unit(
									.ID_EX_Instruction(ID_EX_Instruction_data), 
									.EX_MEM_Instruction(EX_MEM_Instruction_data), 
									.MEM_WB_Instruction(MEM_WB_Instruction_data), 
									.ForwardA(ForwardA), 
									.ForwardB(ForwardB), 
									.ForwardC(ForwardC),
									.ForwardD(ForwardD)
								);
	
// CoPR0
CoPR0 U_CoPR0(
				.clk(clk), 
				.reset(reset), 
				.INT(INT), 
				.INT_ACK(INT_ACK), 
				.CR_Read(ID_EX_CR_Read_data), 
				.CR_Write(ID_EX_CR_Write_data), 
				.CR_Addr(ID_EX_Instruction_data[15:11]), 
				.syscall(syscall), 
				.eret(eret), 
				.ExcCode(EX_MEM_ExcCode_data), 
				.PCPluse4(ID_EX_PCplus4_data), 
				.CR_Write_Data(ForwardD_data), 
				.CR_Read_Data(CR_Read_Data), 
				.EPC_Selected(EPC_Selected), 
				.Data_Selected(Data_Selected), 
				.IF_ID_Flush(IF_ID_Flush_CoPR0), 
				.ID_EX_Flush(ID_EX_Flush_CoPR0), 
				.EX_MEM_Flush(EX_MEM_Flush_CoPR0), 
				.MEM_WB_Flush(MEM_WB_Flush_CoPR0),
				.INT_MASK(INT_MASK)
			);
// CR_Read_data_Mux
Mux2T1 U_CR_Read_data_Mux(
							.s(Data_Selected), 
							.y(CR_Read_data_Mux_data), 
							.d0(ALU_result), 
							.d1(CR_Read_Data)
						);
	
/***************** EX/MEM ******************/
EX_MEM_REG U_EX_MEM_REG(
						.clk(clk), 
						.reset(reset), 
						.EX_MEM_Stall(EX_MEM_Stall), 
						.EX_MEM_Flush(EX_MEM_Flush), 
						.Instruction(ID_EX_Instruction_data), 
						.EX_MEM_Instruction_data(EX_MEM_Instruction_data), 
						.PCplus4(ID_EX_PCplus4_data), 
						.EX_MEM_PCplus4_data(EX_MEM_PCplus4_data), 
						.Memory_Write_data(ForwardC_data), 
						.EX_MEM_Memory_Write_data_data(EX_MEM_Memory_Write_data_data), 
						.ALU_result(CR_Read_data_Mux_data),				
						.EX_MEM_ALU_result_data(EX_MEM_ALU_result_data), 
						.RegDst(ID_EX_RegDst_data), 
						.EX_MEM_RegDst_data(EX_MEM_RegDst_data), 
						.RegWrite(ID_EX_RegWrite_data), 
						.EX_MEM_RegWrite_data(EX_MEM_RegWrite_data), 
						.MemRead(ID_EX_MemRead_data), 
						.EX_MEM_MemRead_data(EX_MEM_MemRead_data), 
						.MemWrite(ID_EX_MemWrite_data), 
						.EX_MEM_MemWrite_data(EX_MEM_MemWrite_data), 
						.MemtoReg(ID_EX_MemtoReg_data), 
						.EX_MEM_MemtoReg_data(EX_MEM_MemtoReg_data), 
						.StoreType(ID_EX_StoreType_data), 
						.EX_MEM_StoreType_data(EX_MEM_StoreType_data), 
						.LoadType(ID_EX_LoadType_data), 
						.EX_MEM_LoadType_data(EX_MEM_LoadType_data), 
						.ExcCode(ExcCode), 
						.EX_MEM_ExcCode_data(EX_MEM_ExcCode_data)
					);
	
//BE
BE U_BE(
		.StoreType(EX_MEM_StoreType_data), 
		.ALUOut(EX_MEM_ALU_result_data[1:0]), 
		.be(be)
	);

//LoadBE
LoadBE U_LoadBE(
				.LoadType(EX_MEM_LoadType_data), 
				.ALUOut(EX_MEM_ALU_result_data[1:0]), 
				.MemData_i(MemData), 
				.MemData_o(LoadBE_data)
			);




	
/**************   MEM/WB  ********************/
MEM_WB_REG U_MEM_WB_REG(
						.clk(clk), 
						.reset(reset), 
						.MEM_WB_Stall(MEM_WB_Stall), 
						.MEM_WB_Flush(MEM_WB_Flush), 
						.Instruction(EX_MEM_Instruction_data), 
						.MEM_WB_Instruction_data(MEM_WB_Instruction_data), 
						.PCplus4(EX_MEM_PCplus4_data), 
						.MEM_WB_PCplus4_data(MEM_WB_PCplus4_data), 
						.ALU_result(EX_MEM_ALU_result_data), 
						.MEM_WB_ALU_result_data(MEM_WB_ALU_result_data), 
						.MemData(MemData), 
						.MEM_WB_MemData_data(MEM_WB_MemData_data), 
						.RegDst(EX_MEM_RegDst_data), 
						.MEM_WB_RegDst_data(MEM_WB_RegDst_data), 
						.RegWrite(EX_MEM_RegWrite_data), 
						.MEM_WB_RegWrite_data(MEM_WB_RegWrite_data), 
						.MemtoReg(EX_MEM_MemtoReg_data), 
						.MEM_WB_MemtoReg_data(MEM_WB_MemtoReg_data)
					);
	
// MemtoReg_Mux
Mux3T1 #(32, 2) U_MemtoReg_Mux(
								.s(MEM_WB_MemtoReg_data), 
								.y(Write_data), 
								.d0(MEM_WB_ALU_result_data), 
								.d1(MEM_WB_MemData_data), 
								.d2(MEM_WB_PCplus4_data)
							);
	
// RegDst_Mux
Mux3T1 #(5, 2) U_RegDst_Mux(
							.s(MEM_WB_RegDst_data), 
							.y(Write_register), 
							.d0(MEM_WB_Instruction_data[20:16]), 
							.d1(MEM_WB_Instruction_data[15:11]), 
							.d2(5'b11111)
						);
		
						
	assign PC_out = IMPC_Mux_data;
	assign Instruction = inst_in;	
	assign ID_EX_Stall = `DISABLE;	
	assign ID_EX_Flush = (INT && INT_MASK) ? `DISABLE : (ID_EX_Flush_Hazard || ID_EX_Flush_CoPR0);		
	assign targetPCPre = {4'b0, (ID_EX_Instruction_data[25:0] << 2)};
	assign MemData = Data_in;
	assign Addr_out = EX_MEM_ALU_result_data;
	assign mem_w = EX_MEM_MemWrite_data;
	assign Data_out = EX_MEM_Memory_Write_data_data;
	assign MEM_WB_Stall = `DISABLE;
	assign MEM_WB_Flush = MEM_WB_Flush_CoPR0;
	assign EX_MEM_Flush = EX_MEM_Flush_CoPR0;	
	assign EX_MEM_Stall = `DISABLE;	
	assign IF_ID_Flush = IF_ID_Flush_Hazard || IF_ID_Flush_CoPR0;
	assign IF_ID_Stall = IF_ID_Stall_Hazard;
	
endmodule