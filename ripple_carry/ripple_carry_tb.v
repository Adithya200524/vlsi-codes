module ripple_carry_adder_TB;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  // DUT - Design Under Test
  ripple_carry_adder rca (.A(A), .B(B), .Cin(Cin), .S(Sum), .Cout(Cout));

  initial begin
    $dumpfile("ripple_carry.vcd");
    $dumpvars(0, ripple_carry_adder_TB);

    $display("Time,tA,tB,tCin,t=>,tSum,tCout");
    $monitor("%0t,t%b,t%b,t%b,t=>,t%b,t%b", $time, A, B, Cin, Sum, Cout);

    // Test cases
    A = 4'b0000; B = 4'b0000; Cin = 0; #5;
    A = 4'b0101; B = 4'b0011; Cin = 1; #5;
    A = 4'b1111; B = 4'b0001; Cin = 0; #5;
    A = 4'hA;    B = 4'h5;    Cin = 1; #5;
    A = 4'hF;    B = 4'hF;    Cin = 1; #5;

    $finish;
  end
endmodule

