`include "define.v"
`include "defines.v"
module BE(ALUout_o, OP, be);
  input [31:0]ALUout_o;
  input [5:0]OP;
  output reg[3:0]be;
  
  always@(ALUout_o or OP)
  begin
    if(OP==`SW || OP==`LW)
      begin
        be=4'hf;
      end
    else if(OP==`SH || OP==`LH || OP==`LHU)
      begin
        if(ALUout_o[1]==0)
          begin
            be=4'h3;
          end
        else if(ALUout_o[1]==1)
          begin
            be=4'hc;
          end
        end
      else if(OP==`SB || OP==`LB || OP==`LBU)
        begin
          if(ALUout_o[1:0]==0)
            begin
              be=4'h1;
            end
          else if(ALUout_o[1:0]==1)
            begin
              be=4'h2;
            end
          else if(ALUout_o[1:0]==2)
            begin
              be=4'h4;
            end
          else if(ALUout_o[1:0]==3)
            begin
              be=4'h8;
            end
        end
      end
    endmodule