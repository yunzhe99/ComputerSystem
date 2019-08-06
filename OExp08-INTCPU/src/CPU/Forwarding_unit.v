`include "Instruction_Define.v"
module Forwarding_unit(
						input [31:0] ID_EX_Instruction,
						input [31:0] EX_MEM_Instruction,
						input [31:0] MEM_WB_Instruction,
						
						output reg [1:0] ForwardA,
						output reg [1:0] ForwardB,
						output reg [1:0] ForwardC,
						output reg [1:0] ForwardD
						);
	
	always@(*)
		begin
		case(ID_EX_Instruction[31:26])
			`R_opcode,
			`jalr_opcode,
			`jr_opcode:
				begin
				case(ID_EX_Instruction[5:0])
					`sll_funct,
					`sra_funct,
					`srl_funct:
						ForwardA = 2'b00;
					default:
						begin
						case(EX_MEM_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(EX_MEM_Instruction[5:0])
									`jr_funct: ForwardA = 2'b00;		
									default:
										begin
										if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardA = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
																	ForwardA = 2'b01;
																else
																	ForwardA = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
																	ForwardA = 2'b01;
																else
																	ForwardA = 2'b00;
															end
														default: ForwardA = 2'b00;
													endcase
													end
												default: ForwardA = 2'b00;
											endcase
											end
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
									ForwardA = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardA = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												default: ForwardA = 2'b00;
											endcase
											end
										default: ForwardA = 2'b00;
									endcase
									end
								end
							`mfc0_opcode:
								begin
								case(EX_MEM_Instruction[25:21])
									`mfc0_rs:
										begin
										if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardA = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
																	ForwardA = 2'b01;
																else
																	ForwardA = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
																	ForwardA = 2'b01;
																else
																	ForwardA = 2'b00;
															end
														default: ForwardA = 2'b00;
													endcase
													end
												default: ForwardA = 2'b00;
											endcase
											end
										end
									default:
										begin
										case(MEM_WB_Instruction[31:26])
											`R_opcode,
											`jalr_opcode,
											`jr_opcode:
												begin
												case(MEM_WB_Instruction[5:0])
													`jr_funct: ForwardA = 2'b00;
													default:
														begin
															if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
																ForwardA = 2'b01;
															else
																ForwardA = 2'b00;
														end
												endcase
												end
											`addi_opcode,
											`addiu_opcode,
											`andi_opcode,
											`ori_opcode,
											`xori_opcode,
											`lui_opcode,
											`slti_opcode,
											`sltiu_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
											`lb_opcode,
											`lbu_opcode,
											`lh_opcode,
											`lhu_opcode,
											`lw_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
											`mfc0_opcode:
												begin
												case(MEM_WB_Instruction[25:21])
													`mfc0_rs:
														begin
															if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
																ForwardA = 2'b01;
															else
																ForwardA = 2'b00;
														end
													default: ForwardA = 2'b00;
												endcase
												end
											default: ForwardA = 2'b00;
										endcase
										end
								endcase
								end
							default:
								begin
								case(MEM_WB_Instruction[31:26])
									`R_opcode,
									`jalr_opcode,
									`jr_opcode:
										begin
										case(MEM_WB_Instruction[5:0])
											`jr_funct: ForwardA = 2'b00;
											default:
												begin
													if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
										endcase
										end
									`addi_opcode,
									`addiu_opcode,
									`andi_opcode,
									`ori_opcode,
									`xori_opcode,
									`lui_opcode,
									`slti_opcode,
									`sltiu_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`lb_opcode,
									`lbu_opcode,
									`lh_opcode,
									`lhu_opcode,
									`lw_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`mfc0_opcode:
										begin
										case(MEM_WB_Instruction[25:21])
											`mfc0_rs:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
											default: ForwardA = 2'b00;
										endcase
										end
									default: ForwardA = 2'b00;
								endcase
								end
						endcase
						end
				endcase
				end
			`addi_opcode,
			`addiu_opcode,
			`andi_opcode,
			`ori_opcode,
			`xori_opcode,
			`lui_opcode,
			`slti_opcode,
			`sltiu_opcode,
			`beq_opcode,
			`bgez_opcode,
			`bgtz_opcode,
			`blez_opcode,
			`bltz_opcode,
			`bne_opcode:
				begin
				case(EX_MEM_Instruction[31:26])
					`R_opcode,
					`jalr_opcode,
					`jr_opcode:
						begin
						case(EX_MEM_Instruction[5:0])
							`jr_funct: ForwardA = 2'b00;
							default:
								begin
								if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[25:21]))
									ForwardA = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardA = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												default: ForwardA = 2'b00;
											endcase
											end
										default: ForwardA = 2'b00;
									endcase
									end
								end
						endcase
						end
					`addi_opcode,
					`addiu_opcode,
					`andi_opcode,
					`ori_opcode,
					`xori_opcode,
					`lui_opcode,
					`slti_opcode,
					`sltiu_opcode:
						begin
						if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
							ForwardA = 2'b10;
						else
							begin
							case(MEM_WB_Instruction[31:26])
								`R_opcode,
								`jalr_opcode,
								`jr_opcode:
									begin
									case(MEM_WB_Instruction[5:0])
										`jr_funct: ForwardA = 2'b00;
										default:
											begin
												if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
									endcase
									end
								`addi_opcode,
								`addiu_opcode,
								`andi_opcode,
								`ori_opcode,
								`xori_opcode,
								`lui_opcode,
								`slti_opcode,
								`sltiu_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b01;
										else
											ForwardA = 2'b00;
									end
								`lb_opcode,
								`lbu_opcode,
								`lh_opcode,
								`lhu_opcode,
								`lw_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b01;
										else
											ForwardA = 2'b00;
									end
								`mfc0_opcode:
									begin
									case(MEM_WB_Instruction[25:21])
										`mfc0_rs:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										default: ForwardA = 2'b00;
									endcase
									end
								default: ForwardA = 2'b00;
							endcase
							end
						end
					`mfc0_opcode:
						begin
						case(EX_MEM_Instruction[25:21])
							`mfc0_rs:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
									ForwardA = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardA = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												default: ForwardA = 2'b00;
											endcase
											end
										default: ForwardA = 2'b00;
									endcase
									end
								end
							default:
								begin
								case(MEM_WB_Instruction[31:26])
									`R_opcode,
									`jalr_opcode,
									`jr_opcode:
										begin
										case(MEM_WB_Instruction[5:0])
											`jr_funct: ForwardA = 2'b00;
											default:
												begin
													if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
										endcase
										end
									`addi_opcode,
									`addiu_opcode,
									`andi_opcode,
									`ori_opcode,
									`xori_opcode,
									`lui_opcode,
									`slti_opcode,
									`sltiu_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`lb_opcode,
									`lbu_opcode,
									`lh_opcode,
									`lhu_opcode,
									`lw_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`mfc0_opcode:
										begin
										case(MEM_WB_Instruction[25:21])
											`mfc0_rs:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
											default: ForwardA = 2'b00;
										endcase
										end
									default: ForwardA = 2'b00;
								endcase
								end
						endcase
						end
					default:
						begin
						case(MEM_WB_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(MEM_WB_Instruction[5:0])
									`jr_funct: ForwardA = 2'b00;
									default:
										begin
											if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
										ForwardA = 2'b01;
									else
										ForwardA = 2'b00;
								end
							`lb_opcode,
							`lbu_opcode,
							`lh_opcode,
							`lhu_opcode,
							`lw_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
										ForwardA = 2'b01;
									else
										ForwardA = 2'b00;
								end
							`mfc0_opcode:
								begin
								case(MEM_WB_Instruction[25:21])
									`mfc0_rs:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									default: ForwardA = 2'b00;
								endcase
								end
							default: ForwardA = 2'b00;
						endcase
						end
				endcase
				end
			`lb_opcode,
			`lbu_opcode,
			`lh_opcode,
			`lhu_opcode,
			`lw_opcode,
			`sb_opcode,
			`sh_opcode,
			`sw_opcode:
				begin
				case(EX_MEM_Instruction[31:26])
					`R_opcode,
					`jalr_opcode,
					`jr_opcode:
						begin
						case(EX_MEM_Instruction[5:0])
							`jr_funct: ForwardA = 2'b00;
							default:
								begin
								if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[25:21]))
									ForwardA = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardA = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												default: ForwardA = 2'b00;
											endcase
											end
										default: ForwardA = 2'b00;
									endcase
									end
								end
						endcase
						end
					`addi_opcode,
					`addiu_opcode,
					`andi_opcode,
					`ori_opcode,
					`xori_opcode,
					`lui_opcode,
					`slti_opcode,
					`sltiu_opcode:
						begin
						if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
							ForwardA = 2'b10;
						else
							begin
							case(MEM_WB_Instruction[31:26])
								`R_opcode,
								`jalr_opcode,
								`jr_opcode:
									begin
									case(MEM_WB_Instruction[5:0])
										`jr_funct: ForwardA = 2'b00;
										default:
											begin
												if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
									endcase
									end
								`addi_opcode,
								`addiu_opcode,
								`andi_opcode,
								`ori_opcode,
								`xori_opcode,
								`lui_opcode,
								`slti_opcode,
								`sltiu_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b01;
										else
											ForwardA = 2'b00;
									end
								`lb_opcode,
								`lbu_opcode,
								`lh_opcode,
								`lhu_opcode,
								`lw_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
											ForwardA = 2'b01;
										else
											ForwardA = 2'b00;
									end
								`mfc0_opcode:
									begin
									case(MEM_WB_Instruction[25:21])
										`mfc0_rs:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										default: ForwardA = 2'b00;
									endcase
									end
								default: ForwardA = 2'b00;
							endcase
							end
						end
					`mfc0_opcode:
						begin
						case(EX_MEM_Instruction[25:21])
							`mfc0_rs:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[25:21]))
									ForwardA = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardA = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
													ForwardA = 2'b01;
												else
													ForwardA = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
															ForwardA = 2'b01;
														else
															ForwardA = 2'b00;
													end
												default: ForwardA = 2'b00;
											endcase
											end
										default: ForwardA = 2'b00;
									endcase
									end
								end
							default:
								begin
								case(MEM_WB_Instruction[31:26])
									`R_opcode,
									`jalr_opcode,
									`jr_opcode:
										begin
										case(MEM_WB_Instruction[5:0])
											`jr_funct: ForwardA = 2'b00;
											default:
												begin
													if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
										endcase
										end
									`addi_opcode,
									`addiu_opcode,
									`andi_opcode,
									`ori_opcode,
									`xori_opcode,
									`lui_opcode,
									`slti_opcode,
									`sltiu_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`lb_opcode,
									`lbu_opcode,
									`lh_opcode,
									`lhu_opcode,
									`lw_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									`mfc0_opcode:
										begin
										case(MEM_WB_Instruction[25:21])
											`mfc0_rs:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
														ForwardA = 2'b01;
													else
														ForwardA = 2'b00;
												end
											default: ForwardA = 2'b00;
										endcase
										end
									default: ForwardA = 2'b00;
								endcase
								end
						endcase
						end
					default:
						begin
						case(MEM_WB_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(MEM_WB_Instruction[5:0])
									`jr_funct: ForwardA = 2'b00;
									default:
										begin
											if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
										ForwardA = 2'b01;
									else
										ForwardA = 2'b00;
								end
							`lb_opcode,
							`lbu_opcode,
							`lh_opcode,
							`lhu_opcode,
							`lw_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
										ForwardA = 2'b01;
									else
										ForwardA = 2'b00;
								end
							`mfc0_opcode:
								begin
								case(MEM_WB_Instruction[25:21])
									`mfc0_rs:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[25:21]))
												ForwardA = 2'b01;
											else
												ForwardA = 2'b00;
										end
									default: ForwardA = 2'b00;
								endcase
								end
							default: ForwardA = 2'b00;
						endcase
						end
				endcase
				end
			default: ForwardA = 2'b00;
		endcase
		end
				
	always@(*)
		begin
		case(ID_EX_Instruction[31:26])
			`R_opcode,
			`jalr_opcode,
			`jr_opcode:
				begin
				case(ID_EX_Instruction[5:0])
					`jr_funct,
					`jalr_funct: ForwardB = 2'b00;
					default:
						begin
						case(EX_MEM_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(EX_MEM_Instruction[5:0])
									`jr_funct: ForwardB = 2'b00;
									default:
										begin
										if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[20:16]))
											ForwardB = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardB = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
														default: ForwardB = 2'b00;
													endcase
													end
												default: ForwardB = 2'b00; 
											endcase
											end
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
									ForwardB = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardB = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardB = 2'b01;
												else
													ForwardB = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardB = 2'b01;
												else
													ForwardB = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												default: ForwardB = 2'b00;
											endcase
											end
										default: ForwardB = 2'b00;
									endcase
									end
								end
							`mfc0_opcode:
								begin
								case(EX_MEM_Instruction[25:21])
									`mfc0_rs:
										begin
										if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardB = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardB = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
														default: ForwardB = 2'b00;
													endcase
													end
												default: ForwardB = 2'b00;
											endcase
											end
										end
									default:
										begin
										case(MEM_WB_Instruction[31:26])
											`R_opcode,
											`jalr_opcode,
											`jr_opcode:
												begin
												case(MEM_WB_Instruction[5:0])
													`jr_funct: ForwardB = 2'b00;
													default:
														begin
															if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																ForwardB = 2'b01;
															else
																ForwardB = 2'b00;
														end
												endcase
												end
											`addi_opcode,
											`addiu_opcode,
											`andi_opcode,
											`ori_opcode,
											`xori_opcode,
											`lui_opcode,
											`slti_opcode,
											`sltiu_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardB = 2'b01;
													else
														ForwardB = 2'b00;
												end
											`lb_opcode,
											`lbu_opcode,
											`lh_opcode,
											`lhu_opcode,
											`lw_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardB = 2'b01;
													else
														ForwardB = 2'b00;
												end
											`mfc0_opcode:
												begin
												case(MEM_WB_Instruction[25:21])
													`mfc0_rs:
														begin
															if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																ForwardB = 2'b01;
															else
																ForwardB = 2'b00;
														end
													default: ForwardB = 2'b00;
												endcase
												end
											default: ForwardB = 2'b00;
										endcase
										end
								endcase
								end
							default: ForwardB = 2'b00;
						endcase
						end
				endcase
				end
			`beq_opcode,
			`bne_opcode:
				begin
				case(ID_EX_Instruction[5:0])
					`jr_funct,
					`jalr_funct: ForwardB = 2'b00;
					default:
						begin
						case(EX_MEM_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(EX_MEM_Instruction[5:0])
									`jr_funct: ForwardB = 2'b00;
									default:
										begin
										if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[20:16]))
											ForwardB = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardB = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
														default: ForwardB = 2'b00;
													endcase
													end
												default: ForwardB = 2'b00;
											endcase
											end
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
									ForwardB = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardB = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardB = 2'b01;
												else
													ForwardB = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardB = 2'b01;
												else
													ForwardB = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												default: ForwardB = 2'b00; 
											endcase
											end
										default: ForwardB = 2'b00;
									endcase
									end
								end
							`mfc0_opcode:
								begin
								case(EX_MEM_Instruction[25:21])
									`mfc0_rs:
										begin
										if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardB = 2'b10;
										else
											begin
											case(MEM_WB_Instruction[31:26])
												`R_opcode,
												`jalr_opcode,
												`jr_opcode:
													begin
													case(MEM_WB_Instruction[5:0])
														`jr_funct: ForwardB = 2'b00;
														default:
															begin
																if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
													endcase
													end
												`addi_opcode,
												`addiu_opcode,
												`andi_opcode,
												`ori_opcode,
												`xori_opcode,
												`lui_opcode,
												`slti_opcode,
												`sltiu_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`lb_opcode,
												`lbu_opcode,
												`lh_opcode,
												`lhu_opcode,
												`lw_opcode:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardB = 2'b01;
														else
															ForwardB = 2'b00;
													end
												`mfc0_opcode:
													begin
													case(MEM_WB_Instruction[25:21])
														`mfc0_rs:
															begin
																if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																	ForwardB = 2'b01;
																else
																	ForwardB = 2'b00;
															end
														default: ForwardB = 2'b00;
													endcase
													end
												default: ForwardB = 2'b00;
											endcase
											end
										end
									default:
										begin
										case(MEM_WB_Instruction[31:26])
											`R_opcode,
											`jalr_opcode,
											`jr_opcode:
												begin
												case(MEM_WB_Instruction[5:0])
													`jr_funct: ForwardB = 2'b00;
													default:
														begin
															if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
																ForwardB = 2'b01;
															else
																ForwardB = 2'b00;
														end
												endcase
												end
											`addi_opcode,
											`addiu_opcode,
											`andi_opcode,
											`ori_opcode,
											`xori_opcode,
											`lui_opcode,
											`slti_opcode,
											`sltiu_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardB = 2'b01;
													else
														ForwardB = 2'b00;
												end
											`lb_opcode,
											`lbu_opcode,
											`lh_opcode,
											`lhu_opcode,
											`lw_opcode:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardB = 2'b01;
													else
														ForwardB = 2'b00;
												end
											`mfc0_opcode:
												begin
												case(MEM_WB_Instruction[25:21])
													`mfc0_rs:
														begin
															if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
																ForwardB = 2'b01;
															else
																ForwardB = 2'b00;
														end
													default: ForwardB = 2'b00;
												endcase
												end
											default: ForwardB = 2'b00;
										endcase
										end
								endcase
								end
							default: ForwardB = 2'b00;
						endcase
						end
				endcase
				end
			`addi_opcode,
			`addiu_opcode,
			`andi_opcode,
			`ori_opcode,
			`xori_opcode,
			`lui_opcode,
			`slti_opcode,
			`sltiu_opcode:
				ForwardB = 2'b00;
			`lb_opcode,
			`lbu_opcode,
			`lh_opcode,
			`lhu_opcode,
			`lw_opcode,
			`sb_opcode,
			`sh_opcode,
			`sw_opcode:
				ForwardB = 2'b00;
			default: ForwardB = 2'b00;
		endcase
		end
		
	always@(*)		// ForwardC store指令的专用旁路信号
		begin
		case(ID_EX_Instruction[31:26])
			`sb_opcode,
			`sh_opcode,
			`sw_opcode:
				begin
				case(EX_MEM_Instruction[31:26])
					`R_opcode,
					`jalr_opcode,
					`jr_opcode:
						begin
						case(EX_MEM_Instruction[5:0])
							`jr_funct: ForwardC = 2'b00;
							default:
								begin
								if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[20:16]))
									ForwardC = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardC = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardC = 2'b01;
														else
															ForwardC = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardC = 2'b01;
														else
															ForwardC = 2'b00;
													end
												default: ForwardC = 2'b00;
											endcase
											end
										default: ForwardC = 2'b00;
									endcase
									end
								end
						endcase
						end
					`addi_opcode,
					`addiu_opcode,
					`andi_opcode,
					`ori_opcode,
					`xori_opcode,
					`lui_opcode,
					`slti_opcode,
					`sltiu_opcode:
						begin
						if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
							ForwardC = 2'b10;
						else
							begin
							case(MEM_WB_Instruction[31:26])
								`R_opcode,
								`jalr_opcode,
								`jr_opcode:
								begin
									case(MEM_WB_Instruction[5:0])
										`jr_funct: ForwardC = 2'b00;
										default:
											begin
												if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
									endcase
									end
								`addi_opcode,
								`addiu_opcode,
								`andi_opcode,
								`ori_opcode,
								`xori_opcode,
								`lui_opcode,
								`slti_opcode,
								`sltiu_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardC = 2'b01;
										else
											ForwardC = 2'b00;
										end
								`lb_opcode,
								`lbu_opcode,
								`lh_opcode,
								`lhu_opcode,
								`lw_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardC = 2'b01;
										else
											ForwardC = 2'b00;
									end
								`mfc0_opcode:
									begin
									case(MEM_WB_Instruction[25:21])
										`mfc0_rs:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
										default: ForwardC = 2'b00;
									endcase
									end
								default: ForwardC = 2'b00;
							endcase
							end
						end
					`mfc0_opcode:
						begin
						case(EX_MEM_Instruction[25:21])
							`mfc0_rs:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
									ForwardC = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
										begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardC = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardC = 2'b01;
														else
															ForwardC = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardC = 2'b01;
												else
													ForwardC = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardC = 2'b01;
														else
															ForwardC = 2'b00;
													end
												default: ForwardC = 2'b00;
											endcase
											end
										default: ForwardC = 2'b00;
									endcase
									end
								end
							default:
								begin
								case(MEM_WB_Instruction[31:26])
									`R_opcode,
									`jalr_opcode,
									`jr_opcode:
									begin
										case(MEM_WB_Instruction[5:0])
											`jr_funct: ForwardC = 2'b00;
											default:
												begin
													if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
														ForwardC = 2'b01;
													else
														ForwardC = 2'b00;
												end
										endcase
										end
									`addi_opcode,
									`addiu_opcode,
									`andi_opcode,
									`ori_opcode,
									`xori_opcode,
									`lui_opcode,
									`slti_opcode,
									`sltiu_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
												ForwardC = 2'b01;
											else
												ForwardC = 2'b00;
										end
									`lb_opcode,
									`lbu_opcode,
									`lh_opcode,
									`lhu_opcode,
									`lw_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
												ForwardC = 2'b01;
											else
												ForwardC = 2'b00;
										end
									`mfc0_opcode:
										begin
										case(MEM_WB_Instruction[25:21])
											`mfc0_rs:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardC = 2'b01;
													else
														ForwardC = 2'b00;
												end
											default: ForwardC = 2'b00;
										endcase
										end
									default: ForwardC = 2'b00;
								endcase
								end
						endcase
						end
					default: ForwardC = 2'b00;
				endcase
				end
			default: ForwardC = 2'b00;
		endcase
		end
		
	always@(*)	
		begin
		case(ID_EX_Instruction[31:26])
			`mtc0_opcode:
				begin
				case(EX_MEM_Instruction[31:26])
					`R_opcode,
					`jalr_opcode,
					`jr_opcode:
						begin
						case(EX_MEM_Instruction[5:0])
							`jr_funct: ForwardD = 2'b00;
							default:
								begin
								if((EX_MEM_Instruction[15:11] != 5'd0) && (EX_MEM_Instruction[15:11] == ID_EX_Instruction[20:16]))
									ForwardD = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardD = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardD = 2'b01;
														else
															ForwardD = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardD = 2'b01;
														else
															ForwardD = 2'b00;
													end
												default: ForwardD = 2'b00;
											endcase
											end
										default: ForwardD = 2'b00;
									endcase
									end
								end
						endcase
						end
					`addi_opcode,
					`addiu_opcode,
					`andi_opcode,
					`ori_opcode,
					`xori_opcode,
					`lui_opcode,
					`slti_opcode,
					`sltiu_opcode:
						begin
						if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
							ForwardD = 2'b10;
						else
							begin
							case(MEM_WB_Instruction[31:26])
								`R_opcode,
								`jalr_opcode,
								`jr_opcode:
									begin
									case(MEM_WB_Instruction[5:0])
										`jr_funct: ForwardD = 2'b00; 
										default:
											begin
												if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
									endcase
									end
								`addi_opcode,
								`addiu_opcode,
								`andi_opcode,
								`ori_opcode,
								`xori_opcode,
								`lui_opcode,
								`slti_opcode,
								`sltiu_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardD = 2'b01;
										else
											ForwardD = 2'b00;
									end
								`lb_opcode,
								`lbu_opcode,
								`lh_opcode,
								`lhu_opcode,
								`lw_opcode:
									begin
										if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
											ForwardD = 2'b01;
										else
											ForwardD = 2'b00;
									end
								`mfc0_opcode:
									begin
									case(MEM_WB_Instruction[25:21])
										`mfc0_rs:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
										default: ForwardD = 2'b00;
									endcase
									end
								default: ForwardD = 2'b00;
							endcase
							end
						end
					`mfc0_opcode:
						begin
						case(EX_MEM_Instruction[25:21])
							`mfc0_rs:
								begin
								if((EX_MEM_Instruction[20:16] != 5'd0) && (EX_MEM_Instruction[20:16] == ID_EX_Instruction[20:16]))
									ForwardD = 2'b10;
								else
									begin
									case(MEM_WB_Instruction[31:26])
										`R_opcode,
										`jalr_opcode,
										`jr_opcode:
											begin
											case(MEM_WB_Instruction[5:0])
												`jr_funct: ForwardD = 2'b00;
												default:
													begin
														if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
															ForwardD = 2'b01;
														else
															ForwardD = 2'b00;
													end
											endcase
											end
										`addi_opcode,
										`addiu_opcode,
										`andi_opcode,
										`ori_opcode,
										`xori_opcode,
										`lui_opcode,
										`slti_opcode,
										`sltiu_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
										`lb_opcode,
										`lbu_opcode,
										`lh_opcode,
										`lhu_opcode,
										`lw_opcode:
											begin
												if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
													ForwardD = 2'b01;
												else
													ForwardD = 2'b00;
											end
										`mfc0_opcode:
											begin
											case(MEM_WB_Instruction[25:21])
												`mfc0_rs:
													begin
														if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
															ForwardD = 2'b01;
														else
															ForwardD = 2'b00;
													end
												default: ForwardD = 2'b00;
											endcase
											end
										default: ForwardD = 2'b00;
									endcase
									end
								end
							default:
								begin
								case(MEM_WB_Instruction[31:26])
									`R_opcode,
									`jalr_opcode,
									`jr_opcode:
										begin
										case(MEM_WB_Instruction[5:0])
											`jr_funct: ForwardD = 2'b00;
											default:
												begin
													if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
														ForwardD = 2'b01;
													else
														ForwardD = 2'b00;
												end
										endcase
										end
									`addi_opcode,
									`addiu_opcode,
									`andi_opcode,
									`ori_opcode,
									`xori_opcode,
									`lui_opcode,
									`slti_opcode,
									`sltiu_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
												ForwardD = 2'b01;
											else
												ForwardD = 2'b00;
										end
									`lb_opcode,
									`lbu_opcode,
									`lh_opcode,
									`lhu_opcode,
									`lw_opcode:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
												ForwardD = 2'b01;
											else
												ForwardD = 2'b00;
										end
									`mfc0_opcode:
										begin
										case(MEM_WB_Instruction[25:21])
											`mfc0_rs:
												begin
													if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
														ForwardD = 2'b01;
													else
														ForwardD = 2'b00;
												end
											default: ForwardD = 2'b00;
										endcase
										end
									default: ForwardD = 2'b00;
								endcase
								end
						endcase
						end
					default:
						begin
						case(MEM_WB_Instruction[31:26])
							`R_opcode,
							`jalr_opcode,
							`jr_opcode:
								begin
								case(MEM_WB_Instruction[5:0])
									`jr_funct: ForwardD = 2'b00;
									default:
										begin
											if((MEM_WB_Instruction[15:11] != 5'd0) && (MEM_WB_Instruction[15:11] == ID_EX_Instruction[20:16]))
												ForwardD = 2'b01;
											else
												ForwardD = 2'b00;
										end
								endcase
								end
							`addi_opcode,
							`addiu_opcode,
							`andi_opcode,
							`ori_opcode,
							`xori_opcode,
							`lui_opcode,
							`slti_opcode,
							`sltiu_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
										ForwardD = 2'b01;
									else
										ForwardD = 2'b00;
								end
							`lb_opcode,
							`lbu_opcode,
							`lh_opcode,
							`lhu_opcode,
							`lw_opcode:
								begin
									if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
										ForwardD = 2'b01;
									else
										ForwardD = 2'b00;
								end
							`mfc0_opcode:
								begin
								case(MEM_WB_Instruction[25:21])
									`mfc0_rs:
										begin
											if((MEM_WB_Instruction[20:16] != 5'd0) && (MEM_WB_Instruction[20:16] == ID_EX_Instruction[20:16]))
												ForwardD = 2'b01;
											else
												ForwardD = 2'b00;
										end
									default: ForwardD = 2'b00;
								endcase
								end
							default: ForwardD = 2'b00;
						endcase
						end
				endcase
				end
			default: ForwardD = 2'b00;
		endcase
		end
endmodule		