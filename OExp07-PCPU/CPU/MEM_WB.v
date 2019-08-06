module MEM_WB(
  input clk, 
  input [1:0]MemtoReg, 
  input [0:0]RegWrite,   
  output reg [1:0]MEM_WB_MemtoReg, 
  output reg [0:0]MEM_WB_RegWrite,
  input [31:0]aluout_o,
  output reg [31:0]MEM_WB_aluout_o,
  input [31:0]dout,
  output reg [31:0]MEM_WB_dout,
  input [31:0]PC_NEXT_in,
  output reg [31:0]PC_NEXT_out,
  input [4:0]wa_i,
  output reg [4:0]MEM_WB_wa_i
);

  always@( posedge clk)
    begin
      MEM_WB_MemtoReg=MemtoReg; 
      MEM_WB_RegWrite=RegWrite; 
      MEM_WB_aluout_o=aluout_o;
      MEM_WB_dout=dout;
      PC_NEXT_out=PC_NEXT_in;
      MEM_WB_wa_i=wa_i;
    end
endmodule
      
  







