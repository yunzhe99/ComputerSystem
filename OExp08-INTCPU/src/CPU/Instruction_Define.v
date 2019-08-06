//R-type
`define R_opcode 6'h0

`define add_funct 6'h20
`define addu_funct 6'h21
`define sub_funct 6'h22
`define subu_funct 6'h23
`define sll_funct 6'h0
`define sllv_funct 6'h4
`define sra_funct 6'h3
`define srav_funct 6'h7
`define srl_funct 6'h2
`define srlv_funct 6'h6
`define and_funct 6'h24
`define or_funct 6'h25
`define xor_funct 6'h26
`define nor_funct 6'h27
`define slt_funct 6'h2a
`define sltu_funct 6'h2b

// I-type
`define addi_opcode 6'h8
`define addiu_opcode 6'h9
`define andi_opcode 6'hc
`define ori_opcode 6'hd
`define xori_opcode 6'he
`define lui_opcode 6'hf
`define slti_opcode 6'ha
`define sltiu_opcode 6'hb
`define beq_opcode 6'h4
`define bgez_opcode 6'h1
`define bgtz_opcode 6'h7
`define blez_opcode 6'h6
`define bltz_opcode 6'h1
`define bne_opcode 6'h5

// Mem
`define lb_opcode 6'h20
`define lbu_opcode 6'h24
`define lh_opcode 6'h21
`define lhu_opcode 6'h25
`define lw_opcode 6'h23
`define sb_opcode 6'h28
`define sh_opcode 6'h29
`define sw_opcode 6'h2b

// Jump
`define j_opcode 6'h2
`define jal_opcode 6'h3
`define jalr_opcode 6'h0
`define jalr_funct 6'h9
`define jr_opcode 6'h0
`define jr_funct 6'h8



//syscall
`define syscall_opcode 6'h0
`define syscall_funct 6'hc

//eret
`define eret_opcode 6'h10
`define eret_rs 5'h10
`define eret_funct 6'h18

//mtc0
`define mtc0_opcode 6'h10
`define mtc0_rs 5'h4

//mfc0
`define mfc0_opcode 6'h10
`define mfc0_rs 5'h0