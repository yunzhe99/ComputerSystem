`include "define.v"
`include "defines.v"
module control(
  input clk, rst_n, [0:0]zero_o,
  input [5:0]OP, [5:0]Funct,
  output reg [0:0]ALUSrcA, [1:0]ALUSrcB, [1:0]MemtoReg, [0:0]RegWrite, [0:0]IMemRead, [0:0]DMemRead, [0:0]DMemWrite, [1:0]EXTOp
, [1:0]ALUOp, [0:0]PCWrite, [0:0]IRWrite, [1:0]RegDst, [0:0]PCWriteCond, [1:0]PCSource
  );
  reg [4:0]state=0;
  
  
  always@(negedge clk)
  begin
   
   if(state==0)//fetch instruction
    begin
      state=1;
      
      ALUSrcA=0;
      ALUSrcB=1;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=1;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=0;
      PCWrite=1;
      IRWrite=1;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
    end
    
  else if (state==1)//decode 
    begin
      
      ALUSrcA=0;
      ALUSrcB=3;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=1;       //
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
      
      if(OP==0)
        begin
          state=6;
          
          
        end
      else if (OP==`LB || OP==`LBU || OP==`LH || OP==`LHU || OP==`LW || OP==`SB || OP==`SH || OP==`SW)
        begin
          state=2;
      
        end
      else if(OP==`BEQ || OP==`BNE || OP==`BLEZ || OP==`BGTZ || OP==`BLTZ || OP==`BGEZ)
        begin
          state=8;
         
        end
      else if(OP==`J || OP==`JAL)
        begin
          state=9;
          
        end
      else if(OP==`ADDI || OP==`ADDIU || OP==`ANDI || OP==`ORI || OP==`XORI || OP==`LUI || OP==`SLTI || OP==`SLTIU)
        begin
          state=10;
          EXTOp=1;
        end
    end
  else if(state==2) //??????
    begin
      
       
      ALUSrcA=1;
      ALUSrcB=2;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=1;
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
      if(OP==`LB || OP==`LBU || OP==`LH || OP==`LHU || OP==`LW)
        begin
          state=3;
        end
      else if(OP==`SB || OP==`SH || OP==`SW)
        begin
          state=5;
        end
    end
      
  else if(state==3)
    begin
      state=4;
      ALUSrcA=0;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=1;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
    end
      
  else if(state==5)
    begin
      state=0;
      
      ALUSrcA=0;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=1;
      EXTOp=0;
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
    end
    
  else if(state==4)
    begin
      state=0;
      ALUSrcA=0;
      ALUSrcB=0;
      MemtoReg=1;
      RegWrite=1;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      RegDst=1;
      PCWriteCond=0;
      PCSource=0;
    end
    
  else if(state==6)
    begin
      state=7;
      ALUSrcA=1;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=2;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
      if(Funct==`FUNCT_JALR)
        begin
          state=0;
          RegWrite=1;
          MemtoReg=2;
          RegDst=0;
          PCSource=3;
          PCWrite=1;
        end
      else if(Funct==`FUNCT_JR)
        begin
          state=0;
          PCSource=3;
          PCWrite=1;
        end
    end
    
  else if(state==7)
    begin
      state=0;
      
      ALUSrcA=0;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=1;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=0;
      PCWrite=0;
      IRWrite=0;
      PCWriteCond=0;
      PCSource=0;
      if(OP==0)
        begin
          RegDst=0;
        end
      else
        begin
          RegDst=1;
        end
    end
    
  else if(state==8)
    begin
      state=0;
      ALUSrcA=1;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=1;
      ALUOp=1;
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=1;
      PCSource=1;
    end
    
  else if(state==9)//j
    begin
      state=0;
      ALUSrcA=0;
      ALUSrcB=0;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=0;
      PCWrite=1;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=2;
      if(OP==`JAL)
        begin
          RegWrite=1;
          MemtoReg=2;
          RegDst=2;
        end
    end
    
  else if(state==10)
    begin
      state=7;
      
      ALUSrcA=1;
      ALUSrcB=2;
      MemtoReg=0;
      RegWrite=0;
      IMemRead=0;
      DMemRead=0;
      DMemWrite=0;
      EXTOp=0;
      ALUOp=2;//
      PCWrite=0;
      IRWrite=0;
      RegDst=0;
      PCWriteCond=0;
      PCSource=0;
    end
  end
endmodule