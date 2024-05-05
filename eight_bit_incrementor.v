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

module eight_bit_incrementor(output [15:0]s,input [15:0]a);
wire [14:0]c;
  wire cout;
halfadder h0(s[0],c[0],a[0],1);
halfadder h1(s[1],c[1],a[1],c[0]);
halfadder h2(s[2],c[2],a[2],c[1]);
halfadder h3(s[3],c[3],a[3],c[2]);
halfadder h4(s[4],c[4],a[4],c[3]);
halfadder h5(s[5],c[5],a[5],c[4]);
halfadder h6(s[6],c[6],a[6],c[5]);
halfadder h7(s[7],c[7],a[7],c[6]);
halfadder h8(s[8],c[8],a[8],c[7]);
halfadder h9(s[9],c[9],a[9],c[8]);
halfadder h10(s[10],c[10],a[10],c[9]);
halfadder h11(s[11],c[11],a[11],c[10]);
halfadder h12(s[12],c[12],a[12],c[11]);
halfadder h13(s[13],c[13],a[13],c[12]);
halfadder h14(s[14],c[14],a[14],c[13]);
halfadder h15(s[15],cout,a[15],c[14]);
endmodule

module tb;
reg [15:0]a;
wire [15:0]s;

eight_bit_incrementor p1(s,a);
integer count;
initial begin
for(count=0;count<65536;count=count+1)
begin
{a}=count;
#20;
end
end
endmodule


