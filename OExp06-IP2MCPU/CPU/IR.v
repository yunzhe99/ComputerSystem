module IR(clk, dout, IRout, IRWrite);
  input clk;
  input [0:0]IRWrite;
  input [31:0] dout;
  output  [31:0]  IRout;
  reg[31:0] IRout_o1;
  always@( posedge clk)
	begin
	  if(IRWrite)
		  IRout_o1 = dout;	
	end
	assign IRout = IRout_o1;
endmodule


