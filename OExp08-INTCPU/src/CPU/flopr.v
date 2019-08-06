module flopr(
				input clk,
				input reset,
				input stall,
				input flush,
				input [width - 1:0] d,
				
				output reg [width - 1:0] q
				);
	
	parameter width = 32;	
	
	always@(negedge clk or negedge reset)
		begin
		if(!reset)
			q <= {width{1'b0}};

		else if(!stall)
			begin
				if(flush)
					q <= {width{1'b0}};

				else
					q <= d;
			end
		end
endmodule