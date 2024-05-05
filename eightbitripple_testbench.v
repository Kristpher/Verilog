module eightbitripple_testbench;

reg [7:0]a,b;

wire [7:0] s;

wire cout;

eightbitripple f1(s,cout,a,b);

integer count;

initial begin

for ( count=0;count<65536;count=count+1)

begin

{a,b}=count;

#20;

end

end

endmodule
 