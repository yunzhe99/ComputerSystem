module MDR(clk, dout, MDRout);
  input clk;
  input [31:0] dout;
  output  [31:0]  MDRout;
  reg[31:0] MDRout_o1;
  always@(posedge clk)
	begin
		MDRout_o1 = dout;	
	end
	assign MDRout = MDRout_o1;
endmodule




