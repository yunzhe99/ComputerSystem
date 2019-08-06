`include "Global_Define.v"
module CoPR0(
				input clk,
				input reset,
				input INT,
				input syscall,
				input eret,
				input DEBUG_SW3,				
				input CR_Read,
				input CR_Write,
				input [1:0] ExcCode,
				input [3:0] DEBUG_BTN,
				input [4:0] CR_Addr,
				input [31:0] PCPluse4,
				input [31:0] CR_Write_Data,
				
				output INT_MASK,
				output reg INT_ACK,
				output reg EPC_Selected,
				output reg Data_Selected,
				output reg IF_ID_Flush,
				output reg ID_EX_Flush,
				output reg EX_MEM_Flush,
				output reg MEM_WB_Flush,
				output reg [15:0] DEBUG_CoPRINFO,
				output reg [31:0] CR_Read_Data
				);
	
	reg [1:0] CR_Cause;
	reg [3:0] CR_Status;
	reg [3:0] CR_Pre_Status;
	reg [31:0] CR_EPC;
	reg [31:0] CR_Exc_Vector = 32'h0000_0008;
	
	assign INT_MASK = CR_Status[0];
	
	always@(*)
		begin
		DEBUG_CoPRINFO = {22'b0, CR_Pre_Status, CR_Status, CR_Cause};
		end
	
	always@(posedge clk or negedge reset)
		begin
		if(!reset)
			begin
			CR_Cause <= `Int;
			CR_Status <= `Int_MASK;
			CR_Pre_Status <= `None_MASK;
			CR_EPC <= 32'b0;
			CR_Read_Data <= 32'b0;
			INT_ACK <= `DISABLE;
			EPC_Selected <= `DISABLE;
			Data_Selected <= `DISABLE;
			IF_ID_Flush <= `DISABLE;
			ID_EX_Flush <= `DISABLE;
			EX_MEM_Flush <= `DISABLE;
			MEM_WB_Flush <= `DISABLE;
			end
		else
			begin
			if((ExcCode != `Int) && (((4'b1 << ExcCode) & CR_Status) !=4'b0))		
				begin
				CR_EPC <= PCPluse4 - 32'd8;		
				CR_Pre_Status <= CR_Status;
				CR_Status <= `All_MASK;
				CR_Cause <= ExcCode;
				INT_ACK <= `DISABLE;
				CR_Read_Data <= CR_Exc_Vector;
				EPC_Selected <= `ENABLE;
				Data_Selected <= `DISABLE;
				if(ExcCode != `Sys)
					begin
					IF_ID_Flush <= `ENABLE;
					ID_EX_Flush <= `ENABLE;
					EX_MEM_Flush <= `ENABLE;
					MEM_WB_Flush <= `ENABLE;			
					end
				end
			else if(syscall && ((CR_Status & ~(`Sys_MASK)) != 4'b0))	
				begin									
				CR_EPC <= PCPluse4 - 32'd4;		
				CR_Pre_Status <= CR_Status;
				CR_Status <= `All_MASK;
				CR_Cause <= `Sys;
				INT_ACK <= `DISABLE;
				CR_Read_Data <= CR_Exc_Vector;
				EPC_Selected <= `ENABLE;
				Data_Selected <= `DISABLE;
				IF_ID_Flush <= `ENABLE;
				ID_EX_Flush <= `ENABLE;
				EX_MEM_Flush <= `DISABLE;
				MEM_WB_Flush <= `DISABLE;		
				end
			else if(eret)		
				begin
				CR_EPC <= 32'b0;
				CR_Pre_Status <= 4'b0;
				CR_Status <= CR_Pre_Status;
				CR_Cause <= `Int;
				INT_ACK <= `DISABLE;
				CR_Read_Data <= CR_EPC;
				EPC_Selected <= `ENABLE;
				Data_Selected <= `DISABLE;
				IF_ID_Flush <= `ENABLE;
				ID_EX_Flush <= `ENABLE;		
				EX_MEM_Flush <= `DISABLE;
				MEM_WB_Flush <= `DISABLE;
				end
			else if(INT && ((CR_Status & ~(`Int_MASK)) != 4'b0))		
				begin
				CR_Pre_Status <= CR_Status;
				CR_Status <= `All_MASK;
				CR_Cause <= `Int;
				INT_ACK <= `ENABLE;
				CR_Read_Data <= CR_Exc_Vector;
				EPC_Selected <= `ENABLE;
				Data_Selected <= `DISABLE;
				IF_ID_Flush <= `ENABLE;
				ID_EX_Flush <= `ENABLE;
				if(!CR_Write)
					begin
					CR_EPC <= PCPluse4 - 32'd4;			
					EX_MEM_Flush <= `DISABLE;
					end
				else
					begin
					CR_EPC <= PCPluse4 - 4;
					EX_MEM_Flush <= `ENABLE;
					end
				MEM_WB_Flush <= `DISABLE;
				end
			else if(CR_Write)		
				begin
				case(CR_Addr)
					`CR_Addr_Cause:
						begin
						CR_Cause <= CR_Write_Data[3:2];
						end
					`CR_Addr_Status:
						begin
						CR_Pre_Status <= CR_Write_Data[7:4];
						CR_Status <= CR_Write_Data[3:0];
						end
					`CR_Addr_EPC:
						begin
						CR_EPC <= CR_Write_Data;
						end
					default:;
				endcase
				INT_ACK <= `DISABLE;
				CR_Read_Data <= 32'b0;
				EPC_Selected <= `DISABLE;
				Data_Selected <= `DISABLE;
				IF_ID_Flush <= `DISABLE;
				ID_EX_Flush <= `DISABLE;
				EX_MEM_Flush <= `DISABLE;
				MEM_WB_Flush <= `DISABLE;
				end
			else if(CR_Read)		
				begin
				case(CR_Addr)
					`CR_Addr_Cause:
						begin
						CR_Read_Data <= {28'b0, CR_Cause, 2'b0};
						end
					`CR_Addr_Status:
						begin
						CR_Read_Data <= {24'b0, CR_Pre_Status, CR_Status};
						end
					`CR_Addr_EPC:
						begin
						CR_Read_Data <= CR_EPC;
						end
					default:
						begin
						CR_Read_Data <= 32'b0;
						end
				endcase
				INT_ACK <= `DISABLE;
				EPC_Selected <= `DISABLE;
				Data_Selected <= `ENABLE;
				IF_ID_Flush <= `DISABLE;
				ID_EX_Flush <= `DISABLE;
				EX_MEM_Flush <= `DISABLE;
				MEM_WB_Flush <= `DISABLE;
				end
			else
				begin
				CR_Cause <= CR_Cause;
				CR_Status <= CR_Status;
				CR_Pre_Status <= CR_Pre_Status;
				CR_EPC <= CR_EPC;
				CR_Read_Data <= 32'b0;
				INT_ACK <= `DISABLE;
				EPC_Selected <= `DISABLE;
				Data_Selected <= `DISABLE;
				IF_ID_Flush <= `DISABLE;
				ID_EX_Flush <= `DISABLE;
				EX_MEM_Flush <= `DISABLE;
				MEM_WB_Flush <= `DISABLE;
				end
			end
		end
endmodule