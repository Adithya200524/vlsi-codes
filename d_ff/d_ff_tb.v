module d_ff_tb;
  reg clk, rst_n;
  reg d;
  wire q;

  // DUT: Instantiate the D flip-flop
  D_flipflop dff(clk, rst_n, d, q);

  // Clock Generation: 50 MHz (20 ns period)
  always #10 clk = ~clk;

  initial begin
    // Initialize signals
    clk   = 0;
    rst_n = 0;
    d     = 0;

    // Apply reset for one cycle
    @(posedge clk);
    rst_n = 1;

    // First stimulus block - stable & clock-synced
    repeat (6) begin
      @(posedge clk);
      d = $urandom_range(0, 1);
    end

    // Pulse reset mid-simulation
    @(posedge clk); rst_n = 0;
    @(posedge clk); rst_n = 1;

    // Second stimulus block - post-reset behavior
    repeat (6) begin
      @(posedge clk);
      d = $urandom_range(0, 1);
    end

    $finish;
  end

  // VCD setup for waveform viewing
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, d_ff_tb);
  end

  // Live signal tracing for clarity
  initial begin
    $monitor("Time=%t | clk=%b | rst_n=%b | d=%b | q=%b", $time, clk, rst_n, d, q);
  end
endmodule