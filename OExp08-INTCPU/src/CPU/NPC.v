module PCIncrement(PC_o, NPC);
	input [31:0] PC_o;
	output reg [31:0] NPC;
	
	always@(*)
		NPC = PC_o + 32'd4;
endmodule