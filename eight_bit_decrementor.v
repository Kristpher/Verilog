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

module fulladder(output s,c ,input a,b,cin);
wire a1,b1,c1;
halfadder h1(a1,b1,a,b);
halfadder h2(s,c1,a1,cin);
orgate o1(c,c1,b1);
endmodule
module eight_bit_decrementor(output [15:0]s,input [15:0]a);
  wire [14:0]carry;
  wire cout;
fulladder f1(s[0],carry[0],a[0],1,0);
fulladder f2(s[1],carry[1],a[1],1,carry[0]);
fulladder f3(s[2],carry[2],a[2],1,carry[1]);
fulladder f4(s[3],carry[3],a[3],1,carry[2]);
fulladder f5(s[4],carry[4],a[4],1,carry[3]);
fulladder f6(s[5],carry[5],a[5],1,carry[4]);
fulladder f7(s[6],carry[6],a[6],1,carry[5]);
fulladder f8(s[7],carry[7],a[7],1,carry[6]);
fulladder f9(s[8],carry[8],a[8],1,carry[7]);
fulladder f10(s[9],carry[9],a[9],1,carry[8]);
fulladder f11(s[10],carry[10],a[10],1,carry[9]);
fulladder f12(s[11],carry[11],a[11],1,carry[10]);
fulladder f13(s[12],carry[12],a[12],1,carry[11]);
fulladder f14(s[13],carry[13],a[13],1,carry[12]);
fulladder f15(s[14],carry[14],a[14],1,carry[13]);
fulladder f16(s[15],cout,a[15],1,carry[14]);

endmodule

module tb;
reg [15:0]a;
wire [15:0]s;
eight_bit_decrementor p1(s,a);
integer count;
initial begin
for(count=0;count<65536;count=count+1)
begin
{a}=count;
#20;
end
end
endmodule