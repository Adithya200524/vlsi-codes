module T_flipflop (
  input clk,
  input rst_n,
  input t,
  output reg q,
  output q_bar
);

  always @(posedge clk) begin
    if (!rst_n)
      q <= 0;
    else
      q <= (t ? ~q : q);
  end

  assign q_bar = ~q;

endmodule
