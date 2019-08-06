module mux(
  s,y,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15
  );
  parameter number=2,sigwid=1,width=32,width_y=32;
    input [width-1:0]d0;
    input [width-1:0]d1;
    input [width-1:0]d2;
    input [width-1:0]d3;
    input [width-1:0]d4;
    input [width-1:0]d5;
    input [width-1:0]d6;
    input [width-1:0]d7;
    input [width-1:0]d8;
    input [width-1:0]d9;
    input [width-1:0]d10;
    input [width-1:0]d11;
    input [width-1:0]d12;
    input [width-1:0]d13;
    input [width-1:0]d14;
    input [width-1:0]d15;
    input [sigwid-1:0]s;
    output reg [width_y-1:0]y;
  always@(s or d0 or d1 or d2 or d3 or d3 or d4 or d5 or d6 or d7 or d8 or d9 or d10 or d11 or d12 or d13 or d14 or d15)
  begin
    if(number==2)
      begin
      if(s==0)
        y=d0;
      else if(s==1)
        y=d1;
      end  
    else if(number==4)
      begin
      if(s==0)
        y=d0;
      else if(s==1)
        y=d1;
      else if(s==2)
        y=d2;
      else if(s==3)
        y=d3;
      end  
    else if(number==8)
      begin
      if(s==0)
        y=d0;
      else if(s==1)
        y=d1;
      else if(s==2)
        y=d2;
      else if(s==3)
        y=d3;
      else if(s==4)
        y=d4;
      else if(s==5)
        y=d5;
      else if(s==6)
        y=d6;
      else if(s==7)
        y=d7;
      end
    else if(number==16)
      begin
      if(s==0)
        y=d0;
      else if(s==1)
        y=d1;
      else if(s==2)
        y=d2;
      else if(s==3)
        y=d3;
      else if(s==4)
        y=d4;
      else if(s==5)
        y=d5;
      else if(s==6)
        y=d6;
      else if(s==7)
        y=d7;
      else if(s==8)
        y=d8;
      else if(s==9)
        y=d9;
      else if(s==10)
        y=d10;
      else if(s==11)
        y=d11;
      else if(s==12)
        y=d12;
      else if(s==13)
        y=d13;
      else if(s==14)
        y=d14;
      else if(s==15)
        y=d15;
      end
  end
endmodule
