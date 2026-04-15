module simple_function (
  input  [7:0] A, B, C ,
  output [3:0] A_ones, B_ones, C_ones);


 
  assign A_ones = OnesCount (A) ;
  assign B_ones = OnesCount (B) ;
  assign C_ones = OnesCount (C) ;

  
function [3:0] OnesCount; 

input [7:0] A; 
integer I; 

begin 

OnesCount = 0; 
    for (I = 0; I <= 7; I = I + 1) 
      if (A[I]) OnesCount = OnesCount + 1; 

end 

endfunction
  
endmodule