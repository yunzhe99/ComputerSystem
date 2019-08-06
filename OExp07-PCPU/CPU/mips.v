
module mips(
    input clk,
    input rst,
	 input [31:0]inst_in,
	 input INT,
	 output [31:0]PC_out,
	 output mem_w,
	 output [31:0]Addr_out,
	 input [31:0]Data_in,
	 output [31:0]Data_out,
	 output CPU_MIO,
	 input MIO_ready

);
	
  wire  [0:0]     IMemRead;
  wire  [0:0]     MemRead;
  wire  [0:0]     PCWrite;
  wire  [0:0]     IRWrite;
  wire  [0:0]     PCWriteCond;
  wire  [1:0]     PCSource;
  wire  [0:0]     zero;
  wire  [0:0]     MemWrite;
  wire  [1:0]     MemtoReg;
  wire  [1:0]     NPCOp;
  wire  [0:0]     RegWrite;
  wire  [4:0]     ALUOp;
  wire  [1:0]     ALUSrc;
  
  wire [1:0]MEM_WB_MemtoReg;
  wire [0:0]MEM_WB_RegWrite;
  wire [31:0]MEM_WB_aluout_o;
  wire [31:0]MEM_WB_dout;
  wire [31:0]MEM_WB_PC;
  wire [4:0]MEM_WB_wa_i;
  
  wire [1:0]EX_MEM_MemtoReg;
  wire [0:0]EX_MEM_RegWrite;
  wire [0:0]EX_MEM_MemRead;
  wire [0:0]EX_MEM_MemWrite;
  wire [1:0]EX_MEM_NPCOp;
  wire [31:0]EX_MEM_branch_address;
  wire [31:0]EX_MEM_jump_address;
  wire [31:0]EX_MEM_rd0_o;
  wire [31:0]EX_MEM_rd1_o;
  wire [31:0]EX_MEM_aluout_o;
  wire [4:0]EX_MEM_wa_i;
  wire [31:0]EX_MEM_inst;
  wire [31:0]EX_MEM_PC;
  
  wire [1:0]ForwardA;
  wire [1:0]ForwardB;  
  
  wire [0:0]clean;
  wire [0:0]Flush;
  
  //PC
  wire [31:0]NPC_out;
  PC PC_REAL(
		.clk(clk),
		.rst_n(rst), 
		.NPC_out(NPC_out), 
		.pc_o(PC_out),
		.PCWrite(PCWrite)
		);
  
  //IM
  //im_4k IM_REAL(
	//	.addr(PC_out[11:2]), 
	//	.dout(inst_in)
	//	);
  
  //IF_ID
  wire [31:0]PC_NEXT_out;
  wire [31:0]instruction_out;
  IF_ID MY_IF_ID(
		.clk(clk), 
		.Flush(Flush), 
		.IF_ID_Write(IF_ID_Write), 
		.PC_NEXT_in(PC_out), 
		.instruction_in(inst_in), 
		.PC_NEXT_out(PC_NEXT_out),
		.instruction_out(instruction_out)
		);
  
  //IM TO RF MUXRF
  wire [4:0]muxrf_0=instruction_out[20:16];
  wire [4:0]muxrf_1=instruction_out[15:11];//RegDst=0 rd
  wire [4:0]wa_i;
  wire  [1:0]RegDst;
  mux #(4,2,5,5) MUXRF(
		RegDst, 
		wa_i,  
		muxrf_1,
		muxrf_0,
		5'd31, 
		5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1
		);
  
  //RF
  wire [4:0]ra0_i=instruction_out[25:21];
  wire [4:0]ra1_i=instruction_out[20:16];
  wire [31:0]wd_i;
  wire [31:0]rd0_o;
  wire [31:0]rd1_o;

  RF RF_REAL(
		.ra0_i(ra0_i),
		.ra1_i(ra1_i),
		.wa_i(MEM_WB_wa_i),
		.wd_i(wd_i), 
		.RegWrite(MEM_WB_RegWrite), 
		.rd0_o(rd0_o), 
		.rd1_o(rd1_o),
		.clk(clk)
		);
  
  //EXT
  wire [15:0]Imm16=instruction_out[15:0];
  wire [31:0]Imm32;
  wire  [1:0]EXTOp;
  EXT EXT_REAL(
		.Imm16(Imm16), 
		.EXTOp(EXTOp), 
		.Imm32(Imm32)
		);
  
  //mux RegWrite
  wire [0:0]ID_EX_RegWrite_in;
  mux #(2,1,1,1) MUX_RegWrite(
		clean, 
		ID_EX_RegWrite_in, 
		RegWrite, 
		1'b0, 1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1
		);
  
  //mux MemWrite
  wire [0:0]ID_EX_MemWrite_in;
  mux #(2,1,1,1) MUX_MemWrite(
		clean,
		ID_EX_MemWrite_in,
		MemWrite, 
		1'b0, 1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1
		);
  
 
  //ID_EX
  wire [31:0]ID_EX_PC;
  wire [31:0]ID_EX_inst;
  wire [1:0]ID_EX_ALUSrc;
  wire [1:0]ID_EX_MemtoReg;
  wire [0:0]ID_EX_RegWrite;
  wire [0:0]ID_EX_MemRead;
  wire [0:0]ID_EX_MemWrite;
  wire [1:0]ID_EX_NPCOp;
  wire [4:0]ID_EX_ALUOp;
  wire [4:0]ID_EX_wa_i;
  wire [31:0]ID_EX_rd0_o;
  wire [31:0]ID_EX_rd1_o;
  wire [31:0]ID_EX_Imm32;
  ID_EX MY_ID_EX( 
		.clk(clk),
		.PC_NEXT_in(PC_NEXT_out), 
		.instruction_in(instruction_out),
		.PC_NEXT_out(ID_EX_PC), 
		.instruction_out(ID_EX_inst),
		.ID_EX_ALUSrc(ID_EX_ALUSrc),
		.ID_EX_MemtoReg(ID_EX_MemtoReg), 
		.ID_EX_RegWrite(ID_EX_RegWrite), 
		.ID_EX_MemRead(ID_EX_MemRead), 
		.ID_EX_MemWrite(ID_EX_MemWrite),
		.ID_EX_NPCOp(ID_EX_NPCOp), 
		.ID_EX_ALUOp(ID_EX_ALUOp),
		.ID_EX_wa_i(ID_EX_wa_i), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg),
		.RegWrite(ID_EX_RegWrite_in), 
		.MemRead(MemRead),
		.MemWrite(ID_EX_MemWrite_in), 
		.NPCOp(NPCOp),
		.ALUOp(ALUOp),
		.wa_i(wa_i), 
		.rd0_o(rd0_o), 
		.rd1_o(rd1_o), 
		.ID_EX_rd0_o(ID_EX_rd0_o), 
		.ID_EX_rd1_o(ID_EX_rd1_o),
		.Imm32(Imm32),
		.ID_EX_Imm32(ID_EX_Imm32),
		.Flush(Flush)
		);
       
  
  //load_use_hazard
  load_use_hazard MY_load_use_hazard(
		.ID_EX_inst(ID_EX_inst), 
		.IF_ID_inst(instruction_out), 
		.PCWrite(PCWrite), 
		.IF_ID_Write(IF_ID_Write), 
		.clean(clean),
		.zero_o(zero), 
		.Flush(Flush)
		);
  		 
		 
  //RF TO ALU MUXALU1
  wire [31:0]src0_i;
  mux #(4,2,32,32) MUXALU1(
		ForwardA, 
		src0_i, 
		ID_EX_rd0_o, 
		wd_i,
		EX_MEM_aluout_o,
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //RF TO ALU MUXALU2
  wire [31:0]src2_i;
  mux #(4,2,32,32) MUXALU3(
		ForwardB, 
		src2_i, 
		ID_EX_rd1_o, 
		wd_i,
		EX_MEM_aluout_o,
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
 

  //RF TO ALU MUXALU2
  wire [31:0]src1_i;
  mux #(4,2,32,32) MUXALU2(
		ID_EX_ALUSrc,
		src1_i, 
		src2_i,
		ID_EX_Imm32, 
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //ALU
  wire [31:0]aluout_o;
  wire [4:0]shamt=ID_EX_inst[10:6];
  alu ALU_REAL(
		.aluop_i(ID_EX_ALUOp), 
		.src0_i(src0_i), 
		.src1_i(src1_i),
		.shamt(shamt), 
		.aluout_reg(aluout_o), 
		.zero_reg(zero)
		);
  
  //EX_MEM
  wire [25:0]Imm26_i=ID_EX_inst[25:0];
  wire [31:0]branch_address=ID_EX_PC+32'd4+(ID_EX_Imm32<<2);
  wire [31:0]jump_address={ID_EX_PC[31:28],Imm26_i,2'b00};
  EX_MEM MY_EX_MEM( 
		.clk(clk),
		.MemtoReg(ID_EX_MemtoReg), 
		.RegWrite(ID_EX_RegWrite), 
		.MemRead(ID_EX_MemRead), 
		.MemWrite(ID_EX_MemWrite),
		.NPCOp(ID_EX_NPCOp),
		.EX_MEM_MemtoReg(EX_MEM_MemtoReg), 
		.EX_MEM_RegWrite(EX_MEM_RegWrite),
		.EX_MEM_MemRead(EX_MEM_MemRead),
		.EX_MEM_MemWrite(mem_w), 
		.EX_MEM_NPCOp(EX_MEM_NPCOp),
		.EX_MEM_branch_address(EX_MEM_branch_address), 
		.EX_MEM_rd0_o(EX_MEM_rd0_o),
		.EX_MEM_aluout_o(EX_MEM_aluout_o),
		.EX_MEM_wa_i(EX_MEM_wa_i), 
		.rd0_o(ID_EX_rd0_o),
		.aluout_o(aluout_o),
		.wa_i(ID_EX_wa_i),
		.branch_address(branch_address),
		.jump_address(jump_address),
		.EX_MEM_jump_address(EX_MEM_jump_address),
		.instruction_in(ID_EX_inst),
		.instruction_out(EX_MEM_inst),
		.rd1_o(src2_i),
		.EX_MEM_rd1_o(EX_MEM_rd1_o), 
		.PC_NEXT_in(ID_EX_PC), 
		.PC_NEXT_out(EX_MEM_PC)
		);
  
  assign Addr_out=EX_MEM_aluout_o;
  assign Data_out=EX_MEM_rd1_o;
  
  //NPC
  NPC NPC_REAL(
		clk, 
		PC_out, 
		ID_EX_NPCOp, 
		zero, 
		src0_i,
		NPC_out, 
		branch_address, 
		jump_address
		);
  
  //PASSBY
  PASSBY PASSBY_REAL(
		.ID_EX_RS(ID_EX_inst[25:21]), 
		.ID_EX_RT(ID_EX_inst[20:16]), 
		.EX_MEM_RD(EX_MEM_wa_i), 
		.MEM_WB_RD(MEM_WB_wa_i), 
		.EX_MEM_RegWrite(EX_MEM_RegWrite), 
		.MEM_WB_RegWrite(MEM_WB_RegWrite), 
		.ForwardA(ForwardA), 
		.ForwardB(ForwardB)
		);
  
  //BE
  wire [3:0]be;
  BE BE_REAL(
		.ALUout_o(EX_MEM_aluout_o), 
		.OP(EX_MEM_inst[31:26]), 
		.be(be)
		);
  
  //DM
  wire [31:0]dout_o=Data_in;
  //dm_4k DM_REAL(
		//.dout(dout_o), 
		//.addr(EX_MEM_aluout_o[11:2]), 
		//.din(EX_MEM_rd1_o), 
		//.DMWr(mem_w), 
		//.clk(clk), 
		//.be(be)
		//);
  
  //LOAD_EXT
  wire [31:0]load_out;
  LOAD_EXT LOAD_EXT_REAL(
		.OP(EX_MEM_inst[31:26]), 
		.be(be),
		.DR_out(dout_o), 
		.load_out(load_out)
		);
  
  //MEM_WB
  MEM_WB MY_MEM_WB( 
		.clk(clk),
		.MemtoReg(EX_MEM_MemtoReg), 
		.RegWrite(EX_MEM_RegWrite), 
		.aluout_o(EX_MEM_aluout_o), 
		.dout(load_out),
		.MEM_WB_MemtoReg(MEM_WB_MemtoReg),
		.MEM_WB_RegWrite(MEM_WB_RegWrite), 
		.MEM_WB_aluout_o(MEM_WB_aluout_o), 
		.MEM_WB_dout(MEM_WB_dout),
		.PC_NEXT_in(EX_MEM_PC), 
		.PC_NEXT_out(MEM_WB_PC),
		.MEM_WB_wa_i(MEM_WB_wa_i), 
		.wa_i(EX_MEM_wa_i)
		);
  
  //DM TO RF MUXDM
  mux #(4,2,32,32) MUXDM(
		MEM_WB_MemtoReg,
		wd_i, 
		MEM_WB_aluout_o, 
		MEM_WB_dout, 
		MEM_WB_PC+32'd4,
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //ctrl
  ctrl ctrl_REAL(
		clk, 
		rst, 
		instruction_out[20:16],
		instruction_out[31:26], 
		instruction_out[5:0],
		ALUSrc,
		MemtoReg, 
		RegWrite,  
		MemRead, 
		MemWrite,
		NPCOp,
		EXTOp, 
		ALUOp, 
		RegDst
		);
  
  //PCsource(NPC)
  //wire [31:0]j_addr={pc_o[31:28],Imm26_i,2'b00};
  //mux #(4,2,32,32) MUXPC(
		//PCSource, 
		//NPC_out, 
		//aluout_o, 
		//ALUout_o,
		//j_addr, 
		//rd0_o,
		//32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		//);

endmodule
