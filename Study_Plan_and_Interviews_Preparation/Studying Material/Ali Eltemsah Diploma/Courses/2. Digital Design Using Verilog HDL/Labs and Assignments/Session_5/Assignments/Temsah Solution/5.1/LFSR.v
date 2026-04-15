
module  LFSR  #( parameter LFSR_WD = 4 ) 
(
input   wire [LFSR_WD-1:0]  SEED,
input   wire                CLK,
input   wire                RST,
output  reg                 OUT,
output  reg                 Valid
);


// LFSR
reg     [LFSR_WD-1:0]       LFSR ;

//counters
reg     [3:0]               shft_xor_count ;
reg     [2:0]               shft_count ;

wire                        feedback; 
wire                        shft_xor_done;
wire                        shft_done;


// LFSR Operation
always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
     begin
      LFSR  <= SEED ;
      Valid <= 1'b0 ;
      OUT   <= 1'b0 ;
     end
   else if (!shft_xor_done)
     begin
      LFSR  <= {feedback,LFSR[3:1]} ;
      OUT   <= 1'b0 ;
      Valid <= 1'b0 ;
     end
   else if(shft_xor_done && !shft_done)
     begin
      {LFSR,OUT} <= {1'b0,LFSR} ;
      Valid <= 1'b1 ;
     end
   else
    begin
      Valid <= 1'b0 ;
    end
 end

assign feedback = ^LFSR[2:0] ;

// Shift Xor Counter
always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
     begin
      shft_xor_count <= 0 ;
     end
   else if (!shft_xor_done)
     begin
      shft_xor_count <= shft_xor_count + 4'b1 ;
     end
 end

assign shft_xor_done = (shft_xor_count == 4'b1000) ? 1'b1 : 1'b0 ;


// Shift Counter
always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
     begin
      shft_count <= 0 ;
     end
   else if (shft_xor_done && !shft_done)
     begin
      shft_count <= shft_count + 3'b1 ;
     end
 end

assign shft_done = (shft_count == 3'b100) ? 1'b1 : 1'b0 ;

endmodule
