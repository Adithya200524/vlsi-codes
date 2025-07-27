module tb;
  reg clk, rst_n;
  reg s, r;
  wire q, q_bar;

  // DUT instantiation
  SR_flipflop dff(clk, rst_n, s, r, q, q_bar);

  // Clock generation (period = 4ns)
  always #2 clk = ~clk;

  // Simulation control
  initial begin
    clk = 0;
    rst_n = 0;
    s = 0;
    r = 0;

    // VCD dump setup
    $dumpfile("dump.vcd");
    $dumpvars(1);

    // Apply reset
    @(negedge clk);
    rst_n = 0;
    @(posedge clk);
    #1 $display("[Reset Active] rst_n=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);

    // Release reset
    @(negedge clk);
    rst_n = 1;

    // Drive all input cases
    apply_input(2'b00);  // No change
    apply_input(2'b01);  // Reset
    apply_input(2'b10);  // Set
    apply_input(2'b11);  // Invalid state

    // End simulation
    #5;
    $finish;
  end

  // Input driving task - aligns to clock for clean transitions
  task apply_input;
    input [1:0] ip;
    begin
      @(negedge clk);      // setup inputs before rising edge
      {s, r} = ip;
      @(posedge clk);      // inputs sampled here
      #1 $display("s=%b, r=%b --> q=%b, q_bar=%b", s, r, q, q_bar);
    end
  endtask
endmodule
