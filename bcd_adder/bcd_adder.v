module bcd_adder (
  input [3:0] a, b,      
  input cin,             
  output [3:0] sum,      
  output cout            
);
  wire [4:0] binary_sum;
  wire [4:0] corrected_sum;

  assign binary_sum = a + b + cin;

  // If sum > 9 (i.e., binary_sum > 1001), add 6
  assign corrected_sum = (binary_sum > 9) ? (binary_sum + 5'd6) : binary_sum;

  assign sum = corrected_sum[3:0];
  assign cout = corrected_sum[4]; 
endmodule