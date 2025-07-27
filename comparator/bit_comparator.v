module comparator_4bit(
  input [3:0] A, B,
  output reg A_grt_B, A_less_B, A_eq_B
);

  always @(*) begin
    A_grt_B = 0; A_less_B = 0; A_eq_B = 0;
    if (A > B)     A_grt_B = 1;
    else if (A < B) A_less_B = 1;
    else           A_eq_B = 1;
  end

endmodule
