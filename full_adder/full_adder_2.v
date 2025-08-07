module full_adder(input a,
                  input b,
                  input cin,
                  output sum,
                  output cout);
  wire w1,w2,w3;
  xor xor1(w1,a,b);
  and and1(w2,a,b);
  and and2(w3,w1,cin);
  xor xor2(sum,w1,cin);
  or  or1(cout,w3,w2);
endmodule