`include "define.v"
`include "defines.v"
module ctrl(
  input clk, rst_n, [4:0]rt,
  input [5:0]OP, [5:0]Funct,
  output reg [1:0]ALUSrc, 
  output reg [1:0]MemtoReg,
  output reg [0:0]RegWrite, 
  output reg [0:0]MemRead, 
  output reg [0:0]MemWrite, 
  output reg [1:0]NPCOp, 
  output reg [1:0]EXTOp, 
  output reg [4:0]ALUOp, 
  output reg [1:0]RegDst
  );
  always@(*)
  begin
    if(OP == `BNE || OP == `BEQ || OP == `BGEZ || OP == `BGTZ || OP == `BLEZ || OP == `BLTZ)
      begin
        ALUSrc=0;
        MemtoReg=1'bx;
        RegWrite=0;
        MemRead=0;
        MemWrite=0;
        EXTOp=1;
        RegDst=1'bx; 
        NPCOp=1;
        if(OP == `BNE)
          ALUOp=`ALUOP_BNE;
        else if(OP == `BEQ)
          ALUOp=`ALUOP_BEQ;
        else if(OP == `BGEZ && rt == 1)
          ALUOp=`ALUOP_BGEZ;
        else if(OP == `BGTZ)
          ALUOp=`ALUOP_BGTZ;
        else if(OP == `BLEZ)
          ALUOp=`ALUOP_BLEZ;
        else if(OP == `BLTZ && rt == 0)
          ALUOp=`ALUOP_BLTZ;
      end
  	 else if(OP == `ADDI || OP == `ADDIU)//addi
		  begin
		    ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=1;
        ALUOp=`ALUOP_ADD;
        
        
        RegDst=1;
		  end
	   else if(OP == `ANDI)//andi
		  begin
		    ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        ALUOp=`ALUOP_AND;
        
        
        RegDst=1;
		  end
	 else if(OP == `ORI)//ori
      begin
        ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        ALUOp=`ALUOP_OR;
        
        
        RegDst=1;
      end
	 else if(OP == `XORI)//ori
      begin
        ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        ALUOp=`ALUOP_XOR;
        
        
        RegDst=1;
      end
	 else if(OP == `LUI)//lui
      begin
        ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        ALUOp=`ALUOP_LUI;
        
        
        RegDst=1;
      end
	 else if(OP == `SLTIU)//slti
		begin
		  ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=1;
        ALUOp=`ALUOP_SLTU;
        
        
        RegDst=1;
		  end
	 else if(OP == `SLTI)//slti
		begin
		  ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=1;
        ALUOp=`ALUOP_SLT;
        
        
        RegDst=1;
		  end
    else if(OP == `LW || OP == `LB || OP == `LBU || OP == `LH || OP == `LHU)//lw  
      begin    
        ALUSrc=1;
        MemtoReg=1;
        RegWrite=1;
        MemRead=1;
        MemWrite=0;
        NPCOp=0;
        EXTOp=1;
        ALUOp=`ALUOP_ADD;
        
        RegDst=1;
      end
    else if(OP == `SW || OP == `SH || OP == `SB)//sw
      begin
        ALUSrc=1;
        MemtoReg=1'bx;
        RegWrite=0;
        MemRead=0;
        MemWrite=1;
        NPCOp=0;
        EXTOp=1;
        ALUOp=`ALUOP_ADD;
        
        
        RegDst=1'bx;
      end
    else if(OP == 0)//R
      begin
        ALUSrc=0;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        
        
        RegDst=0;
      if(Funct==`FUNCT_ADD || Funct==`FUNCT_ADDU)//add
          ALUOp=`ALUOP_ADD;
		  else if(Funct==`FUNCT_SUB || Funct==`FUNCT_SUBU)//sub
          ALUOp=`ALUOP_SUB; 
		  else if(Funct==`FUNCT_OR)//or
			    ALUOp=`ALUOP_OR;
      else if(Funct==`FUNCT_AND)//and
          ALUOp=`ALUOP_AND;
	    else if(Funct==`FUNCT_NOR)//nor
		      ALUOp=`ALUOP_NOR;
		  else if(Funct==`FUNCT_SLT)//slt
		      ALUOp=`ALUOP_SLT;
		  else if(Funct==`FUNCT_SLTU)//slt
		      ALUOp=`ALUOP_SLTU;
		  else if(Funct==`FUNCT_SLL)
		      ALUOp=`ALUOP_SLL;		    
		  else if(Funct==`FUNCT_SLLV)
		      ALUOp=`ALUOP_SLLV;	
		  else if(Funct==`FUNCT_SRL)//srl
		      ALUOp=`ALUOP_SRL;
		  else if(Funct==`FUNCT_SRLV)
		      ALUOp=`ALUOP_SRLV;
		  else if(Funct==`FUNCT_SRA)
		      ALUOp=`ALUOP_SRA;
		  else if(Funct==`FUNCT_SRAV)
		      ALUOp=`ALUOP_SRAV;
		  else if(Funct==`FUNCT_XOR)
		      ALUOp=`ALUOP_XOR;
		  else if(Funct==`FUNCT_JR)//jr
			 begin
				ALUOp=`ALUOP_ADD;
				RegWrite=0;
				NPCOp=3;
			 end
		  else if(Funct==`FUNCT_JALR)//jalr
			 begin
				ALUSrc=1'bx;
				MemtoReg=2;
				RegWrite=1;
				MemRead=0;
				MemWrite=0;
				NPCOp=3;
				EXTOp=0;
				ALUOp=`ALUOP_ADD;
				
				
				RegDst=2;
			 end
      end
    else if(OP == `J)//J
      begin
        ALUSrc=1'bx;
        MemtoReg=2;
        RegWrite=0;
        MemRead=0;
        MemWrite=0;
        NPCOp=2;
        EXTOp=0;
        ALUOp=1'bx;
        
        
        RegDst=2;
      end
    else if(OP == `JAL)//jal
      begin
        ALUSrc=1'bx;
        MemtoReg=2;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=2;
        EXTOp=0;
        ALUOp=1'bx;
        
        
        RegDst=2;
      end    
  end
endmodule


