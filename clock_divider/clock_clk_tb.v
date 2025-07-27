
module clock_clk_tb;

    reg clk;
    reg rst;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire led;

  
    clock_clk dut (
        .clk(clk),
        .rst(rst),
        .sec(sec),
        .min(min),
        .hour(hour),
        .led(led)
    );

   
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
 
        $dumpfile("digital_clock.vcd");   
        $dumpvars(0, clock_clk_tb);  

        
        $monitor("Time %02d:%02d:%02d | LED: %b", hour, min, sec, led);

       
        rst = 1;
        #100;
        rst = 0;

        
        #1_000_000_000;  
        $display("Simulation complete");
        $finish;
    end

endmodule
