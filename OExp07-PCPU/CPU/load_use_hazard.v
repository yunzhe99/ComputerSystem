`include "define.v"
module load_use_hazard( //??lw?????????????
  input [31:0]ID_EX_inst,
  input [31:0]IF_ID_inst,
  output reg [0:0]PCWrite,
  output reg [0:0]IF_ID_Write,
  output reg [0:0]clean,
  output reg [0:0]Flush,
  input [0:0]zero_o
  );
  always@(*)
    begin
      if((ID_EX_inst[31:26]==`LW || ID_EX_inst[31:26]==`LH || ID_EX_inst[31:26]==`LHU || ID_EX_inst[31:26]==`LB || ID_EX_inst[31:26]==`LBU) && 
  ((ID_EX_inst[20:16]==IF_ID_inst[25:21]) || (ID_EX_inst[20:16]==IF_ID_inst[20:16])))
        begin
          IF_ID_Write=0;
          PCWrite=0;
          clean=1;
          Flush=0;
        end
      else if(((ID_EX_inst[31:26]==`BEQ || ID_EX_inst[31:26]==`BNE || ID_EX_inst[31:26]==`BGTZ ||
      ID_EX_inst[31:26]==`BGEZ || ID_EX_inst[31:26]==`BLEZ || ID_EX_inst[31:26]==`BLTZ) && zero_o==1) || 
      ID_EX_inst[31:26]==`J || ID_EX_inst[31:26]==`JAL || (ID_EX_inst[31:26]==0 && ID_EX_inst[5:0]==`FUNCT_JR)
      || (ID_EX_inst[31:26]==0 && ID_EX_inst[5:0]==`FUNCT_JALR))
        begin
          IF_ID_Write=1;
          PCWrite=1;
          clean=0;
          Flush=1;
        end
      else
        begin
          IF_ID_Write=1;
          PCWrite=1;
          clean=0;  
          Flush=0;  
        end
    end
  endmodule      
