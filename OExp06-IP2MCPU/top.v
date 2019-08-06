`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:20 03/19/2019 
// Design Name: 
// Module Name:    top 
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
                                                                                                                             module top(
input clk_100mhz,
input RSTN,
input [3:0]BTN_y,
input [4:0]BTN_x,
input [15:0]SW,
output readn,
output led_clk,
output led_sout,
output LED_PEN,
output led_clrn,
output seg_clk,
output seg_sout,
output SEG_PEN,
output seg_clrn,
output CR


    );
wire V5=1;
wire N0=0;	 
wire[15:0]SW_OK;
wire[31:0]Div;
wire[7:0] point_out;
wire[31:0]Disp_num;
wire[7:0]LE_out;
wire[0:0]RDY;
wire[31:0]PC;
wire[31:0] CNT;
wire[3:0]BTN_OK;
wire[7:0]blink;
		

wire[31:0]inst;
wire[31:0]Data_in;
wire[31:0]Addr_out;
wire[31:0]Data_out;
wire[31:0]Key_out;
wire[31:0]ram_data_in;
wire[31:0]ram_data_out;
wire[31:0]Counter_out;
wire[31:0]Peripheral_in;
wire[9:0]ram_addr;
wire[0:0]GPIOf0000000_we;
wire[0:0]GPIOe0000000_we;

mips U1( 
.clk(Clk_CPU), 
.rst(rst), 
.MIO_ready(), 
.inst_in(inst[31:0]), 
.Data_in(Data_in[31:0]),
.mem_w(mem_w), 
.PC_out(PC), 
.Addr_out(Addr_out[31:0]), 
.Data_out(Data_out[31:0]), 
.CPU_MIO(), 
.INT(counter0_out));
	

MIO_BUS U4( 
.clk(clk_100mhz), 
.rst(rst), 
.BTN(BTN_OK[3:0]), 
.SW(SW_OK[15:0]), 
.mem_w(mem_w),
.Cpu_data2bus(Data_out[31:0]), 
.addr_bus(Addr_out[31:0]), 
.ram_data_out(ram_data_out[31:0]), 
.led_out(LED_out[15:0]), 
.counter_out(Counter_out[31:0]),
.counter0_out(counter0_out), 
.counter1_out(counter1_out), 
.counter2_out(counter2_out), 
.Cpu_data4bus(Data_in[31:0]), 
.ram_data_in(ram_data_in[31:0]),
.ram_addr(ram_addr), 
.data_ram_we(data_ram_we), 
.GPIOf0000000_we(GPIOf0000000_we), 
.GPIOe0000000_we(GPIOe0000000_we),
.counter_we(counter_we), 
.Peripheral_in(Peripheral_in[31:0]));




	
SEnter_2_32 M4(
.clk(clk_100mhz),
.BTN(BTN_OK[2:0]),  
.Ctrl({SW_OK[7:5],SW_OK[15],SW_OK[0]}), 
.D_ready(RDY), 
.Din(Key_out[4:0]),  
.readn(readn),
.Ai(),
.Bi(),
.blink(blink[7:0]));
						  
						  
Multi_8CH32 U5 (
  .clk(~Clk_CPU),  
  .rst(rst),  
  .EN(GPIOe0000000_we),  
  .Test(SW_OK[7:5]),  
  .point_in({Div[31:0],Div[31:0]}),
  .LES({64'b0}),  
  .Data0(Peripheral_in[31:0]),  
  .data1({N0,N0,PC[31:2]}),  
  .data2(inst[31:0]),  
  .data3(Counter_out[31:0]),
  .data4(Addr_out[31:0]),  
  .data5(Data_out[31:0]),  
  .data6(Data_in[31:0]),  
  .data7(PC[31:0]),  
  .point_out(point_out),
  .LE_out(LE_out),  
  .Disp_num(Disp_num[31:0])  
);

SSeg7_Dev U6(
.clk(clk_100mhz),
.rst(rst),
.Start(Div[20]),
.SW0(SW_OK[0]),
.flash(Div[25]),
.Hexs(Disp_num[31:0]),
.point(point_out[7:0]),
.LES(LE_out[7:0]),
.seg_clk(seg_clk),
.seg_sout(seg_sout),
.SEG_PEN(SEG_PEN),
.seg_clrn(seg_clrn));



	 
	 
 
ROM_D U2(.a(PC[11:2]),.spo(inst[31:0]));





wire[3:0]Pulse;
SAnti_jitter U9(    .clk(clk_100mhz),
					.RSTN(RSTN),
					.readn(readn),
					.Key_y(BTN_y[3:0]),
					.Key_x(BTN_x[4:0]),
					.SW(SW[15:0]),
					.Key_out(Key_out[4:0]),
					.Key_ready(RDY),
					.pulse_out(Pulse[3:0]),
					.BTN_OK(BTN_OK[3:0]),
					.SW_OK(SW_OK[15:0]),
					.CR(CR),
					.rst(rst)
				);



wire[1:0]counter_set;
wire[15:0]LED_out;
wire[13:0]GPIOf0;
SPIO U7(
    .clk(~Clk_CPU),
    .rst(rst),
    .EN(GPIOf0000000_we),
    .Start(Div[20]),
    .P_Data(Peripheral_in[31:0]),
    .counter_set(counter_set[1:0]),
    .LED_out(LED_out[15:0]),
    .GPIOf0(GPIOf0[13:0]),
    .led_clk(led_clk),
    .led_sout(led_sout),
    .LED_PEN(LED_PEN),
    .led_clrn(led_clrn)    
);


clk_div U8(
	.clk(clk_100mhz),
	.rst(rst),
	.SW2(SW_OK[2]),
	.clkdiv(Div[31:0]),
	.Clk_CPU(Clk_CPU)
	);



RAM_B U3(
	.addra(ram_addr[9:0]),
	.wea(data_ram_we),
	.dina(ram_data_in[31:0]),
	.clka(clk_100mhz),
	.douta(ram_data_out[31:0])
	);

Counter_x U10(
 .clk(~Clk_CPU), 
 .rst(rst), 
 .clk0(Div[6]), 
 .clk1(Div[9]), 
 .clk2(Div[11]),
 .counter_we(counter_we), 
 .counter_val(Peripheral_in), 
 .counter_ch(counter_set), 
 .counter0_OUT(counter0_out), 
 .counter1_OUT(counter1_out),
 .counter2_OUT(counter2_out), 
 .counter_out(Counter_out));
 
endmodule
