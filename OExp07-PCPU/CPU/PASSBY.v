module PASSBY(
  input [4:0]ID_EX_RS,
  input [4:0]ID_EX_RT,
  input [4:0]EX_MEM_RD,
  input [4:0]MEM_WB_RD,
  input [0:0]EX_MEM_RegWrite,
  input [0:0]MEM_WB_RegWrite,
  output reg [1:0]ForwardA,
  output reg [1:0]ForwardB
);
  always@(*)
    begin
      ForwardA=0;
      ForwardB=0;
      if(EX_MEM_RegWrite==1 && (EX_MEM_RD!=0) && (EX_MEM_RD==ID_EX_RS))
        ForwardA=2;
      if(EX_MEM_RegWrite==1 && (EX_MEM_RD!=0) && (EX_MEM_RD==ID_EX_RT))
        ForwardB=2;        
      if(MEM_WB_RegWrite==1 && (MEM_WB_RD!=0) && (MEM_WB_RD==ID_EX_RS) && ~(EX_MEM_RegWrite==1 && (EX_MEM_RD!=0) && (EX_MEM_RD==ID_EX_RS)))
        ForwardA=1;
      if(MEM_WB_RegWrite==1 && (MEM_WB_RD!=0) && (MEM_WB_RD==ID_EX_RT) && ~(EX_MEM_RegWrite==1 && (EX_MEM_RD!=0) && (EX_MEM_RD==ID_EX_RT)))
        ForwardB=1;     
    end
  endmodule   
