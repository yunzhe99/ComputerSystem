`include "define.v"
`include "defines.v"
module alucontrol(
  input [1:0]ALUOp,[5:0]Funct,[5:0]OP,[4:0]rt,
  output [5:0]aluop_io
  );
  reg [5:0]aluop_i;
  assign aluop_io=aluop_i;
  
  always@(ALUOp)
  begin
    if(ALUOp==0)
      begin
        aluop_i=`ALUOP_ADD;
      end
    else if(ALUOp==1)
      begin
        if(OP==`BEQ)
          aluop_i=`ALUOP_BEQ;
        else if(OP==`BNE)
          aluop_i=`ALUOP_BNE;
        else if(OP==`BGEZ && rt==1)
          aluop_i=`ALUOP_BGEZ;
        else if(OP==`BGTZ)
          aluop_i=`ALUOP_BGTZ;
        else if(OP==`BLEZ)
          aluop_i=`ALUOP_BLEZ;
        else if(OP==`BLTZ && rt==0)
          aluop_i=`ALUOP_BLTZ;
      end
    else if(ALUOp==2)
      begin
        if((Funct==`FUNCT_ADD && OP==0)|| (Funct==`FUNCT_ADDU && OP==0) || OP==`ADDI || OP==`ADDIU)
          begin
            aluop_i=`ALUOP_ADD;
          end
        else if((Funct==`FUNCT_SUB && OP==0) || (Funct==`FUNCT_SUBU && OP==0))
          begin
            aluop_i=`ALUOP_SUB;
          end
        else if(Funct==`FUNCT_SLL && OP==0)  
          begin
            aluop_i=`ALUOP_SLL;
          end
        else if(Funct==`FUNCT_SLLV && OP==0) 
          begin
            aluop_i=`ALUOP_SLLV;
          end
        else if(Funct==`FUNCT_SRL && OP==0)  
          begin
            aluop_i=`ALUOP_SRL;
          end
        else if(Funct==`FUNCT_SRLV && OP==0)  
          begin
            aluop_i=`ALUOP_SRLV;
          end
        else if(Funct==`FUNCT_SRA && OP==0)
          begin
            aluop_i=`ALUOP_SRA;
          end
        else if(Funct==`FUNCT_SRAV && OP==0)
          begin
            aluop_i=`ALUOP_SRAV;
          end
        else if((Funct==`FUNCT_AND && OP==0)|| OP==`ANDI)  
          begin
            aluop_i=`ALUOP_AND;
          end
        else if((Funct==`FUNCT_OR && OP==0) || OP==`ORI)  
          begin
            aluop_i=`ALUOP_OR;
          end
        else if((Funct==`FUNCT_XOR && OP==0) || OP==`XORI)  
          begin
            aluop_i=`ALUOP_XOR;
          end
        else if(Funct==`FUNCT_NOR && OP==0)  
          begin
            aluop_i=`ALUOP_NOR;
          end
        else if((Funct==`FUNCT_SLT && OP==0) || OP==`SLTI)  
          begin
            aluop_i=`ALUOP_SLT;
          end
        else if((Funct==`FUNCT_SLTU && OP==0) || OP==`SLTIU)  
          begin
            aluop_i=`ALUOP_SLTU;
          end
        else if(OP==`LUI)
          begin
            aluop_i=`ALUOP_LUI;
          end
      end
  end
endmodule
  
