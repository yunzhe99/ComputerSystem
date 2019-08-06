
module PC(clk,rst_n,NPC_out ,pc_o,PC_OK);

	input   clk;
	input   rst_n;
	input   [31:0]NPC_out;
	input   [0:0]PC_OK;
	output reg[31:0] pc_o;
	initial
    begin
        pc_o = 32'h0000_3000;
    end

	
	always@(posedge clk)
	begin
	  if(rst_n)
		begin
			pc_o = 32'h0000_3000;
		end
	  else if(PC_OK)
	    begin
		    pc_o = NPC_out;
		  end
	end
endmodule
	
	