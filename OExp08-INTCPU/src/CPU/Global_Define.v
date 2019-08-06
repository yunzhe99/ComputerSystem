`define DISABLE			1'b0
`define ENABLE			1'b1

`define StoreWord 		2'd0
`define StoreHalfWord 	2'd1
`define StoreByte		2'd2

`define LoadWord		3'd0
`define LoadHalfWord	3'd1
`define LoadHalfWordU	3'd2
`define LoadByte		3'd3
`define LoadByteU		3'd4

`define LogicEXT		2'd0
`define ArithmeticEXT	2'd1
`define LUIEXT			2'd2

`define Sequence		2'd0
`define Branch			2'd1
`define NotBranch		2'd2
`define Jump			2'd3

/******** For COPR0 *******/
// CR_Addr
`define CR_Addr_Cause	5'd12
`define CR_Addr_Status	5'd13
`define CR_Addr_EPC		5'd14

// ExeCode
`define Int				2'd0
`define Sys				2'd1
`define Unimpl			2'd2
`define Ov				2'd3

// Status
`define None_MASK		4'b1111
`define Int_MASK		4'b1110
`define Sys_MASK		4'b1101
`define Unimpl_MASK		4'b1011
`define Ov_MASK			4'b0111
`define All_MASK		4'b0000