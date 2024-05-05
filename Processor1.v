module Processor1(input [15:0]data,input reset,clk,reg_write,output reg[15:0] out,output reg reg_read);
	reg [15:0]mid=16'b0;
	always@(posedge clk,posedge reset)
		begin
			if(reset)
				begin
					out<=16'b0;
				end
			else
				begin
					reg_read=~reg_write;
					if(reg_write==1)
						begin
							reg_read=~reg_write;
							mid<=data;
						end
					else
						begin
							reg_read=~reg_write;
							out<=mid;
						end
				end
			end
endmodule


module tb;
reg [15:0]data;
reg reset,clk,reg_write;
wire [15:0]out;
wire reg_read;
Processor1 q(data,reset,clk,reg_write,out,reg_read);
initial begin
 clk=1;
 forever #5 clk=~clk ;
 end
 
 initial begin
 reset=1;
 data=16'b0;
 #10 reset=0;data=16'b0010100100110011;reg_write=1;
 #10 reg_write=0;
 #10 data=16'b0001000100110011;reg_write=1;
 #10 reg_write=0;
 #10 data=16'b1000100011110011;reg_write=1;
  #10 reg_write=0;
 #30 $finish;
end
endmodule
