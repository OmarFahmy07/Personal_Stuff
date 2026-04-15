

module combo_logic_1 (

input a, b ,
output  c, d);

assign c = a & b ;
assign d = a | b ;  
 
endmodule
 
   
module combo_logic_2 (

input c, d ,
output e, f);

  
assign e = ~ c ;
assign f = ~ d ;
  
  
endmodule

module Combo_logic_Top ();
  
wire c , d, a , b ;
  combo_logic_1 U0 (
    .a(a), 
    .b(b),
    .c(c), 
    .d(d)
     );
  
  combo_logic_2 U1 (
    .c(c), 
    .d(d),
    .e(a), 
    .f(b)
     );  
  
endmodule
