module signed_adder (
    input signed [3:0] a,     
    input signed [3:0] b,     
    output signed [4:0] sum   
);

assign sum = a + b;

endmodule