module halfsubtractor(output d,b,input a,e);
xor XOR1(d,a,e);
not NOT1(c,a);
and AND(b,c,e);
endmodule

module fullsubtractor(output d,bout,input a,b,cin);
halfsubtractor h1(a1,b1,a,b);
halfsubtractor h2(d,c,a1,cin);
or OR1(bout,c,b1);
endmodule

module tb;
reg a,b,cin;
wire d,bout;
fullsubtractor f1(d,bout,a,b,cin);
integer count;
initial begin
for(count=0;count<8;count=count+1)
begin
{a,b,cin}=count;
#20;
end
end
endmodule

