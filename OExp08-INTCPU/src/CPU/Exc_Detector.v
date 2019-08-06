`include "Global_Define.v"
module Exc_Detector(
						input RI,
						input Ov,
						
						output reg [1:0] ExcCode
						);
	
	always@(*)
		begin
			if(Ov)
				ExcCode = `Ov;

			else if(RI)
				ExcCode = `Unimpl;

			else
				ExcCode = `Int;

		end
endmodule