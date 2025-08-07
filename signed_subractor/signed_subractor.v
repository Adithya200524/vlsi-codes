module signed_subtractor (
    input signed [3:0] a,     
    input signed [3:0] b,     
    output signed [4:0] diff  
);

assign diff = a - b;

endmodule