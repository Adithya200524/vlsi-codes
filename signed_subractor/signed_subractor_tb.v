module tb_signed_subtractor;

reg signed [3:0] a, b;
wire signed [4:0] diff;

signed_subtractor uut (
    .a(a),
    .b(b),
    .diff(diff)
);

initial begin
    $dumpfile("signed_subtractor.vcd");
    $dumpvars(0, tb_signed_subtractor);

  $monitor("Time = %0t | a = %0d, b = %0d , diff = %0d", $time, a, b, diff);

    a =  4'sd3;  b =  4'sd2;   #10;   
    a = -4'sd4;  b =  4'sd1;   #10;   
    a =  4'sd7;  b = -4'sd2;   #10;   
    a = -4'sd5;  b = -4'sd3;   #10;   
    a =  4'sd6;  b =  4'sd7;   #10;   

    $finish;
end

endmodule