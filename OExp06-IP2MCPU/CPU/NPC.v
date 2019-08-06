module NPC(pc_o, Imm32, Imm26_i, NPCOP, NPC_out,rd0_o);
  input [31:0] pc_o;
  input [31:0] Imm32;
  input [25:0] Imm26_i;
  input [1:0]NPCOP;
  input [31:0]rd0_o;
  
  output reg[31:0] NPC_out;
  always@(*)
  begin
    if(NPCOP==0)
      begin
        NPC_out = pc_o + 32'd4;
      end
    else if(NPCOP==1)
      begin
        NPC_out = pc_o + 32'd4 + (Imm32<<2);
      end
    else if(NPCOP==2)
      begin
        NPC_out = {pc_o[31:28],Imm26_i,2'b00};
      end
	 else if(NPCOP==3)
		begin
		  NPC_out = rd0_o;
		end
	 else
		NPC_out = 0;
  end
endmodule