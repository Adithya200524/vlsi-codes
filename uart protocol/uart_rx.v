`timescale 1ns / 1ps


module uart_rx( input wire rx,
        output reg rdy,
        input wire rdy_clr,
        input wire clk_50m,
        input wire clken,
        output reg [7:0] data );
 initial begin 
    rdy = 0;
    data = 8'b0;
end 
parameter RX_STATE_START = 2'b00;
parameter RX_STATE_DATA = 2'b01;
parameter RX_STATE_STOP = 2'b10;
reg[1:0] state = RX_STATE_START ;
reg[3:0] sample = 0;
reg[3:0] bitpos = 0;
reg[7:0] scratch = 8'b0;
always@(posedge clk_50m)begin
if (rdy_clr)
    rdy <= 0;
if (clken) begin
    case(state)
        RX_STATE_START : begin
            if (!rx || sample !=0)
            sample <= sample + 4'b1;
            if (sample == 15)begin
            state <= RX_STATE_DATA;
            bitpos <= 0;
            sample <= 0;
            scratch <= 0;
   end
 end
 
 RX_STATE_DATA : begin 
 sample <= sample + 4'b1;
     if (sample == 4'h8) begin 
     scratch[bitpos[2:0]] <= rx;
     bitpos <= bitpos + 4'b1;
 end 
      if(bitpos == 8&& sample == 15)
      state <= RX_STATE_STOP;
end

RX_STATE_STOP : begin 
        if (sample == 15) begin
        data <= scratch;
        rdy <= 1'b1;
        sample <= 0;
        state <= RX_STATE_START;
   end else begin 
        sample <= sample + 4'b1;
        end
     end
        default: state <=RX_STATE_START;
        endcase 
       end 
      end
endmodule    


