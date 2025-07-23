`timescale 1ns / 1ps

module tff_syn_tb;

  
  reg data;
  reg clk;
  reg rst_n;
  wire q;

 
  tff_syn dut (
    .data(data),
    .clk(clk),
    .rst_n(rst_n),
    .q(q)
  );


  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  
  initial begin
   
    data = 0;
    rst_n = 1;

   
    #10 rst_n = 0;  

    
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    #10 data = 1;
    #10 data = 0;

   
    #10 rst_n = 0;
    #10 rst_n = 1;

   
    #10 data = 1;
    #10 data = 0;

   
    #20 $finish;
  end
  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars (0,tff_syn_tb);
  
  end

  
  initial begin
    $monitor("Time=%0t | clk=%b rst_n=%b data=%b => q=%b", $time, clk, rst_n, data, q);
  end

endmodule