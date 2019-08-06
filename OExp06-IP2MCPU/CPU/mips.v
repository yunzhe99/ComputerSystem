`include "define.v"
`include "defines.v"
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
  wire  [0:0]zero_o;
  
  //PC
  wire [31:0]NPC_out;
  wire [0:0]PC_OK;
  assign PC_OK=(PCWriteCond&zero_o)|PCWrite;
  PC PC_REAL(
		.clk(clk), 
		.rst_n(rst), 
		.NPC_out(NPC_out), 
		.pc_o(PC_out), 
		.PC_OK(PC_OK)
		);
  
  //IM
  //wire [31:0]inst_in;
  //im_4k IM_REAL(
		//.addr(PC_out[11:2]), 
		//.dout(inst_in)
		//);
  
  //IR
  wire [31:0]IR_out;
  IR MY_IR(
		.clk(clk), 
		.dout(inst_in),
		.IRout(IR_out),
		.IRWrite(IRWrite)
		);
  
  //IM TO RF MUXRF
  wire [4:0]muxrf_0=IR_out[20:16];
  wire [4:0]muxrf_1=IR_out[15:11];//RegDst=0 rd
  wire [4:0]wa_i;
  wire  [1:0]RegDst;
  mux #(4,2,5,5) MUXRF(
		RegDst, 
		wa_i, 
		muxrf_1,
		muxrf_0,
		5'd31, 5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1,5'b1
		);
  
  //RF
  wire [4:0]ra0_i=IR_out[25:21];
  wire [4:0]ra1_i=IR_out[20:16];
  wire [31:0]wd_i;
  wire [31:0]rd0_o;
  wire [31:0]rd1_o;
  wire       RegWrite;
  RF RF_REAL(
		.ra0_i(ra0_i), 
		.ra1_i(ra1_i),
		.wa_i(wa_i), 
		.wd_i(wd_i), 
		.RegWrite(RegWrite),
		.rd0_o(rd0_o),
		.rd1_o(rd1_o), 
		.clk(clk)
		);
  
  //RegA
  wire [31:0] RegAout;
  RegA RegA_REAL(
		.clk(clk), 
		.rd0_o(rd0_o), 
		.RegAout(RegAout)
		);
  
  //RegB
  wire [31:0] RegBout;
  RegB RegB_REAL(
		.clk(clk), 	
		.rd1_o(rd1_o), 
		.RegBout(RegBout)
		);
  
  //EXT
  wire [15:0]Imm16=IR_out[15:0];
  wire [31:0]Imm32;
  wire  [1:0]EXTOp;
  EXT EXT_REAL(
		.Imm16(Imm16), 
		.EXTOp(EXTOp), 
		.Imm32(Imm32)
		);
  
  //RF TO ALU MUXALU1
  wire [31:0]src0_i;
  wire [0:0] ALUSrcA;
  mux #(2,1,32,32) MUXALU1(
		ALUSrcA, 
		src0_i, 
		PC_out,
		RegAout, 
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //RF TO ALU MUXALU2
  wire [31:0]src1_i;
  wire [1:0] ALUSrcB;
  mux #(4,2,32,32) MUXALU2(
		ALUSrcB, 
		src1_i, 
		RegBout,
		32'h4, 
		Imm32,
		{Imm32[29:0],2'b0},
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //alucontrol
  wire [5:0]aluop_io;
  wire  [1:0]ALUOp;
  alucontrol alucontrol_REAL(
		.ALUOp(ALUOp), 
		.Funct(IR_out[5:0]), 
		.OP(IR_out[31:26]),
		.aluop_io(aluop_io),
		.rt(IR_out[20:16])
		);
  
  //ALU
  wire [31:0]aluout_o;
  wire [4:0]shamt=IR_out[10:6];
  alu ALU_REAL(
		aluop_io,
		src0_i,
		src1_i,
		shamt,
		aluout_o,
		zero_o
		);
  
  //ALUout
  wire [31:0] ALUout_o;
  RegALUout RegALUout_REAL(
		.clk(clk), 
		.aluout(aluout_o),
		.aluout_o(ALUout_o)
		);
  
  //NPC
  wire [25:0]Imm26_i=IR_out[25:0];
//  wire  [1:0]NPCOp;
//  NPC NPC_REAL(
		//PC_out, 
		//Imm32, 
		//Imm26_i,
		//NPCOp,
		//NPC_out
		//);
  
  
  //BE
  wire [3:0]be;
  BE BE_REAL(
		.ALUout_o(ALUout_o),
		.OP(IR_out[31:26]),
		.be(be)
		);
  
  //DM
  assign Addr_out=ALUout_o;
  assign Data_out=rd1_o;
  //dm_4k DM_REAL(
		//.dout(Data_in), 
		//.addr(Addr_out), 
		//.din(rd1_o), 
		//.DMWr(mem_w),
		// .clk(clk), 
		//.be(be)
		//);
  
  //DR
  wire [31:0]DR_out;
  MDR MY_DR(
		.clk(clk),
		.dout(Data_in),
		.MDRout(DR_out)
		);
  
  //LOAD_EXT
  wire [31:0]load_out;
  LOAD_EXT LOAD_EXT_REAL(
		.OP(IR_out[31:26]), 
		.be(be), 
		.DR_out(DR_out),
		.load_out(load_out)
		);
  
  //DM TO RF MUXDM
  wire  [1:0]MemtoReg;
  mux #(4,2,32,32) MUXDM(
		MemtoReg, 
		wd_i, 
		ALUout_o, 
		load_out,
		PC_out, 
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);
  
  //ctrl
  control ctrl_REAL(
		clk, 
		rst, 
		zero_o,
		IR_out[31:26], 
		IR_out[5:0],
		ALUSrcA, 
		ALUSrcB, 
		MemtoReg, 
		RegWrite, 
		IMemRead, 
		MemRead, 
		mem_w, 
		EXTOp, 
		ALUOp, 
		PCWrite, 
		IRWrite, 
		RegDst, 
		PCWriteCond, 
		PCSource
		);
  
  //PCsource(NPC)
  wire [31:0]j_addr={PC_out[31:28],Imm26_i,2'b00};
  mux #(4,2,32,32) MUXPC(
		PCSource, 
		NPC_out, 
		aluout_o,
		ALUout_o,
		j_addr, 
		RegAout,
		32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1,32'b1
		);

endmodule
