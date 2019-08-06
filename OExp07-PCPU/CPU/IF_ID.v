module IF_ID(
  input clk,
  input Flush,
  input IF_ID_Write,
  input [31:0]PC_NEXT_in,
  input [31:0]instruction_in,
  output [31:0]PC_NEXT_out,
  output [31:0]instruction_out
);
  
  reg [31:0]PC_NEXT;
  reg [31:0]instruction;
  always@( posedge clk)
    begin
      if(IF_ID_Write==0)
        begin
        end
		else if(Flush==1)
			begin
				PC_NEXT=0;
				instruction=0;				
			end
      else
        begin
        PC_NEXT=PC_NEXT_in;
        instruction=instruction_in;
        end
    end
  assign PC_NEXT_out=PC_NEXT;
  assign instruction_out=instruction;
endmodule
      
  


