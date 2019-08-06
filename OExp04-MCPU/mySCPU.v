`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:29 04/02/2019 
// Design Name: 
// Module Name:    mySCPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mySCPU(
    input clk,
    input reset,
    input [31:0] inst_in,
    input MIO_ready,
    input [31:0] Data_in,
    input INT,
    output mem_w,
    output [31:0] PC_out,
    output [31:0] Addr_out,
    output [31:0] Data_out,
    output CPU_MIO
    );
	 
	 mips myscpu(
		.clk(clk),
		.rst_n(reset),
		.inst_in(inst_in),
		.MIO_ready(MIO_ready),
		.Data_in(Data_in),
		.INT(INT),
		.mem_w(mem_w),
		.PC_out(PC_out),
		.Addr_out(Addr_out),
		.Data_out(Data_out),
		.CPU_MIO(CPU_MIO)
		);
	 


endmodule
