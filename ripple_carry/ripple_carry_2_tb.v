module rca_tb;
  reg a0, a1, a2, a3;
  reg b0, b1, b2, b3;
  reg cin;
  wire s0, s1, s2, s3;
  wire c0;


  rca uut (
    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .b0(b0), .b1(b1), .b2(b2), .b3(b3),
    .cin(cin),
    .s0(s0), .s1(s1), .s2(s2), .s3(s3),
    .c0(c0)
  );

  initial begin
 
    $dumpfile("rca_wave.vcd");
    $dumpvars(0, rca_tb);


    $monitor("time=%d a0=%d a1=%d a2=%d a3=%d b0=%d b1=%d b2=%d b3=%d cin=%d s0=%d s1=%d s2=%d s3=%d c0=%d",
             $time, a0, a1, a2, a3, b0, b1, b2, b3, cin, s0, s1, s2, s3, c0);

    {a3,a2,a1,a0} = 4'b0101;
    {b3,b2,b1,b0} = 4'b0011;
    cin = 0;
    #10;
    
    {a3,a2,a1,a0} = 4'b1111;
    {b3,b2,b1,b0} = 4'b0001;
    cin = 0;
    #10;

    {a3,a2,a1,a0} = 4'b1000;
    {b3,b2,b1,b0} = 4'b0111;
    cin = 1;
    #10;

    {a3,a2,a1,a0} = 4'b0000;
    {b3,b2,b1,b0} = 4'b0000;
    cin = 1;
    #10;

    {a3,a2,a1,a0} = 4'b1010;
    {b3,b2,b1,b0} = 4'b1100;
    cin = 0;
    #10;

    $finish;
  end
endmodule
