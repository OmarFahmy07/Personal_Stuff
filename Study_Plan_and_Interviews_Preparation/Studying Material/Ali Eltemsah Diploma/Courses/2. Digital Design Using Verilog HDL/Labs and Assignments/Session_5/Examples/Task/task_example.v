module task_example ();
 
  reg [7:0] Mux_Addr_Data = 0;
  reg       Addr_Valid = 1'b0;
  reg       Data_Valid = 1'b0;
   
  task do_write;
    input [7:0] i_addr, i_data; 
    begin
      Addr_Valid    = 1'b1;
      Mux_Addr_Data = i_addr;
      #10;
      Addr_Valid    = 1'b0;
      Data_Valid    = 1'b1;
      Mux_Addr_Data = i_data;
      #10;
      Data_Valid = 1'b0;
      #10;
    end
  endtask
 
  initial
    begin
      #10;
      do_write(8'h00, 8'hAB);
      do_write(8'h01, 8'hBC);
      do_write(8'h02, 8'hCD);
    end
   
endmodule