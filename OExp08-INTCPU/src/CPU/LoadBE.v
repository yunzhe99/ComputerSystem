`include "Global_Define.v"
module LoadBE(
				input [2:0] LoadType,
				input [1:0] ALUOut,
				input [31:0] MemData_i,
				
				output reg [31:0] MemData_o
				);
	
	initial
		MemData_o = 32'b0;
	
	always@(*)
		begin
		case(LoadType)
			`LoadWord: MemData_o = MemData_i;
			`LoadHalfWord:
				begin
					case(ALUOut)
						2'b00: MemData_o = {{16{MemData_i[15]}}, MemData_i[15:0]};
						2'b10: MemData_o = {{16{MemData_i[31]}}, MemData_i[31:16]};
						default: MemData_o = 32'b0;
					endcase
				end
			`LoadHalfWordU:
				begin
					case(ALUOut)
						2'b00: MemData_o = {16'b0, MemData_i[15:0]};
						2'b10: MemData_o = {16'b0, MemData_i[31:16]};
						default: MemData_o = 32'b0;
					endcase
				end
			`LoadByte:
				begin
					case(ALUOut)
						2'b00: MemData_o = {{24{MemData_i[7]}}, MemData_i[7:0]};
						2'b01: MemData_o = {{24{MemData_i[15]}}, MemData_i[15:8]};
						2'b10: MemData_o = {{24{MemData_i[23]}}, MemData_i[23:16]};
						2'b11: MemData_o = {{24{MemData_i[31]}}, MemData_i[31:24]};
						default: MemData_o = 32'b0;
					endcase
				end
			`LoadByteU:
				begin
					case(ALUOut)
						2'b00: MemData_o = {24'b0, MemData_i[7:0]};
						2'b01: MemData_o = {24'b0, MemData_i[15:8]};
						2'b10: MemData_o = {24'b0, MemData_i[23:16]};
						2'b11: MemData_o = {24'b0, MemData_i[31:24]};
						default: MemData_o = 32'b0;
					endcase
				end
			default: MemData_o = MemData_i;
		endcase
		end
endmodule