
module Processor3 #(parameter n=16)
(input clk,read,write,reset ,input [n-1:0] in, output reg [n-1:0] out);
	initial out<=0;
	reg [n-1:0]mid=0;
	always @(posedge clk or posedge reset) begin
		if(reset)
			mid<=0;
		else
			begin
				if (read && ~write)
					out<=mid;
				if (write && ~read)
					mid=in;
				if(read && write)begin
					mid=in;
					out<=mid;
				end
			end
		end
endmodule

module tb;
parameter n=16;
reg clk,read,write,reset;
reg [n-1:0]in;
wire [n-1:0]out;
Processor3 b(clk,read,write,reset,in,out);
initial begin
clk=1;
forever #5 clk=!clk;
end
initial begin
read=0; write=1; reset=1;in=16'b0;
#10 reset=0;read=0;write=1; in=$random;
#10 read=1;write=0; in=$random;
#10 read=0;write=1; in=$random;
#10 read=1;write=0; in=$random;
#10 read=0;write=1; in=$random;
#10 read=1;write=1; in=$random;
#10 read=0;write=0; in=$random;
#10 read=1;write=1; in=$random;
#10 read=1;write=0; in=$random;
#10 read=0;write=1; in=$random;
#10 $finish;
end
endmodule
