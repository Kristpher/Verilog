module two_way_trafficlight(input reset,clk,output reg ew,ns );
reg [1:0]count;

always@(posedge clk,posedge reset)
begin
if(reset)
begin
ew<=1'b1;
ns<=1'b0;
count<=2'b00;
end
else
begin
if(count==2'b10 )
begin

ew<=~ew;
ns<=~ns;
count<=2'b00;
end
else
begin
count<=count+1;
end
end
end
endmodule

module tb;
reg reset,clk;
wire ew,ns;
two_way_trafficlight t1(.reset(reset),.clk(clk),.ew(ew),.ns(ns));
initial begin
clk=0;
forever #5 clk=~clk;
end

initial fork
reset=1;
#10 reset=0;
#200 $finish;
join
endmodule