module NPC(clk, pc_o, NPCOP, zero_o , rd0_o, NPC_out, branch_address, jump_address);
  input clk;
  input [31:0] pc_o;
  input [1:0]NPCOP;
  input [0:0]zero_o;
  input [31:0]rd0_o;
  input [31:0]branch_address;
  input [31:0]jump_address;
  output reg[31:0] NPC_out;
  always@(*)
  begin
    if(NPCOP==1 && zero_o==1 )
      begin
        NPC_out = branch_address;
      end
    else if(NPCOP==2)
      begin
        NPC_out = jump_address;
      end
    else if(NPCOP==3)
		  begin
		    NPC_out = rd0_o;
		  end
		 else
		   begin
		     NPC_out = pc_o + 32'd4;
		   end
  end
endmodule