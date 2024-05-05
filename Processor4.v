module Processor4 (
    input  clk,
    input  [2:0] read_p_1,
    input  [2:0] read_p_2,
    input  [2:0] write_p,
    input  [7:0] write_data,
    input  w,r2,r1,reset,
    output reg [7:0] read_data1,
    output reg [7:0] read_data2
);
integer i;
reg [7:0] register[0:7];

always @(posedge clk or posedge reset) begin
    if (reset)
		begin
for(i=0;i<8;i=i+1)
register[i]=8'b0;
end
else
begin
 if(w)begin
        register[write_p] <= write_data;
    end
    if(r1 || r2) begin
if(r1 && read_p_1!=write_p)
    read_data1 <= register[read_p_1];
if(r2 && read_p_2!=write_p)
    read_data2 <= register[read_p_2];
end
end
end
endmodule



module tb;

reg clk;
reg [2:0] read_p_1, read_p_2, write_p;
reg [7:0] write_data;
reg w,r1,r2,reset;
wire [7:0] read_data_1, read_data_2;

Processor4 e (clk,read_p_1,read_p_2,write_p,write_data,w,r2,r1,reset,read_data_1,read_data_2
 
);

initial begin
clk=1;
forever #5 clk=~clk;
end

initial begin
r1=0;r2=0;w=0;
reset=1;
read_p_1=3;read_p_2=5;write_p=1;
write_data=0;  
#10 reset=0;w=1;write_p=0;write_data=$random;
#10 w=1;write_p=2;write_data=$random;
#10 r1=1;read_p_1=1;
#10 r2=1;read_p_2=2;
#10 w=1;write_p=4;write_data=$random;
#10 w=1;write_p=7;write_data=$random;
#10 w=1;write_p=6;write_data=$random;
#10 w=1;write_p=3;write_data=$random;
#10 r1=1;read_p_1=7;
#10 r2=1;read_p_2=4;
#10 r1=1;read_p_1=6;
#10 r2=1;read_p_2=3;
#10 r2=0;r1=0;
#10 w=1;write_p=1;write_data=$random;
#10 w=1;write_p=2;write_data=$random;
#10 w=1;write_p=3;write_data=$random;
#10 w=1;write_p=4;write_data=$random;
#10 r1=1;read_p_1=3;
#10 r2=1;read_p_2=2;
#10 r1=1;read_p_1=1;
#10 r2=1;read_p_2=4;
#10 $finish;
   
end
endmodule