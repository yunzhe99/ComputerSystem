module EX_MEM(
  input clk, 
  input [1:0]MemtoReg, 
  input [0:0]RegWrite, 
  input [0:0]MemRead, 
  input [0:0]MemWrite, 
  input [1:0]NPCOp,  
  output reg [1:0]EX_MEM_MemtoReg, 
  output reg [0:0]EX_MEM_RegWrite,
  output reg [0:0]EX_MEM_MemRead,
  output reg [0:0]EX_MEM_MemWrite,
  output reg [1:0]EX_MEM_NPCOp,
  input [31:0]branch_address,
  input [31:0]jump_address,
  input [31:0]rd0_o,
  input [31:0]rd1_o,
  input [31:0]aluout_o,
  input [4:0]wa_i,
  output reg [31:0]EX_MEM_branch_address,
  output reg [31:0]EX_MEM_jump_address,
  output reg [31:0]EX_MEM_rd0_o,
  output reg [31:0]EX_MEM_rd1_o,
  output reg [31:0]EX_MEM_aluout_o,
  output reg [4:0]EX_MEM_wa_i,
  input [31:0]instruction_in,
  output reg [31:0]instruction_out,
  input [31:0]PC_NEXT_in,
  output reg [31:0]PC_NEXT_out
);

  always@( posedge clk)
    begin
      EX_MEM_MemtoReg=MemtoReg; 
      EX_MEM_RegWrite=RegWrite; 
      EX_MEM_MemRead=MemRead;
      EX_MEM_MemWrite=MemWrite; 
      EX_MEM_NPCOp=NPCOp; 
      EX_MEM_branch_address=branch_address;
      EX_MEM_jump_address=jump_address;
      EX_MEM_rd0_o=rd0_o;
      EX_MEM_rd1_o=rd1_o;
      EX_MEM_aluout_o=aluout_o;
      EX_MEM_wa_i=wa_i;
      PC_NEXT_out=PC_NEXT_in;
      instruction_out=instruction_in;
    end
  
endmodule
      
  





