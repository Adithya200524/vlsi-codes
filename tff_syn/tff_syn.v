module tff_syn( 
input data, clk, rst_n,
output reg q);

initial q = 1'b0;

always@(posedge clk)
    if(~rst_n)begin
        q <= 1'b1;
   
   end 
   else if(data)begin

    q <= ~q ;
    end


endmodule 