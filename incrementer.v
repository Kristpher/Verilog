module andgate(output c,input a,b);
wire k;
nand nand1(k,a,b);
nand nand2(c,k,k);
endmodule

module orgate(output c,input a,b);
wire h;
nor nor1(h,a,b);
nor nor2(c,h,h);
endmodule

module notgate(output i,input a);
nand nand2(i,a,a);
endmodule

module xorgate(output c, input a,b);
wire d,e,f,g;
notgate n1(d,a);
notgate n2(e,b);
andgate a1(f,e,a);
andgate a2(g,d,b);
orgate o1(c,g,f);
endmodule

module halfadder(output s,c,input a,b);
xorgate x1(s,a,b);
andgate a3(c,a,b);
endmodule


module incrementer(output [3:0]s,output cout,input [3:0]a);
wire [2:0]c;
halfadder h0(s[0],c[0],a[0],1);
halfadder h1(s[1],c[1],a[1],c[0]);
halfadder h2(s[2],c[2],a[2],c[1]);
halfadder h3(s[3],cout,a[3],c[2]);
endmodule


module incrementer_test;
reg [3:0]a;
wire [3:0]s;
wire cout;
incrementer p1(s,cout,a);
integer count;
initial begin
for(count=0;count<16;count=count+1)
begin
{a}=count;
#20;
end
end
endmodule

