module simple_function_tb () ;
  
  reg  [7:0] A_tb, B_tb, C_tb ;
  wire [3:0] A_ones_tb, B_ones_tb, C_ones_tb ;
  
  
  initial
    begin
      A_tb = 8'b11001100 ; 
      B_tb = 8'b11111111 ;
      C_tb = 8'b00000001 ;
      
      #5
      $display ("A_ones = %d, B_ones = %d, C_ones = %d", A_ones_tb, B_ones_tb, C_ones_tb);
      
      
      A_tb = 8'b11000000 ; 
      B_tb = 8'b00001111 ;
      C_tb = 8'b00111111 ;
      #5
      $display ("A_ones = %d, B_ones = %d, C_ones = %d", A_ones_tb, B_ones_tb, C_ones_tb);
      
      
    end
  
  
  simple_function DUT (
    .A(A_tb), 
    .B(B_tb), 
    .C(C_tb),
    .A_ones(A_ones_tb), 
    .B_ones(B_ones_tb), 
    .C_ones(C_ones_tb)
  );
  
  
endmodule