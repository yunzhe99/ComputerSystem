
module RegALUout(clk, aluout, aluout_o);
  input clk;
  input [31:0] aluout;
  output  [31:0]  aluout_o;
  reg[31:0] Regaluout_o;
  always@( negedge clk)
	begin
		Regaluout_o = aluout;	
	end
	assign aluout_o = Regaluout_o;
endmodule







