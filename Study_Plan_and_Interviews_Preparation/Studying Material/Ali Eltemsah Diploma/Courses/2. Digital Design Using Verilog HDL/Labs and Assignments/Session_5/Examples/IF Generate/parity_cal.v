module parity_cal 
#(parameter PARITY_TYPE = 0 , WIDTH = 7)

( input   wire [WIDTH-1:0]  DATA, 
  output  wire              parity_bit       
) ;
  
 generate 
   if(PARITY_TYPE)
     // code 1 : EVEN PARITY
     begin
      assign parity_bit = ^DATA ;        
     end
   else	
     // code 2 : ODD PARITY
     begin
      assign parity_bit = ~^DATA ;     
     end
 endgenerate

endmodule 