module tb_signed_adder;

reg signed [3:0] a, b;
wire signed [4:0] sum;

signed_adder uut (
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin
    $dumpfile("signed_adder.vcd");
    $dumpvars(0, tb_signed_adder);

    $monitor("Time = %0t | a = %0d, b = %0d -> sum = %0d", $time, a, b, sum);

    a = 4'sd3;  b = 4'sd2;   #10;   
    a = -4'sd4; b = 4'sd1;   #10;   
    a = 4'sd7;  b = -4'sd2;  #10;   
    a = -4'sd5; b = -4'sd3;  #10;   
    a = 4'sd6;  b = 4'sd3;   #10;   

    $finish;
end

endmodule