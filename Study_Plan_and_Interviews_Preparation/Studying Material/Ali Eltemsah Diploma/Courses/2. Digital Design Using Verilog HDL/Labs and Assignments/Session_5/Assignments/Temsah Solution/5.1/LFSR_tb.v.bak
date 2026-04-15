`timescale 1us/1ns

module  LFSR_tb ;

/////////////////////////////////////////////////////////
///////////////////// Parameters ////////////////////////
/////////////////////////////////////////////////////////

parameter LFSR_WD_tb = 4 ;
parameter CLK_PERIOD = 1 ;
parameter Test_Cases = 5 ;


/////////////////////////////////////////////////////////
//////////////////// DUT Signals ////////////////////////
/////////////////////////////////////////////////////////


reg      [LFSR_WD_tb-1:0]     SEED_tb;
reg                           CLK_tb;
reg                           RST_tb;
wire                          OUT_tb;
wire                          Valid_tb;

/////////////////////////////////////////////////////////
///////////////// Loops Variables ///////////////////////
/////////////////////////////////////////////////////////

integer                       Operation ;

/////////////////////////////////////////////////////////
/////////////////////// Memories ////////////////////////
/////////////////////////////////////////////////////////

reg    [LFSR_WD_tb-1:0]   Test_Seeds   [Test_Cases-1:0] ;
reg    [LFSR_WD_tb-1:0]   Expec_Outs   [Test_Cases-1:0] ;

////////////////////////////////////////////////////////
////////////////// initial block /////////////////////// 
////////////////////////////////////////////////////////

initial 
 begin
 
 // System Functions
 $dumpfile("LFSR_DUMP.vcd") ;       
 $dumpvars; 
 
 // Read Input Files
 $readmemh("Seeds_h.txt", Test_Seeds);
 $readmemh("Expec_Out_h.txt", Expec_Outs);

 // initialization
 initialize() ;

 // Test Cases
 for (Operation=0;Operation<Test_Cases;Operation=Operation+1)
  begin
   do_oper(Test_Seeds[Operation]) ;                       // do_lfsr_operation
   check_out(Expec_Outs[Operation],Operation) ;           // check output response
  end

 #100
 $finish ;

 end




////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

/////////////// Signals Initialization //////////////////

task initialize ;
 begin
  SEED_tb = 'b1001;
  CLK_tb  = 'b0;
  RST_tb  = 'b0;
 end
endtask

///////////////////////// RESET /////////////////////////

task reset ;
 begin
  RST_tb =  'b1;
  #1
  RST_tb  = 'b0;
  #1
  RST_tb  = 'b1;
 end
endtask

////////////////// Do LFSR Operation ////////////////////

task do_oper ;
 input  [LFSR_WD_tb-1:0]     IN_SEED ;

 begin
   SEED_tb = IN_SEED ;
   reset () ;
 end
endtask

////////////////// Check Out Response  ////////////////////

task check_out ;
 input  reg     [LFSR_WD_tb-1:0]     expec_out ;
 input  integer                      Oper_Num ; 

 integer i ;
 
 reg    [LFSR_WD_tb-1:0]     gener_out ;

 begin
  @(posedge Valid_tb)
  for(i=0; i<4; i=i+1)
   begin
    #CLK_PERIOD gener_out[i] = OUT_tb ;
   end
   if(gener_out == expec_out) 
    begin
     $display("Test Case %d is succeeded",Oper_Num);
    end
   else
    begin
     $display("Test Case %d is failed", Oper_Num);
    end
 end
endtask


////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////

initial
 begin
  forever #0.5  CLK_tb = ~CLK_tb ;
 end


////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////

LFSR #( .LFSR_WD(LFSR_WD_tb) ) DUT
(
.SEED(SEED_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.OUT(OUT_tb),
.Valid(Valid_tb)
);


endmodule
