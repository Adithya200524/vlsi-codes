module fsm(ds,rd,go,ws,clk,rst_n);
  input go,ws;
  input clk,rst_n;
  output reg ds,rd;
  
  parameter [1:0] i = 2'b00,
  				  r = 2'b01,
  				  d = 2'b10,
  				 dn = 2'b11;
  
  reg [1:0] state,next;
  
  always@ (posedge clk , negedge rst_n)begin
  if (!rst_n) state <= i;
   else 		  state <= next;
  end
  
  always@ (state or go or ws)begin
  next = 2'bx ;
  ds = 1'b0;
  rd = 1'b0;
  
  case (state)
    i : begin if(go) next = r;
    	else   next = i;
    end
    
    r :begin    next = d;
    end
    
    d :begin  if(ws) next = r;
    	else   next = dn;
    end
    
    dn :  begin    next = i;
    end
    
  endcase
  
  end
endmodule
    
  
  