module bcd_to_excess(output [3:0]y,input [3:0]S);

wire a,b,c,d,e,f,g,h,i,j,k;

wire[3:0]z;

not NOT1(a,S[0]);

not NOT2 (b,S[1]);

not NOT3(c,S[2]);

not NOT4(d,S[3]); 


and AND1(e,S[1],S[2]);

and AND2(f,S[1],S[3]);

and AND3(g,b,S[2]);

and AND4(h,b,S[3]);

and AND5(i,S[1],c,d);

and AND6(j,S[2],S[3]);

and AND7(k,c,d);


or OR1(z[0],S[0],e,f);

or OR2(z[1],g,h,i);

or OR3(z[2],j,k);


not NOT5(z[3],S[3]);

wire m,n,o;

and AND8 (m,S[3],S[2]);

and AND9(n,S[3],S[1]);

or OR4(o,m,n);

mux m1(y[0],S[0],o);

mux m2(y[1],S[1],o);

mux m3(y[2],S[2],o);

mux m4(y[3],S[3],o);

endmodule



module mux(output y,input a,b);

wire a1,b1,c1;

not(a1,b);

and(b1,a,a1);

and(c1,1'bx,b);

or(y,c1,b1);

endmodule

module bcd_to_excess_testbench;

reg [3:0]s;

wire [3:0]y;

bcd_to_excess b1(y,s);

integer count;

initial begin

for(count=0;count<16;count=count+1)

begin
 
{s}=count;

#20;

end

end

endmodule

