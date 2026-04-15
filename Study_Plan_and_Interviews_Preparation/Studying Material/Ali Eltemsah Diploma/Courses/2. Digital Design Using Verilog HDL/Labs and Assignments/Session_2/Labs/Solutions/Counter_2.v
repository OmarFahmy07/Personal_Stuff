/* 
1- This code we sepeare the sequential always from combinational always
2- Using assign statement to implement zero flag logic
*/


module Counter_2 (

input     wire               clock,           
input     wire   [3:0]       in,
input     wire               latch,  
input     wire               dec,    
output    wire               zero  ) ;


reg    [3:0]  counter, 
                counter_reg  ;


always@(posedge clock) 
 begin   
  counter_reg <= counter ;
 end
  
always @(*)
 begin
   if (latch) 
     begin 
      counter = in ; 
     end     
   else if (dec && !zero) 
     begin 
      counter = counter_reg - 4'b0001 ; 
     end 
   else
     begin
      counter = counter_reg ;
     end
 end  

assign zero = (counter_reg == 4'b0) ;
  
endmodule