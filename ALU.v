module ALU(output [15:0]out,input [15:0]a,b,input [3:0]s);
wire [15:0]sum,diff1,diff2,zr,on,neo,diff3,diff4,o1,o2,o3,o4,o5,o6,o7,o8;
adder add1(sum,a,b);
subtractor ss1(diff1,a,b);
subtractor ss2(diff2,b,a);
zero zz1(zr);
one on1(on);
negone ne1(neo);
subtractor ss3(diff3,16'b0,a);
subtractor ss4(diff4,16'b0,b);
neg neg1(o1,a);
neg neg2(o2,b);
inc i1(o3,a);
inc i2(o4,b);
dec dd1(o5,a);
dec dd2(o6,b);
andop an1(o7,a,b);
oroutput oro1(o8,a,b);
mux m161(out,s,sum,diff1,diff2,zr,on,neo,diff3,diff4,o1,o2,o3,o4,o5,o6,o7,o8);
endmodule

module andfive(output op,input a,b,c,d,e);
wire p,q,r;
andgate a0(p,a,b);
andgate a1(q,p,c);
andgate a2(r,q,d);
andgate a3(op,r,e);
endmodule

module orsix(output op,input i1,i2,i3,i4,i5,i6,i7,i8,j1,j2,j3,j4,j5,j6,j7,j8);
wire a,b,c,d,e,f,g,h,i,j,k,l,m,n;
orgate o0(a,i1,i2);
orgate o1(b,a,i3);
orgate o2(c,b,i4);
orgate o3(d,c,i5);
orgate o4(e,d,i6);
orgate o5(f,e,i7);
orgate o6(g,f,i8);
orgate o7(h,g,j1);
orgate o8(i,h,j2);
orgate o9(j,i,j3);
orgate o10(k,j,j4);
orgate o11(l,k,j5);
orgate o12(m,l,j6);
orgate o13(n,m,j7);
orgate o14(op,n,j8);
endmodule

module mux(output [15:0]o,input [3:0]s,input [15:0]a,b,c,d,e,f,g,h,i,j,k,l,m,n,p,q);
wire [15:0]qw,aw,zw,sw,xw,cw,dw,ew,rw,fw,vw,tw,gw,bw,yw,hw;
notgate n11(a0,s[0]);
notgate n12(a1,s[1]);
notgate n13(a2,s[2]);
notgate n14(a3,s[3]);
sumux su10(qw,a,a3,a2,a1,a0);
sumux su11(aw,b,a3,a2,a1,s[0]);
sumux su12(zw,c,a3,a2,s[1],a0);
sumux su13(sw,d,a3,a2,s[1],s[0]);
sumux su14(cw,e,a3,s[2],a1,a0);
sumux su15(dw,f,a3,s[2],a1,s[0]);
sumux su16(ew,g,a3,s[2],s[1],a0);
sumux su17(rw,h,a3,s[2],s[1],s[0]);
sumux su18(fw,i,s[3],a2,a1,a0);
sumux su19(vw,j,s[3],a2,a1,s[0]);
sumux su110(tw,k,s[3],a2,s[1],a0);
sumux su111(gw,l,s[3],a2,s[1],s[0]);
sumux su112(bw,m,s[3],s[2],a1,a0);
sumux su113(yw,n,s[3],s[2],a1,s[0]);
sumux su114(hw,p,s[3],s[2],s[1],a0);
sumux su115(xw,q,s[3],s[2],s[1],s[0]);

orsix rr0(o[0],qw[0],aw[0],zw[0],sw[0],cw[0],dw[0],ew[0],rw[0],fw[0],vw[0],tw[0],gw[0],bw[0],yw[0],hw[0],xw[0]);
orsix rr1(o[1],qw[1],aw[1],zw[1],sw[1],cw[1],dw[1],ew[1],rw[1],fw[1],vw[1],tw[1],gw[1],bw[1],yw[1],hw[1],xw[1]);
orsix rr2(o[2],qw[2],aw[2],zw[2],sw[2],cw[2],dw[2],ew[2],rw[2],fw[2],vw[2],tw[2],gw[2],bw[2],yw[2],hw[2],xw[2]);
orsix rr3(o[3],qw[3],aw[3],zw[3],sw[3],cw[3],dw[3],ew[3],rw[3],fw[3],vw[3],tw[3],gw[3],bw[3],yw[3],hw[3],xw[3]);
orsix rr4(o[4],qw[4],aw[4],zw[4],sw[4],cw[4],dw[4],ew[4],rw[4],fw[4],vw[4],tw[4],gw[4],bw[4],yw[4],hw[4],xw[4]);
orsix rr5(o[5],qw[5],aw[5],zw[5],sw[5],cw[5],dw[5],ew[5],rw[5],fw[5],vw[5],tw[5],gw[5],bw[5],yw[5],hw[5],xw[5]);
orsix rr6(o[6],qw[6],aw[6],zw[6],sw[6],cw[6],dw[6],ew[6],rw[6],fw[6],vw[6],tw[6],gw[6],bw[6],yw[6],hw[6],xw[6]);
orsix rr7(o[7],qw[7],aw[7],zw[7],sw[7],cw[7],dw[7],ew[7],rw[7],fw[7],vw[7],tw[7],gw[7],bw[7],yw[7],hw[7],xw[7]);
orsix rr8(o[8],qw[8],aw[8],zw[8],sw[8],cw[8],dw[8],ew[8],rw[8],fw[8],vw[8],tw[8],gw[8],bw[8],yw[8],hw[8],xw[8]);
orsix rr9(o[9],qw[9],aw[9],zw[9],sw[9],cw[9],dw[9],ew[9],rw[9],fw[9],vw[9],tw[9],gw[9],bw[9],yw[9],hw[9],xw[9]);
orsix rr10(o[10],qw[10],aw[10],zw[10],sw[10],cw[10],dw[10],ew[10],rw[10],fw[10],vw[10],tw[10],gw[10],bw[10],yw[10],hw[10],xw[10]);
orsix rr11(o[11],qw[11],aw[11],zw[11],sw[11],cw[11],dw[11],ew[11],rw[11],fw[11],vw[11],tw[11],gw[11],bw[11],yw[11],hw[11],xw[11]);
orsix rr12(o[12],qw[12],aw[12],zw[12],sw[12],cw[12],dw[12],ew[12],rw[12],fw[12],vw[12],tw[12],gw[12],bw[12],yw[12],hw[12],xw[12]);
orsix rr13(o[13],qw[13],aw[13],zw[13],sw[13],cw[13],dw[13],ew[13],rw[13],fw[13],vw[13],tw[13],gw[13],bw[13],yw[13],hw[13],xw[13]);
orsix rr14(o[14],qw[14],aw[14],zw[14],sw[14],cw[14],dw[14],ew[14],rw[14],fw[14],vw[14],tw[14],gw[14],bw[14],yw[14],hw[14],xw[14]);
orsix rr15(o[15],qw[15],aw[15],zw[15],sw[15],cw[15],dw[15],ew[15],rw[15],fw[15],vw[15],tw[15],gw[15],bw[15],yw[15],hw[15],xw[15]);

endmodule


module sumux(output [15:0]s,input [15:0]a,input b,c,d,e);
andfive q0(s[0],a[0],b,c,d,e);
  andfive q1(s[1],a[1],b,c,d,e);
  andfive q2(s[2],a[2],b,c,d,e);
  andfive q3(s[3],a[3],b,c,d,e);
  andfive q14(s[4],a[4],b,c,d,e);
  andfive q15(s[5],a[5],b,c,d,e);
  andfive q16(s[6],a[6],b,c,d,e);
  andfive q17(s[7],a[7],b,c,d,e);
andfive q18(s[8],a[8],b,c,d,e);
andfive q19(s[9],a[9],b,c,d,e);
andfive q10(s[10],a[10],b,c,d,e);
andfive q11(s[11],a[11],b,c,d,e);
andfive q112(s[12],a[12],b,c,d,e);
andfive q113(s[13],a[13],b,c,d,e);
andfive q114(s[14],a[14],b,c,d,e);
andfive q115(s[15],a[15],b,c,d,e);
endmodule


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

module halfsubtractor(output d,b,input a,e);
xorgate XOR1(d,a,e);
notgate NOT1(c,a);
andgate AND(b,c,e);
endmodule

module fullsubtractor(output d,bout,input a,b,cin);
halfsubtractor h1(a1,b1,a,b);
halfsubtractor h2(d,c,a1,cin);
or OR2(bout,c,b1);
endmodule


module fulladder(output s,c ,input a,b,cin);
wire a1,b1,c1;
halfadder h1(a1,b1,a,b);
halfadder h2(s,c1,a1,cin);
orgate o133(c,c1,b1);
endmodule

module inc(output [15:0]s,input [15:0]a);
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

module adder(output [15:0] s,input [15:0] a,b);
wire [14:0] carry;
wire cout;
fulladder f1(s[0],carry[0],a[0],b[0],0);
fulladder f2(s[1],carry[1],a[1],b[1],carry[0]);
fulladder f3(s[2],carry[2],a[2],b[2],carry[1]);
fulladder f4(s[3],carry[3],a[3],b[3],carry[2]);
fulladder f5(s[4],carry[4],a[4],b[4],carry[3]);
fulladder f6(s[5],carry[5],a[5],b[5],carry[4]);
fulladder f7(s[6],carry[6],a[6],b[6],carry[5]);
fulladder f8(s[7],carry[7],a[7],b[7],carry[6]);
fulladder f9(s[8],carry[8],a[8],b[8],carry[7]);
fulladder f10(s[9],carry[9],a[9],b[9],carry[8]);
fulladder f11(s[10],carry[10],a[10],b[10],carry[9]);
fulladder f12(s[11],carry[11],a[11],b[11],carry[10]);
fulladder f13(s[12],carry[12],a[12],b[12],carry[11]);
fulladder f14(s[13],carry[13],a[13],b[13],carry[12]);
fulladder f15(s[14],carry[14],a[14],b[14],carry[13]);
fulladder f16(s[15],cout,a[15],b[15],carry[14]);
endmodule

module subtractor (output [15:0] s,input [15:0] a,b);
wire [14:0] carry;
wire cout;

fullsubtractor sa1(s[0],carry[0],a[0],b[0],0);
fullsubtractor sa2(s[1],carry[1],a[1],b[1],carry[0]);
fullsubtractor sa3(s[2],carry[2],a[2],b[2],carry[1]);
fullsubtractor sa4(s[3],carry[3],a[3],b[3],carry[2]);
fullsubtractor sa5(s[4],carry[4],a[4],b[4],carry[3]);
fullsubtractor sa6(s[5],carry[5],a[5],b[5],carry[4]);
fullsubtractor sa7(s[6],carry[6],a[6],b[6],carry[5]);
fullsubtractor sa8(s[7],carry[7],a[7],b[7],carry[6]);
fullsubtractor sa9(s[8],carry[8],a[8],b[8],carry[7]);
fullsubtractor sa10(s[9],carry[9],a[9],b[9],carry[8]);
fullsubtractor sa11(s[10],carry[10],a[10],b[10],carry[9]);
fullsubtractor sa12(s[11],carry[11],a[11],b[11],carry[10]);
fullsubtractor sa13(s[12],carry[12],a[12],b[12],carry[11]);
fullsubtractor sa14(s[13],carry[13],a[13],b[13],carry[12]);
fullsubtractor sa15(s[14],carry[14],a[14],b[14],carry[13]);
fullsubtractor sa16(s[15],cout,a[15],b[15],carry[14]);
endmodule

module zero(output [15:0]i);

	nand(i[0],1,1);
	nand(i[1],1,1);
	nand(i[2],1,1);
	nand(i[3],1,1);
	nand(i[4],1,1);
	nand(i[5],1,1);
	nand(i[6],1,1);
	nand(i[7],1,1);
	nand(i[8],1,1);
	nand(i[9],1,1);
	nand(i[10],1,1);
	nand(i[11],1,1);
	nand(i[12],1,1);
	nand(i[13],1,1);
	nand(i[14],1,1);
	nand(i[15],1,1);


endmodule

module one(output [15:0]i);

nand(i[0],0,0);
	nand(i[1],1,1);
	nand(i[2],1,1);
	nand(i[3],1,1);
	nand(i[4],1,1);
	nand(i[5],1,1);
	nand(i[6],1,1);
	nand(i[7],1,1);
	nand(i[8],1,1);
	nand(i[9],1,1);
	nand(i[10],1,1);
	nand(i[11],1,1);
	nand(i[12],1,1);
	nand(i[13],1,1);
	nand(i[14],1,1);
	nand(i[15],1,1);

endmodule

module negone(output [15:0]i);
nand(i[0],0,0);
	nand(i[1],0,0);
	nand(i[2],0,0);
	nand(i[3],0,0);
	nand(i[4],0,0);
	nand(i[5],0,0);
	nand(i[6],0,0);
	nand(i[7],0,0);
	nand(i[8],0,0);
	nand(i[9],0,0);
	nand(i[10],0,0);
	nand(i[11],0,0);
	nand(i[12],0,0);
	nand(i[13],0,0);
	nand(i[14],0,0);
	nand(i[15],0,0);

endmodule

module dec(output [15:0]s,input [15:0]a);
  wire [14:0]carry;
  wire cout;
fulladder f110(s[0],carry[0],a[0],1,0);
fulladder f21(s[1],carry[1],a[1],1,carry[0]);
fulladder f31(s[2],carry[2],a[2],1,carry[1]);
fulladder f41(s[3],carry[3],a[3],1,carry[2]);
fulladder f51(s[4],carry[4],a[4],1,carry[3]);
fulladder f61(s[5],carry[5],a[5],1,carry[4]);
fulladder f71(s[6],carry[6],a[6],1,carry[5]);
fulladder f81(s[7],carry[7],a[7],1,carry[6]);
fulladder f91(s[8],carry[8],a[8],1,carry[7]);
fulladder f101(s[9],carry[9],a[9],1,carry[8]);
fulladder f111(s[10],carry[10],a[10],1,carry[9]);
fulladder f121(s[11],carry[11],a[11],1,carry[10]);
fulladder f131(s[12],carry[12],a[12],1,carry[11]);
fulladder f141(s[13],carry[13],a[13],1,carry[12]);
fulladder f151(s[14],carry[14],a[14],1,carry[13]);
fulladder f161(s[15],cout,a[15],1,carry[14]);

endmodule

module neg (output [15:0]o,input[15:0]a);
notgate n1(o[0],a[0]);
notgate n2(o[1],a[1]);
notgate n3(o[2],a[2]);
notgate n4(o[3],a[3]);
notgate n5(o[4],a[4]);
notgate n6(o[5],a[5]);
notgate a7(o[6],a[6]);
notgate a8(o[7],a[7]);
notgate a9(o[8],a[8]);
notgate a10(o[9],a[9]);
notgate a11(o[10],a[10]);
notgate a12(o[11],a[11]);
notgate a13(o[12],a[12]);
notgate a14(o[13],a[13]);
notgate a15(o[14],a[14]);
notgate a16(o[15],a[15]);

endmodule


module andop(output [15:0]s,input [15:0]a,b);

andgate aa0(s[0],a[0],b[0]);
andgate aa1(s[1],a[1],b[1]);
andgate aa2(s[2],a[2],b[2]);
andgate aa3(s[3],a[3],b[3]);
andgate aa4(s[4],a[4],b[4]);
andgate aa5(s[5],a[5],b[5]);
andgate aa6(s[6],a[6],b[6]);
andgate aa7(s[7],a[7],b[7]);
andgate aa8(s[8],a[8],b[8]);
andgate aa9(s[9],a[9],b[9]);
andgate aa10(s[10],a[10],b[10]);
andgate aa11(s[11],a[11],b[11]);
andgate aa12(s[12],a[12],b[12]);
andgate aa13(s[13],a[13],b[13]);
andgate aa14(s[14],a[14],b[14]);
andgate aa15(s[15],a[15],b[15]);
endmodule

module oroutput(output[15:0]s,input[15:0]a,b);
orgate oo0(s[0],a[0],b[0]);
orgate oo1(s[1],a[1],b[1]);
orgate oo2(s[2],a[2],b[2]);
orgate oo3(s[3],a[3],b[3]);
orgate oo4(s[4],a[4],b[4]);
orgate oo5(s[5],a[5],b[5]);
orgate oo6(s[6],a[6],b[6]);
orgate oo07(s[7],a[7],b[7]);
orgate oo08(s[8],a[8],b[8]);
orgate oo09(s[9],a[9],b[9]);
orgate oo010(s[10],a[10],b[10]);
orgate oo011(s[11],a[11],b[11]);
orgate oo012(s[12],a[12],b[12]);
orgate oo013(s[13],a[13],b[13]);
orgate oo014(s[14],a[14],b[14]);
orgate oo015(s[15],a[15],b[15]);
endmodule


module alu_test;
  reg [15:0]a,b;
  reg[3:0]s;
  wire [15:0]out;
  ALU hi(out,a,b,s);
integer count;
initial begin
  a=64;
  b=32;
  for(count=0;count<16;count=count+1)
begin
  {s}=count;
#20;
 end
end
endmodule