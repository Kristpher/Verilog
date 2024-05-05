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

module eight_bit_ripple_adder(output [7:0] s,output cout,input [7:0] a,b);

wire [6:0] carry;

fulladder f1(s[0],carry[0],a[0],b[0],0);

fulladder f2(s[1],carry[1],a[1],b[1],carry[0]);

fulladder f3(s[2],carry[2],a[2],b[2],carry[1]);

fulladder f4(s[3],carry[3],a[3],b[3],carry[2]);

fulladder f5(s[4],carry[4],a[4],b[4],carry[3]);

fulladder f6(s[5],carry[5],a[5],b[5],carry[4]);

fulladder f7(s[6],carry[6],a[6],b[6],carry[5]);

fulladder f8(s[7],cout,a[7],b[7],carry[6]);

endmodule

module tb;

reg [7:0]a,b;

wire [7:0] s;

wire cout;

eight_bit_ripple_adder f1(s,cout,a,b);

integer count;

initial begin

for ( count=0;count<65536;count=count+1)

begin

{a,b}=count;

#20;

end

end

endmodule
 