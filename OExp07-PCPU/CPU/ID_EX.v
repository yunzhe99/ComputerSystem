module ID_EX(
  input clk,
  input Flush,
  input [31:0]PC_NEXT_in,
  input [31:0]instruction_in,
  output reg [31:0]PC_NEXT_out,
  output reg [31:0]instruction_out,
  input [1:0]ALUSrc, 
  input [1:0]MemtoReg, 
  input [0:0]RegWrite, 
  input [0:0]MemRead, 
  input [0:0]MemWrite, 
  input [1:0]NPCOp, 
  input [4:0]ALUOp, 
  input [4:0]wa_i,
  output reg [1:0]ID_EX_ALUSrc, 
  output reg [1:0]ID_EX_MemtoReg, 
  output reg [0:0]ID_EX_RegWrite,
  output reg [0:0]ID_EX_MemRead,
  output reg [0:0]ID_EX_MemWrite,
  output reg [1:0]ID_EX_NPCOp,
  output reg [4:0]ID_EX_ALUOp,
  output reg [4:0]ID_EX_wa_i,
  input [31:0]rd0_o,
  input [31:0]rd1_o,
  output reg [31:0]ID_EX_rd0_o,
  output reg [31:0]ID_EX_rd1_o,
  input [31:0]Imm32,
  output reg [31:0]ID_EX_Imm32
);

  always@( posedge clk)
    if(Flush==1)
      begin
        PC_NEXT_out=0;
        instruction_out=0;
        ID_EX_ALUSrc=0;
        ID_EX_MemtoReg=0; 
        ID_EX_RegWrite=0; 
        ID_EX_MemRead=0;
        ID_EX_MemWrite=0; 
        ID_EX_NPCOp=0; 
        ID_EX_ALUOp=0;
        ID_EX_wa_i=0;
        ID_EX_rd0_o=0;
        ID_EX_rd1_o=0;
        ID_EX_Imm32=0; 
      end
    else       
    begin
      PC_NEXT_out=PC_NEXT_in;
      instruction_out=instruction_in;
      ID_EX_ALUSrc=ALUSrc;
      ID_EX_MemtoReg=MemtoReg; 
      ID_EX_RegWrite=RegWrite; 
      ID_EX_MemRead=MemRead;
      ID_EX_MemWrite=MemWrite; 
      ID_EX_NPCOp=NPCOp; 
      ID_EX_ALUOp=ALUOp;
      ID_EX_wa_i=wa_i;
      ID_EX_rd0_o=rd0_o;
      ID_EX_rd1_o=rd1_o;
      ID_EX_Imm32=Imm32;
    end
  
endmodule
      
  




