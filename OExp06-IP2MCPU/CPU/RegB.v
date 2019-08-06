
module RegB(clk, rd1_o, RegBout);
  input clk;
  input [31:0] rd1_o;
  output  [31:0]  RegBout;
  reg[31:0] RegBout_o1;
  always@( negedge clk)
	begin
		RegBout_o1 = rd1_o;	
	end
	assign RegBout = RegBout_o1;
endmodule





