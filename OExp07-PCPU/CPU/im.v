module im_4k( addr, dout ) ;
    input   [11:2]  addr ;  // address bus
    output  [31:0]  dout ;  // 32-bit memory output
    reg[31:0] IMout_o1;
	
	reg [31:0]  IMem[1023:0];
	always@(addr)
	begin
		IMout_o1 = IMem[addr];	
	end
	assign dout = IMout_o1;
endmodule


	