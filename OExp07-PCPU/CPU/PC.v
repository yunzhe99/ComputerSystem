
module PC(clk,rst_n,NPC_out ,pc_o, PCWrite);

	input   clk;
	input   rst_n;
	input   [31:0]NPC_out;
	
	output reg[31:0] pc_o;
	input [0:0] PCWrite;
	initial
    begin
        pc_o = 32'h0000_3000;
    end
	always@(posedge clk)
	begin
		if(rst_n)
			pc_o = 32'h0000_3000;
		else if(PCWrite==0)
			begin
			end
		else
			 pc_o = NPC_out;
	end
	
endmodule
	
	