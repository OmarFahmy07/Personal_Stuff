module ffe_top #(parameter INT_WIDTH = 6,
                 parameter FRACT_WIDTH = 6,
                 localparam DATA_WIDTH = INT_WIDTH + FRACT_WIDTH)
                (input wire clk,
                 input wire rst_n,
                 input wire data_vld_toggle,
                 input wire [DATA_WIDTH-1:0] data_in,
                 input wire [DATA_WIDTH-1:0] h0,
                 input wire [DATA_WIDTH-1:0] h1,
                 input wire [DATA_WIDTH-1:0] h2,
                 input wire [DATA_WIDTH-1:0] h3,
                 output wire [DATA_WIDTH-1:0] data_out,
                 output wire vld_out);
    
    // Internal signals
    wire  [DATA_WIDTH-1:0]  data_sync;
    wire                    sync_pulse;
    wire                    load;
    wire                    clr;
    wire  [1:0]             in_sel;
    wire                    out_sel;
    
    pulse_gen_sync #(.DATA_WIDTH(DATA_WIDTH)) u0_sync (
    .clk(clk),
    .rst_n(rst_n),
    .data_vld_toggle(data_vld_toggle),
    .data_async(data_in),
    .data_sync(data_sync),
    .sync_pulse(sync_pulse)
    );
    
    ctrl u0_ctrl (
    .clk(clk),
    .rst_n(rst_n),
    .sync_pulse(sync_pulse),
    .load(load),
    .clr(clr),
    .vld_out(vld_out),
    .in_sel(in_sel),
    .out_sel(out_sel)
    );
    
    ffe #(.INT_WIDTH(INT_WIDTH), .FRACT_WIDTH(FRACT_WIDTH)) u0_ffe(
    .clk(clk),
    .rst_n(rst_n),
    .in_sel(in_sel),
    .out_sel(out_sel),
    .load(load),
    .clr(clr),
    .data_in(data_sync),
    .h0(h0),
    .h1(h1),
    .h2(h2),
    .h3(h3),
    .data_out(data_out)
    );
    
endmodule
