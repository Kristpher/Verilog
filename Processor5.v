module Processor5(input[63:0] in1,in2,input r,w,clk,reset,input[4:0] read_port1,read_port2,read_port3,read_port4,write_port,write_port2,
output reg[63:0] out1,out2,out3,out4);
	reg [63:0]register[0:31];
  	integer count;
	always@(posedge clk or posedge reset)begin
		if(reset)begin
		
			for(count=0;count<32;count=count+1)
				register[count]=64'b0;
		end
		else begin
			if(w) begin 
				register[write_port]<=in1;
			   register[write_port2]<=in2;
				end
			else begin
				if(r)
				begin
					out1<=register[read_port1];
				
					out2<=register[read_port2];
				
					out3<=register[read_port3];
				
					out4<=register[read_port4];
					end
			end
		end
	end
endmodule

module tb;
reg r,w ,clk, reset;
    reg [4:0] read_port1, read_port2, read_port3, read_port4, write_port, write_port2;
    reg [63:0] in1, in2;
    wire [63:0] out1, out2, out3, out4;
Processor5 st( in1,in2, r,w,clk,reset, read_port1,read_port2,read_port3,read_port4,write_port,write_port2,out1,out2,out3,out4);
    initial begin
	 clk=1;
	 forever #5 clk = ~clk;
	 end
    initial begin
      
        reset = 1;
        r=0;
        w = 0;
        read_port1 = 0; read_port2 = 1; read_port3 = 2; read_port4 = 3; write_port = 4; write_port2 = 5;
        in1 = 0; in2 = 0;
        #10 reset = 0;
        #10 w = 1; write_port = 0; in1 = $random;
        #10 r = 1; read_port1 = 0;
        #10 w = 1; write_port = 1; in1 =$random;
        #10 r = 1; read_port2 = 1;
        #10 w = 1; write_port = 2; in1 =$random;
        #10 r = 1; read_port3 = 2;
        #10 w = 1; write_port = 3; in1 =$random;
        #10 r = 1; read_port4 = 3;
        #10 w = 1; write_port = 4; in1 =$random;
        #10 w = 1; write_port2 = 5; in2 =$random;
        #10 r = 1; 
        #10 w = 1; write_port = 6; in1 =$random;
        #10 w = 1; write_port2 = 7; in2 = $random;
      
        #10 $finish;
    end
endmodule