module PC(
			input clk,
			input reset,
			input write_PC,
			input [31:0] PC_i,
			output reg [31:0] PC_o
			);
	
	always@(negedge clk or negedge reset)
		begin
		if(!reset)
			begin
			PC_o <= 32'h0000_0000;
			end
		else if(write_PC)
			begin
			PC_o <= PC_i;
			end
		else
			begin
			PC_o <= PC_o;
			end
		end
endmodule