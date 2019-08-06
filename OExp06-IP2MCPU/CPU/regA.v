
module RegA(clk, rd0_o, RegAout);
  input clk;
  input [31:0] rd0_o;
  output  [31:0]  RegAout;
  reg[31:0] RegAout_o1;
  always@( negedge clk)
	begin
		RegAout_o1 = rd0_o;	
	end
	assign RegAout = RegAout_o1;
endmodule



