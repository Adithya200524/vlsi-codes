module memory_me(d_out,clk,rst_n,adder);
input clk,rst_n;
input [2:0]adder;
output reg [7:0] d_out;

reg [7:0] mem [0:7];

initial begin 
d_out=8'b00000000;
end
always @(adder) begin
case (adder)
3'b000 : mem[adder] = 8'b00000001;
3'b001 : mem[adder] = 8'b00000010;
3'b011 : mem[adder] = 8'b00000011;
3'b100 : mem[adder] = 8'b00000101;
3'b101 : mem[adder] = 8'b00000110;
3'b110 : mem[adder] = 8'b00000111;
3'b111 : mem[adder] = 8'b00001000;
default : mem[adder] = 8'b00000000;

endcase
end
always@ (posedge clk) 
begin
if(rst_n)begin
d_out <=mem[adder];
end
else 
d_out <= d_out;
 
end
endmodule
