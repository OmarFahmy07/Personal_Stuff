module ctrl (
  input  wire         clk,
  input  wire         rst_n,
  input  wire         sync_pulse,
  output reg          load,
  output reg          clr,
  output reg          vld_out,
  output wire  [1:0]  in_sel,
  output reg          out_sel
);
  
reg [1:0] cycles_cntr;
reg       strt_cnt;
reg       sync_pulse_dly;

always @(posedge clk, negedge rst_n) begin
  if (!rst_n)
    begin
      sync_pulse_dly <= 1'b0;
    end
  else
    begin
      sync_pulse_dly <= sync_pulse;      
    end
end

// strt_cnt logic
always @(posedge clk, negedge rst_n) begin
  if (!rst_n)
    begin
      strt_cnt <= 1'b0;
    end
  else if (sync_pulse_dly)
    begin
      strt_cnt <= 1'b1;      
    end
end

// Counter logic
always @(posedge clk, negedge rst_n) begin
  if (!rst_n)
    begin
      cycles_cntr <= 2'd0;
    end
  else if (strt_cnt)
    begin
      cycles_cntr <= cycles_cntr + 2'd1;      
    end
end

// in_sel signal logic
assign in_sel = cycles_cntr;

// Load and Clear signals logic
always @(posedge clk, negedge rst_n) begin
  if (!rst_n)
    begin
      load      <= 1'b0;
      clr       <= 1'b0;
      out_sel   <= 1'b0;
    end
  else if ((sync_pulse && cycles_cntr == 2'd0) || cycles_cntr == 2'd2)
    begin
      load      <= 1'b1;      
      clr       <= 1'b1;    
      out_sel   <= 1'b1;  
    end
  else  
    begin
      load      <= 1'b0;  
      clr       <= 1'b0;
      out_sel   <= 1'b0;
    end
end

// vld_out logic
always @(posedge clk, negedge rst_n) begin
  if (!rst_n)
    begin
      vld_out <= 1'b0;
    end
  else if (cycles_cntr == 2'd3)
    begin
      vld_out <= 1'b1;      
    end
  else  
    begin
      vld_out <= 1'b0;  
    end
end

endmodule