module notgate(output a,input b);
nand nand1(a,b,b);
endmodule

module four_bit_negator(output [3:0]o,input[3:0]a);
notgate n1(o[0],a[0]);
notgate n2(o[1],a[1]);
notgate n3(o[2],a[2]);
notgate n4(o[3],a[3]);
endmodule


module test;
reg [3:0]a;
wire [3:0]g;
four_bit_negator n1(g,a);
integer count;
initial begin
for(count=0;count<16;count=count+1)
begin
{a}=count;
#20;
end
end
endmodule
