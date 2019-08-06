//R-TYPE-FUNCT
`define FUNCT_ADD  6'h20
`define FUNCT_ADDU 6'h21
`define FUNCT_SUB  6'h22
`define FUNCT_SUBU 6'h23
`define FUNCT_SLL  6'h0
`define FUNCT_SRL  6'h2
`define FUNCT_SRA  6'h3
`define FUNCT_SLLV 6'h4
`define FUNCT_SRLV 6'h6
`define FUNCT_SRAV 6'h7
`define FUNCT_AND  6'h24
`define FUNCT_OR   6'h25
`define FUNCT_XOR  6'h26
`define FUNCT_NOR  6'h27
`define FUNCT_SLT  6'h2a
`define FUNCT_SLTU 6'h2b
`define FUNCT_JALR 6'h9
`define FUNCT_JR   6'h8

//OP
`define ADDI  6'h8
`define ADDIU 6'h9
`define ANDI  6'hc
`define ORI   6'hd
`define XORI  6'he
`define LUI   6'hf
`define SLTI  6'ha
`define SLTIU 6'hb

`define BEQ   6'h4
`define BNE   6'h5
`define BLEZ  6'h6
`define BGTZ  6'h7
`define BLTZ  6'h1 //rt=0
`define BGEZ  6'h1 //rt=1

`define J     6'h2
`define JAL   6'h3

`define LB    6'h20
`define LBU   6'h24
`define LH    6'h21
`define LHU   6'h25
`define LW    6'h23
`define SB    6'h28
`define SH    6'h29
`define SW    6'h2b