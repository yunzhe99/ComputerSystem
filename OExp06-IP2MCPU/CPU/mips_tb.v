`define "ctrl.v"
`define "mux.v"
`define "RF.v"
`define "IM.v"
`define "DM.v"
`define "ALU.v"
`define "PC.v"
`define "NPC.v"
`define "EXT.v"
`define "mips.v"

module mips_tb();
  
  reg clk, rst_n;
  
  mips U_MIPS(
    .clock(clk), .rst(rst_n)
  );
  
  initial begin
    $readmemh("F:/modelsim se 10.1a crack/win32/second/code.txt", U_MIPS.IM_REAL.IMem );
    $monitor("PC=0X%8X, IR=0x%8X", U_MIPS.pc_o, U_MIPS.IM_out);
    clk=1;
    rst_n=0;
    #5;
    rst_n=1;
    #20;
    rst_n=0;
  end
  
  always
    #(50) clk=~clk;
endmodule
