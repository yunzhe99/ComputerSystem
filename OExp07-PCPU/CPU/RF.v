
module RF(ra0_i,ra1_i,wa_i,wd_i,RegWrite,rd0_o,rd1_o,clk);
	input clk;
	input RegWrite;
	input [4:0] ra0_i,ra1_i,wa_i;
	input [31:0] wd_i;
	
	output [31:0] rd0_o,rd1_o;
	
	
	reg [31:0] regs[31:0];
	
	always@(negedge clk)
	begin
		if(RegWrite == 1 && wa_i!=0)
			regs[wa_i] <= wd_i;
	end
	assign rd0_o = (ra0_i==0)?0:regs[ra0_i];
	assign rd1_o = (ra1_i==0)?0:regs[ra1_i];
	
endmodule