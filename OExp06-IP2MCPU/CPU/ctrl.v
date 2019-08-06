module ctrl(
  input clk, rst_n, [0:0]zero_o,
  input [5:0]OP, [5:0]Funct,
  output reg ALUSrc, [1:0]MemtoReg, [0:0]RegWrite, [0:0]MemRead, [0:0]MemWrite, [1:0]NPCOp, [1:0]EXTOp
, [1:0]ALUOp, [0:0]PCWrite, [0:0]IRWrite, [1:0]RegDst
  );
  always@(*)
  begin
    if(OP == 35)//lw  
      begin    
        ALUSrc=1;
        MemtoReg=1;
        RegWrite=1;
        MemRead=1;
        MemWrite=0;
        NPCOp=0;
        EXTOp=1;
        ALUOp=0;
        PCWrite=1;
        IRWrite=1;
        RegDst=1;
      end
    else if(OP == 43)//sw
      begin
        ALUSrc=1;
        MemtoReg=1'bx;
        RegWrite=0;
        MemRead=0;
        MemWrite=1;
        NPCOp=0;
        EXTOp=1;
        ALUOp=0;
        PCWrite=1;
        IRWrite=1;
        RegDst=1'bx;
      end
    else if(OP == 4)//beq
      begin
        ALUSrc=0;
        MemtoReg=1'bx;
        RegWrite=0;
        MemRead=0;
        MemWrite=0;
        EXTOp=1;
        ALUOp=1;
        PCWrite=1;
        IRWrite=1;
        RegDst=1'bx;
        if(zero_o==1)
          NPCOp=1;
        else 
          NPCOp=0;
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
        PCWrite=1;
        IRWrite=1;
        RegDst=0;
        if(Funct==33)//addu
          ALUOp=0;
        else if(Funct==35)//subu
          ALUOp=1;
      end
    else if(OP == 13)//ori
      begin
        ALUSrc=1;
        MemtoReg=0;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=0;
        EXTOp=0;
        ALUOp=2;
        PCWrite=1;
        IRWrite=1;
        RegDst=1;
      end
    else if(OP == 3)//jal
      begin
        ALUSrc=1'bx;
        MemtoReg=2;
        RegWrite=1;
        MemRead=0;
        MemWrite=0;
        NPCOp=2;
        EXTOp=0;
        ALUOp=1'bx;
        PCWrite=1;
        IRWrite=1;
        RegDst=2;
      end    
  end
endmodule


