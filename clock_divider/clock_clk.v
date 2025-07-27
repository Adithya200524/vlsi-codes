module clock_clk (
    input clk,         
    input rst,       
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [4:0] hour,
    output reg led     
);

    reg [25:0] clk_div;
    reg one_hz;

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_div <= 0;
            one_hz <= 0;
        end else begin
            if (clk_div == 25_000_000) begin  
                clk_div <= 0;
                one_hz <= 1;
            end else begin
                clk_div <= clk_div + 1;
                one_hz <= 0;
            end
        end
    end

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sec  <= 0;
            min  <= 0;
            hour <= 0;
            led  <= 0;
        end else if (one_hz) begin
            led <= ~led;  

            if (sec == 59) begin
                sec <= 0;
                if (min == 59) begin
                    min <= 0;
                    if (hour == 23)
                        hour <= 0;
                    else
                        hour <= hour + 1;
                end else
                    min <= min + 1;
            end else
                sec <= sec + 1;
        end
    end
endmodule
