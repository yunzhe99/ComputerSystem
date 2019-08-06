module EXT(Imm16, EXTOp, Imm32);
  input [15:0] Imm16;
  input [1:0] EXTOp;
  output [31:0] Imm32;
  reg [15:0]logic_rlt;
  integer i;

  always@(*)
  begin
    i=Imm16>>15;
    if(EXTOp==0)
      logic_rlt = 16'b0;
    else
      if(i==0)
        logic_rlt = 16'b0;
      else
        logic_rlt = 16'hFFFF;
    
      
  end
  assign Imm32={logic_rlt, Imm16};
endmodule