`timescale 1ns/1ps

module ffe_tb ();
    
    localparam  INT_WIDTH   = 15;
    localparam  FRACT_WIDTH = 12;
    localparam NUM_SAMPLES  = 104000;
    localparam NUM_COEFFS   = 4;
    localparam DATA_WIDTH   = INT_WIDTH + FRACT_WIDTH;
    
    reg                     rst_n_tb;
    reg                     clk_tb_4M;
    reg                     clk_tb_1M;
    reg                     data_vld_toggle_tb;
    reg   [DATA_WIDTH-1:0]  data_in_tb;
    reg   [DATA_WIDTH-1:0]  h0_tb;
    reg   [DATA_WIDTH-1:0]  h1_tb;
    reg   [DATA_WIDTH-1:0]  h2_tb;
    reg   [DATA_WIDTH-1:0]  h3_tb;
    wire  [DATA_WIDTH-1:0]  data_out_tb;
    wire                    vld_out_tb;
    
    reg [DATA_WIDTH-1 : 0] inputs_rom [NUM_SAMPLES-1 : 0];
    reg [DATA_WIDTH-1 : 0] coeffs_rom [NUM_COEFFS-1 : 0];
    
    integer   i; // Loop Counter
    integer f1; // File Handler
    
    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////// Tests ////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////
    
    initial
    begin
        init_task(); // This Task Provides CLK initialization
        rst_task();
        apply_in();
        #1000
        $fclose(f1);
        $stop;
    end
    
    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////// Tasks ////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////
    
    task init_task();
        // No Inputs Or Outputs
        begin
            data_vld_toggle_tb = 1'b0;
            clk_tb_4M          = 1'b1;
            clk_tb_1M          = 1'b1;
            data_in_tb         = {DATA_WIDTH{1'b0}};
            $readmemb("../Reference/Input_Samples.txt", inputs_rom);
            $readmemb("../Reference/coeffs.txt", coeffs_rom);
            h0_tb = coeffs_rom[0];
            h1_tb = coeffs_rom[1];
            h2_tb = coeffs_rom[2];
            h3_tb = coeffs_rom[3];
            f1    = $fopen("ffe_outputs.txt", "w");
        end
    endtask
    
    task rst_task();
        // No Inputs Or Outputs
        begin
            rst_n_tb                      = 1'b1;
            @(negedge clk_tb_4M) rst_n_tb = 1'b0;
            @(negedge clk_tb_4M) rst_n_tb = 1'b1;
        end
    endtask
    
    task apply_in;
        begin
            for(i = 0; i < NUM_SAMPLES; i = i + 1)
            begin
                @(posedge clk_tb_1M);
                data_in_tb         = inputs_rom[i];
                data_vld_toggle_tb = ~data_vld_toggle_tb;
            end
        end
    endtask
    
    always@(posedge vld_out_tb)
    begin
        $fwrite(f1, "%b\n", data_out_tb);
    end
    
    
    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////// CLK Generator ////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////
    
    always #0.125  clk_tb_4M = ~clk_tb_4M;
    
    initial begin
        #0.1
        forever begin
            #0.5    clk_tb_1M = ~clk_tb_1M;
        end
    end
    
    
    ////////////////////////////////////////////////////////////////////////////////////////
    //
    // DUT Instanstiation
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    
    ffe_top #(.INT_WIDTH(INT_WIDTH), .FRACT_WIDTH(FRACT_WIDTH)) DUT (
    .rst_n(rst_n_tb),
    .clk(clk_tb_4M),
    .data_in(data_in_tb),
    .h0(h0_tb),
    .h1(h1_tb),
    .h2(h2_tb),
    .h3(h3_tb),
    .data_vld_toggle(data_vld_toggle_tb),
    .data_out(data_out_tb),
    .vld_out(vld_out_tb)
    );
    
endmodule
