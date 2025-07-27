module tb_comparator_4bit;

  reg [3:0] A, B;
  wire A_grt_B, A_less_B, A_eq_B;

  
  
  
  
  comparator_4bit comparator_comp(A, B, A_grt_B, A_less_B, A_eq_B);

  initial begin
    $dumpfile("comparator_4bit.vcd");
    $dumpvars(0, tb_comparator_4bit);
    $monitor("A = %0b, B = %0b, A_grt_B = %b, A_less_B = %b, A_eq_B = %b", A, B, A_grt_B, A_less_B, A_eq_B);


    repeat (5) begin
      A = $random % 16; 
      B = $random % 16;
      #10;
    end
  end

endmodule


