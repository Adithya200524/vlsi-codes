module T_flipflop_tb;

  reg clk, rst_n, t;
  wire q, q_bar;

  T_flipflop uut (
    .clk(clk),
    .rst_n(rst_n),
    .t(t),
    .q(q),
    .q_bar(q_bar)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("T_flipflop.vcd");
    $dumpvars(0, T_flipflop_tb);
    $monitor("Time=%0t | rst_n=%b | t=%b | q=%b | q_bar=%b", $time, rst_n, t, q, q_bar);

    rst_n = 0; t = 0;

    #12 rst_n = 1;

    #7 t = 1; 
    #10 t = 0;
    #10 t = 1;
    #10 t = 1;
    #10 t = 0;

    #10 rst_n = 0;
    #10 rst_n = 1;

    #10 t = 1;

    #20 $finish;
  end

endmodule
