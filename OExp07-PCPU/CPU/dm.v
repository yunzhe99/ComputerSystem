module dm_4k( addr, be, din, DMWr, clk, dout ) ;
    input   [11:2]  addr ;  // address bus
    input   [3:0]   be ;    // byte enables
    input   [31:0]  din ;   // 32-bit input data
    input   [0:0]   DMWr ;    // memory write enable
    input           clk ;   // clock
    output  [31:0]  dout ;  // 32-bit memory output

    reg [31:0]  DMem[1023:0];
    
    reg [31:0]din_val;
	
	  always@(posedge clk)
	    begin
		  if(DMWr)
		    begin
		      if(be==15)
		        begin
		          DMem[addr]=din;
		        end
		      else if(be==3)
		        begin
		          DMem[addr][15:0]=din[15:0];
		        end
		      else if(be==12)
		        begin
		          DMem[addr][31:16]=din[15:0];
		        end
		      else if(be==1)
		        begin
		          DMem[addr][7:0]=din[7:0];
		        end		      
		      else if(be==2)
		        begin
		          DMem[addr][15:8]=din[7:0];
		        end		      
		      else if(be==4)
		        begin
		          DMem[addr][23:16]=din[7:0];
		        end
		      else if(be==8)
		        begin
		          DMem[addr][31:24]=din[7:0];
		        end
			  end
	    end
	  assign dout = DMem[addr];
endmodule