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

module four_bit_ripple_adder(output [3:0] s,output cout,input [3:0] a,b);
wire [2:0] carry;
fulladder f1(s[0],carry[0],a[0],b[0],0);

fulladder f2(s[1],carry[1],a[1],b[1],carry[0]);

fulladder f3(s[2],carry[2],a[2],b[2],carry[1]);

fulladder f4(s[3],cout,a[3],b[3],carry[2]);

endmodule
module tb;

reg [3:0]a,b;

wire [3:0] s;

wire cout;

four_bit_ripple_adder f1(s,cout,a,b);

integer count;

initial begin

for ( count=0;count<256;count=count+1)

begin

{a,b}=count;

#20;

end

end

endmodule
 