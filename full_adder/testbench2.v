module full_adder_tb;
  reg a,b,cin,w1,w2,w3;
  wire sum,cout;

 //instantiate the design with testbench
  full_adder fa1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
 //dumping the values of design into testbench
  initial begin
  $dumpfile("full_adder.vcd");
  $dumpvars(1,full_adder_tb);
  end
  //Entering the values
  initial begin
    $monitor("mtime %d a=%d b=%d cin=%d sum=%d cout=%d",$time,a,b,cin,sum,cout);
    a=0;b=0;cin=0;#4

     a=0;b=0;cin=1;#4

     a=0;b=1;cin=0;#4

     a=0;b=1;cin=1;#4


     a=1;b=0;cin=0;#4


     a=1;b=0;cin=1;#4

      a=1;b=1;cin=1;#4
     $monitor("mtime %d a=%d b=%d cin=%d sum=%d cout=%d",$time,a,b,cin,sum,cout);
    $finish;
  end
endmodule
