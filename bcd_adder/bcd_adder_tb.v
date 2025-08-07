module test_bcd_adder;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  bcd_adder uut (
    .a(a), .b(b), .cin(cin),
    .sum(sum), .cout(cout)
  );

  initial begin
    $dumpfile("bcd_adder.vcd");
    $dumpvars(0, test_bcd_adder);

    // Test cases
    a = 4'd5; b = 4'd4; cin = 0; #10;  
    a = 4'd7; b = 4'd5; cin = 0; #10;  
    a = 4'd9; b = 4'd9; cin = 0; #10;  
    a = 4'd3; b = 4'd6; cin = 1; #10;  

    $finish;
  end

  initial begin
    $monitor("Time=%0t | A=%d | B=%d | Cin=%b => Sum=%d | Cout=%b",
              $time, a, b, cin, sum, cout);
  end
endmodule