module pulse_gen_sync #(parameter DATA_WIDTH = 12,
                        parameter NO_OF_STAGES = 2)
                       (input wire clk,
                        input wire rst_n,
                        input wire data_vld_toggle,
                        input wire [DATA_WIDTH-1:0] data_async,
                        output reg [DATA_WIDTH-1:0] data_sync,
                        output wire sync_pulse);
    
    // Internal Signals
    reg [NO_OF_STAGES-1:0] sync_stages;
    reg sync_vld_dly;
    
    // Generating the sync_pulse (a single cycle pulse)
    assign sync_pulse = sync_vld_dly ^ sync_stages[NO_OF_STAGES-1];
    
    // Delayed version of the synchronized valid signal
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
        begin
            sync_vld_dly <= 1'b0;
        end
        else
        begin
            sync_vld_dly <= sync_stages[NO_OF_STAGES-1];
        end
    end
    
    // The synchronizer stages
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
        begin
            sync_stages <= {NO_OF_STAGES{1'b0}};
        end
        else
        begin
            sync_stages <= {sync_stages[NO_OF_STAGES-2:0], data_vld_toggle};
        end
    end
    
    // Reading the asynchronous data bus
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
        begin
            data_sync <= {DATA_WIDTH{1'b0}};
        end
        else if (sync_pulse)
        begin
            data_sync <= data_async;
        end
            end
            
            endmodule
