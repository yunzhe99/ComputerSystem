`include "Global_Define.v"
module Branch_Or_Jump(
						input Reverse,
						input branchZero,
						input [1:0] ChangeType,
						
						output reg [1:0] branch_Or_Jump
						);
	
	always@(*)
		begin
			case(ChangeType)
				`Sequence:
					branch_Or_Jump <= `Sequence;

				`Branch:
					begin
						if(Reverse ^ branchZero)
							branch_Or_Jump <= `Branch;

						else
							branch_Or_Jump <= `NotBranch;
					end
				`Jump:
					branch_Or_Jump <= `Jump;

				default:
					branch_Or_Jump <= `Sequence;

			endcase
		end
endmodule