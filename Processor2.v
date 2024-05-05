module Processor2(input [15:0]data1,data2,input reset,clk,reg_write1,reg_write2,output reg[15:0] out,output reg reg_read);
	reg [3:0]count=0;
	reg [15:0]mid=16'b0;
	reg [1:0]a;
	always@(posedge clk,posedge reset)
		begin
			if(reset)
				begin
					out<=16'b0;
				end
			else
				begin
					if(count==0 && reg_write1==1)
						begin
							a<=reg_write1;
							reg_read=0;
							mid<=data1;
						end
					if(count==2 && reg_write2==1)
						begin
							a<=reg_write2;
							reg_read=0;	
							mid<=data2;
						end
					if(count==1)
						begin
							reg_read<=a;
							out<=mid;
						end
					if(count==3)
						begin
							reg_read<=a;
							out<=mid;
							count=-1;
						end

					count=count+1;

				end
		end
endmodule


module tb;
reg [15:0]data1,data2;
reg reset,clk,reg_write1,reg_write2;
wire [15:0]out;
wire reg_read;
Processor2 q(data1,data2,reset,clk,reg_write1,reg_write2,out,reg_read);
initial begin
 clk=1;
 forever #5 clk=~clk ;
 end
 
 initial begin
 reset=1;
 data1=16'b0;
 data2=16'b0;
 #10 reset=0;data1=16'b0010100100110011;reg_write1=1;data2=16'b0010100100111111;reg_write2=0;
 #10 reg_write1=0;reg_write2=1;
 #10 data1=16'b0001000100110011;reg_write1=0;data2=16'b0010100000000011;reg_write2=1;
 #10 reg_write1=0;reg_write2=0;
 #10 data1=16'b1000100011110011;reg_write1=0;data2=16'b1000100100110000;reg_write2=1;
  #10 reg_write1=1;reg_write2=1;
   #10 data1=16'b0101000100110011;reg_write1=1;data2=16'b0111110100110011;reg_write2=1;
 #10 reg_write1=1;reg_write2=0;
    #10 data1=16'b0101001100110011;reg_write1=0;data2=16'b0111011101110011;reg_write2=1;
 #10 reg_write1=0;reg_write2=1;
 #30 $finish;
end
endmodule
