module andgate(output c,input a,b);
wire k;
nand nand1(k,a,b);
nand nand2(c,k,k);
endmodule

module srlatch(output q, qnot, input e, s, r);
    wire   s1;
    wire   r1;
   
   andgate a1(s1, e, s);
   andgate b1(r1, e, r);  
   nor n1(qnot, s1, q);
   nor n2(q, r1, qnot);
   endmodule

   module test;
reg e,s,r;
wire q,qnot;
srlatch l(q,qnot,e,s,r);
integer count;
initial begin
for(count=0;count<8;count=count+1)
begin
{e,s,r}=count;
#20;
end
end
endmodule