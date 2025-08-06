

module tb_bcd_to_7seg;

    reg [3:0] bcd;
    wire [6:0] seg;

    
    bcd_to_7seg uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        $display("Time\tBCD\tSEGMENT");
        $monitor("%0dns\t%b\t%b", $time, bcd, seg);

        
        for (bcd = 0; bcd < 16; bcd = bcd + 1) begin
            #10; // wait 10 time units
        end

        #10;
        $finish;
    end

endmodule