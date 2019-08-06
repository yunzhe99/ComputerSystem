`include "defines.v"
module alu(
  input   [4:0] aluop_i,
  input   [31:0]src0_i,//rs or shamt
  input   [31:0]src1_i,//rt or transformed imm
  input   [4:0]shamt,
  output reg[31:0]aluout_reg,
  output reg [0:0]zero_reg
  );
 
reg [31:0]logic_rlt;
reg signed [31:0]src0_j;
reg signed [31:0]src1_j;
integer i;
				


always@(*)
begin
  case (aluop_i)
    `ALUOP_XOR:
        begin
          logic_rlt = src0_i ^ src1_i;
          aluout_reg = logic_rlt;
        end
    `ALUOP_AND:
        begin
          logic_rlt = src0_i & src1_i;
          aluout_reg = logic_rlt;
        end
	  `ALUOP_OR:
	      begin
		    logic_rlt = src0_i | src1_i;
		    aluout_reg = logic_rlt;
		    end
	  `ALUOP_NOR:
	      begin
		    logic_rlt = ~(src0_i | src1_i);
		    aluout_reg = logic_rlt;
		    end
	  `ALUOP_LUI:	
	      begin
		    logic_rlt = {src1_i[15:0], 16'd0};
		    aluout_reg = logic_rlt;
		    end
    `ALUOP_SLL:
        begin
        logic_rlt = src1_i << shamt;
        aluout_reg = logic_rlt;
        end
    `ALUOP_SLLV:
        begin
        logic_rlt = src1_i << (src0_i%32);
        aluout_reg = logic_rlt;
        end    
	  `ALUOP_SRL:
	      begin
		    logic_rlt = src1_i >> shamt;
		    aluout_reg = logic_rlt;
		    end
		`ALUOP_SRLV:
	      begin
		    logic_rlt = src1_i >> (src0_i%32);
		    aluout_reg = logic_rlt;
		    end
	  `ALUOP_SRA:
	      begin
		    logic_rlt = src1_i >> shamt;
		    if((src1_i[31] == 1) && (shamt > 0))
					for(i = 0;i < shamt;i = i + 1)
						logic_rlt[31 - i] = 1;
		    aluout_reg = logic_rlt;
		    end
		`ALUOP_SRAV:
	      begin
		    logic_rlt = src1_i >> (src0_i%32);
		    if((src1_i[31] == 1) && (src0_i > 0))
					for(i = 0;i < (src0_i%32);i = i + 1)
						logic_rlt[31 - i] = 1;
		    aluout_reg = logic_rlt;
		    end
	  `ALUOP_ADD:
	      begin
        logic_rlt = src0_i + src1_i;
        aluout_reg = logic_rlt;
        end
	  `ALUOP_SUB:
	      begin
		    logic_rlt = src0_i - src1_i;
		    aluout_reg = logic_rlt;
		    end
		 `ALUOP_BEQ:
	      begin
		    zero_reg = (src0_i==src1_i)?1'b1:1'b0;
		    end
		 `ALUOP_BNE:
	      begin
		    zero_reg = (src0_i!=src1_i)?1'b1:1'b0;
		    end
		 `ALUOP_BGEZ:
	      begin
		    zero_reg = (src0_i[31]==0)?1'b1:1'b0;
		    end
		 `ALUOP_BGTZ:
	      begin
		    zero_reg = (src0_i[31]==0 && src0_i!=0)?1'b1:1'b0;
		    end
		 `ALUOP_BLEZ:
	      begin
		    zero_reg = (src0_i[31]==0 && src0_i!=0)?1'b0:1'b1;
		    end
		 `ALUOP_BLTZ:
	      begin
		    zero_reg = (src0_i[31]==1)?1'b1:1'b0;
		    end
		 `ALUOP_SLT:
	      begin
	      src0_j = src0_i;
				src1_j = src1_i;
	        if(src0_j >= src1_j)
		        begin
		        zero_reg = 1'd0;
		        aluout_reg = {32'b0};
		        end
		      else
		        begin
		        zero_reg = 1'd1;
		        aluout_reg = {32'b1};
		        end
		    end
		  `ALUOP_SLTU:
	      begin
	        if(src0_i >= src1_i)
		        begin
		        zero_reg = 1'd0;
		        aluout_reg = {32'b0};
		        end
		      else
		        begin
		        zero_reg = 1'd1;
		        aluout_reg = {32'b1};
		        end
		    end
	  default:
	      begin
		    logic_rlt = 32'b0;
		    aluout_reg = logic_rlt;
		    end
  endcase
  
end

endmodule



