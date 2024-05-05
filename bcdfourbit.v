module halfadder(output sum,carry ,input a,b);

xor XOR1(sum,a,b);

and AND1(carry,a,b);

endmodule

module fulladder(output s,cout,input a,b,cin);

wire a1,b1,c1;

halfadder h1(a1,b1,a,b);

halfadder h2(s,c1,a1,cin);

or OR1(cout,c1,b1);

endmodule

module fourbitadder(output [3:0] s,output cout,input [3:0] a,b);

wire [2:0] carry;

fulladder f1(s[0],carry[0],a[0],b[0],0);

fulladder f2(s[1],carry[1],a[1],b[1],carry[0]);

fulladder f3(s[2],carry[2],a[2],b[2],carry[1]);

fulladder f4(s[3],cout,a[3],b[3],carry[2]);

endmodule

module mux(output y,input a,b);

wire a1,b1,c1;

not(a1,b);

and(b1,a,a1);

and(c1,1'bx,b);

or(y,c1,b1);

endmodule

module bcd(output [3:0]y,input[3:0]S);

wire m,n,o;

and AND8 (m,S[3],S[2]);

and AND9(n,S[3],S[1]);

or OR4(o,m,n);

endmodule

module bcdfourbit(output [7:0] sum, input [3:0]a,b);

wire [3:0]s;

wire [2:0] carry;

wire[3:0]y;

wire[3:0]z,w,v;

wire c,a1,b1,c1;

fourbitadder(s,c,a,b);

and AND2(a1,s[3],s[2]);

and AND3(b1,s[3],s[1]);

or OR2(cout1,c,a1,b1);

fulladder f1(y[0],carry[0],s[0],0,0);

fulladder f2(y[1],carry[1],s[1],cout1,carry[0]);

fulladder f3(y[2],carry[2],s[2],cout1,carry[1]);

fulladder f4(y[3],c1,s[3],0,carry[2]);

bcd(z,a);

bcd(w,b);

or OR5(v,z,w);

mux m1(sum[0],y[0],v);

mux m2(sum[1],y[1],v);

mux m3(sum[2],y[2],v);

mux m4(sum[3],y[3],v);

mux m5(sum[4],cout1,v);

mux m6(sum[5],0,v);

mux m7(sum[6],0,v);

mux m8(sum[7],0,v);

endmodule

module bcdfourbit_testbench;

reg [3:0]a,b;

wire [7:0] s;

bcdfourbit f1(s,a,b);

integer count;

initial begin

for ( count=0;count<256;count=count+1)

begin

{a,b}=count;

#20;

end

end

endmodule
 