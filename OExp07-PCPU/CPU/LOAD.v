`include "define.v"
`include "defines.v"
module LOAD_EXT(OP, be, DR_out, load_out);
  input [5:0]OP;
  input [3:0]be;
  input [31:0]DR_out;
  output reg[31:0]load_out;
  
  always@(OP or DR_out or be)
  begin
    if(OP==`LW)
      begin
        load_out=DR_out;
      end
    else if(OP==`LH)
      begin
        if(be==4'h3)
          begin
            load_out[15:0]=DR_out[15:0];
          end
        else if(be==4'hc)
          begin
            load_out[15:0]=DR_out[31:16];
          end
        load_out[31:16]=(load_out[15]==1)?16'hffff:16'h0;
      end
    else if(OP==`LHU)
      begin
        if(be==4'h3)
          begin
            load_out={16'h0,DR_out[15:0]};
          end
        else if(be==4'hc)
          begin
            load_out={16'h0,DR_out[31:16]};
          end
      end
    else if(OP==`LB)
      begin
        if(be==1)
          begin
            load_out[7:0]=DR_out[7:0];
          end
        else if(be==2)
          begin
            load_out[7:0]=DR_out[15:8];
          end
        else if(be==4)
          begin
            load_out[7:0]=DR_out[23:16];
          end
        else if(be==8)
          begin
            load_out[7:0]=DR_out[31:24];
          end
        load_out[31:8]=(load_out[7]==1)?24'hffffff:24'h0;
      end
    else if(OP==`LBU)
      begin
        if(be==1)
          begin
            load_out={24'h0,DR_out[7:0]};
          end
        else if(be==2)
          begin
            load_out={24'h0,DR_out[15:8]};
          end
        else if(be==4)
          begin
            load_out={24'h0,DR_out[23:16]};
          end
        else if(be==8)
          begin
            load_out={24'h0,DR_out[31:24]};
          end
      end
    end
  endmodule
