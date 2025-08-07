module rca(a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,c0);
  input a0,a1,a2,a3,b0,b1,b2,b3;
  input cin;
  output s0,s1,s2,s3;
  output c0;
  wire c1,c2,c3;
  fa aa1(.a(a0),.b(b0),.c(cin),.s(s0),.ca(c1));
  fa aa2(.a(a1),.b(b1),.c(c1),.s(s1),.ca(c2));
  fa aa3(.a(a2),.b(b2),.c(c2),.s(s2),.ca(c3));
  fa aa4(.a(a3),.b(b3),.c(c3),.s(s3),.ca(c0));
endmodule
  
    module fa(input a,
             input b,
             input c,
             output s,
              output ca);
   wire x,y,z;
      xor xor1(x,a,b);
      and and1(y,a,b);
      xor xor2(s,x,c);
      and and2(z,x,c);
      or or1(ca,z,y);
    endmodule
      
