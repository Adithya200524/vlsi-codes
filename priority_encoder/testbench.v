module priority_encoder_tb;
  reg [7:0] D;
  wire [2:0] y;
  
  priority_encoder uut (
    .D(D),
    .y(y)
  );

  initial begin
   
    $dumpfile("priority_encoder.vcd");       
    $dumpvars(0, priority_encoder_tb);       
    $monitor("time=%0t | D=%b | y=%b", $time, D, y);

    D = 8'b0000_0001; #10;
    D = 8'b0000_0010; #10;
    D = 8'b0000_0100; #10;
    D = 8'b0000_1000; #10;
    D = 8'b0001_0000; #10;
    D = 8'b0010_0000; #10;
    D = 8'b0100_0000; #10;
    D = 8'b1000_0000; #10;
    D = 8'b0000_0000; #10; // No active input

    $finish;
  end

endmodule
