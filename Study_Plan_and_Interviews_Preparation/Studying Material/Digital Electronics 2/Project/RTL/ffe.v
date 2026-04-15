module ffe #(parameter INT_WIDTH = 6,
             parameter FRACT_WIDTH = 6,
             localparam DATA_WIDTH = INT_WIDTH + FRACT_WIDTH)
            (input wire clk,
             input wire rst_n,
             input wire [1:0] in_sel,
             input wire out_sel,
             input wire load,
             input wire clr,
             input wire signed [DATA_WIDTH-1 : 0] data_in,
             input wire signed [DATA_WIDTH-1 : 0] h0,
             input wire signed [DATA_WIDTH-1 : 0] h1,
             input wire signed [DATA_WIDTH-1 : 0] h2,
             input wire signed [DATA_WIDTH-1 : 0] h3,
             output reg signed [DATA_WIDTH-1 : 0] data_out);
    
    reg signed [DATA_WIDTH-1 : 0] d0, d1, d2, d3;
    
    reg signed [DATA_WIDTH-1 : 0] acc;
    
    reg  signed [DATA_WIDTH-1 : 0] mul_in_1, mul_in_2;
    wire signed [2*DATA_WIDTH-1 : 0] mul_out;
    wire signed [DATA_WIDTH-1 : 0] mul_out_trunc;
    
    wire signed [DATA_WIDTH-1 : 0] add_out;
    
    wire signed [DATA_WIDTH-1 : 0] out_comb;
    
    // Shift Register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            d0 <= 'd0;
            d1 <= 'd0;
            d2 <= 'd0;
            d3 <= 'd0;
        end
        else
        begin
            if (load) begin
                d0 <= data_in;
                d1 <= d0;
                d2 <= d1;
                d3 <= d2;
            end
        end
    end
    
    // Accumulator
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            acc <= 'd0;
        end
        else begin
            if (clr) begin
                acc <= 'd0;
            end
            else begin
                acc <= add_out;
            end
        end
    end
    
    // Output Register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            data_out <= 'd0;
        end
        else begin
            data_out <= out_comb;
        end
    end
    
    // Multiplier's Inputs
    always @(*) begin
        case (in_sel)
            2'b00:
            begin
                mul_in_1 = d0;
                mul_in_2 = h0;
            end
            2'b01:
            begin
                mul_in_1 = d1;
                mul_in_2 = h1;
            end
            2'b10:
            begin
                mul_in_1 = d2;
                mul_in_2 = h2;
            end
            2'b11:
            begin
                mul_in_1 = d3;
                mul_in_2 = h3;
            end
            default:
            begin
                mul_in_1 = 'd0;
                mul_in_2 = 'd0;
            end
        endcase
    end
    
    // Multiplier
    assign mul_out       = mul_in_1 * mul_in_2;
    assign mul_out_trunc = mul_out >> (FRACT_WIDTH); // Throwing half the bits from both integer and fractional parts
    
    // Adder
    assign add_out = mul_out_trunc + acc; // Throwing the MSB
    
    // Output Combinational logic
    assign out_comb = out_sel ? add_out : 'd0;
    
    
endmodule
