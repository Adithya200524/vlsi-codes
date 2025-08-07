module test_jk_flipflop;
  reg j, k, clk;
  wire q;

  jk_flipflop uut(q, j, k, clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0, test_jk_flipflop);

    j = 0; k = 0; #10;  
    j = 0; k = 1; #10;  
    j = 1; k = 0; #10;  
    j = 1; k = 1; #10;  
    j = 0; k = 0; #10;  
    j = 1; k = 1; #10;  

    $finish;
  end

  initial begin
    $monitor("Time=%0t | CLK=%b J=%b K=%b => Q=%b", 
              $time, clk, j, k, q);
  end
endmodule