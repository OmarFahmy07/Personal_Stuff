/* 
This ia a simple testbench for the counter
*/


// testbench has no inputs or outputs
module Down_Counter_tb ();

//declare testbench signals
reg               clock_tb ;            
reg   [3:0]       in_tb ;
reg               latch_tb ;  
reg               dec_tb ;    
wire              zero_tb ;


//initial block
initial
 begin
  $dumpfile("count.vcd"); // waveforms in this file      
  $dumpvars;              // saves all waveforms   
  clock_tb = 0;   
  latch_tb = 0;   
  dec_tb = 0;   
  in_tb = 4'b0010;   
  #16
  latch_tb = 1;  // wait 16 ns  
  in_tb = 4'b1000;    
  #10 
  latch_tb = 0;  // wait 10 ns   
  #10 
  dec_tb = 1;   
  #100 $finish;  //finished with simulation 
 end

// Clock Generator
always #5 clock_tb = ~clock_tb  ;      // clock frequency 100 MHz

// Design instantiation

Down_Counter DUT (
.clock(clock_tb),            
.in(in_tb), 
.latch(latch_tb),   
.dec(dec_tb),     
.zero(zero_tb)
);
  
endmodule