module fsm_tb;

  reg clk, rst_n;
  reg go, ws;
  wire ds, rd;

  
  fsm uut (
    .clk(clk),
    .rst_n(rst_n),
    .go(go),
    .ws(ws),
    .ds(ds),
    .rd(rd)
  );

  
  initial clk = 0;
  always #10 clk = ~clk;

  
  initial begin
   
    rst_n = 0; go = 0; ws = 0;

   
    #10 rst_n = 1;

   
    #10 go = 1;   
    #10 go = 0;   
    #10 ws = 0;   
    #10 ws = 0;   

    
    #10 go = 1;   
    #10 go = 0;   
    #10 ws = 1;   

   
    #10 ws = 0;
    #10 $finish;
  end

 
  initial begin
    $display("Time,tclk,trst_n,tgo,tws,tds,trd,tState");
    $monitor("%0t,t%b,t%b,t%b,t%b,t%b,t%b",
             $time, clk, rst_n, go, ws, ds, rd);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
