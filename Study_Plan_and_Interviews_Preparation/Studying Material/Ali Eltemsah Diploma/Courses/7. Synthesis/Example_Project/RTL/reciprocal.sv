// File : reciprocal.sv
// Author : Omar Fahmy
// Date : 31/12/2023
// Version : 1
// Abstract : this module calculates the reciprocal of an input sample after a number of iterations. The 
// module has a parameter for the maximum number of iterations (the operation can be completed before
// this number). The minimum allowed value of this parameter is 2. The input signal recip_en should be
// raised high for 1 clock cycle when the input is ready. When processing is completed, the output is
// ready on sample_out signal and the valid signal recip_vld is raised high. You should not input any other
// samples until the output of the current operation is ready. That is, when you raise recip_en and insert
// an input on sample_in, wait until recip_vld is high and the output is ready on sample_out before raising
// recip_en and inserting another input. The block has a maximum latency equal to the number of iterations
// - 1 (can be less if the operation is completed earlier).

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Module ports list, declaration, and data type ///////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

module reciprocal#(parameter IN_INT_WIDTH = 5,
    parameter FRACT_WIDTH = 10,
    parameter MAX_ITERATIONS = 80,
    IN_DATA_WIDTH = IN_INT_WIDTH + FRACT_WIDTH
    ) (
    input wire clk,
    input wire rst_n,
    input wire recip_en,
    input wire signed [IN_DATA_WIDTH-1 : 0] sample_in,
    output wire signed [2*FRACT_WIDTH-1 : 0] sample_out,
    output wire recip_vld
    );

    localparam  IDLE = 1'b0,
                ACTIVE = 1'b1;

    wire signed [IN_DATA_WIDTH-1 : 0] in_mux;
    wire [IN_DATA_WIDTH-1 : 0] in_abs, in_abs_mux;
    reg [IN_DATA_WIDTH-1 : 0] in_abs_reg;
    reg neg_flag;
    wire [IN_DATA_WIDTH-1 : 0] lead_one;
    reg [IN_DATA_WIDTH-1 : 0] bit_rev; // Integer Width = FRACT_WIDTH, fractional width = IN_INT_WIDTH
    wire [2*FRACT_WIDTH-1 : 0] est_min, est_min_mux, est_min_new, est_min_comb;
    wire [2*FRACT_WIDTH : 0] est_max, est_max_mux, est_max_new, est_max_comb;
    reg current_state, next_state;
    reg recip_en_reg;
    reg [$clog2(MAX_ITERATIONS)-1 : 0] iter_counter;
    reg [2*FRACT_WIDTH-1 : 0] est_min_reg;
    reg [2*FRACT_WIDTH : 0] est_max_reg;
    wire iter_counter_en;
    wire [2*FRACT_WIDTH : 0] min_max_add;
    wire [2*FRACT_WIDTH-1 : 0] out_temp, out_temp_mux;
    reg [IN_DATA_WIDTH-1 : 0] in_abs_mux_reg;
    reg [2*FRACT_WIDTH-1 : 0] out_temp_mux_reg, out_temp_reg;
    wire [FRACT_WIDTH : 0] d;
    integer i;
    genvar iv;


    assign in_mux = recip_en ? sample_in : 'd0;

    assign in_abs = in_mux[IN_DATA_WIDTH-1] ? -in_mux : in_mux;

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            in_abs_reg <= 'd0;
        end
        else begin
            if(recip_en) begin
                in_abs_reg <= in_abs;
            end
        end
    end

    // Negative Flag
    assign neg_flag_comb = recip_en ? ( in_mux[IN_DATA_WIDTH-1] ? 1'b1 : 1'b0 ) : neg_flag;
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            neg_flag <= 1'b0;
        end
        else begin
            neg_flag <= neg_flag_comb;
        end
    end

    // Leading One Detector (LOD)
    assign lead_one[IN_DATA_WIDTH-1] = in_abs[IN_DATA_WIDTH-1];
    generate
        for(iv = IN_DATA_WIDTH-2; iv >= 0; iv = iv - 1) begin
            assign lead_one[iv] = !( |in_abs[IN_DATA_WIDTH-1 : iv+1] ) && in_abs[iv];
        end
    endgenerate

    // Bit Reversal
    always@(*) begin
        for(i = 0; i < IN_DATA_WIDTH; i = i + 1) begin
            bit_rev[i] = lead_one[IN_DATA_WIDTH - 1 - i];
        end
    end

    // Minimum Estimation
    generate
        if(IN_INT_WIDTH < FRACT_WIDTH) begin
            assign est_min = {bit_rev, {FRACT_WIDTH-IN_INT_WIDTH{1'b0}}};
        end
        else begin
            assign est_min = bit_rev[IN_DATA_WIDTH-1 : IN_INT_WIDTH - FRACT_WIDTH];
        end
    endgenerate

    // Maximum Estimation
    assign est_max = est_min << 1;

    // Current State Sequential Always
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    assign d_unity = d[FRACT_WIDTH] && ~(|d[FRACT_WIDTH-1 : 0]);
    assign max_iter = (iter_counter == MAX_ITERATIONS - 1);
    assign bef_max_iter = (iter_counter == MAX_ITERATIONS - 2);
    assign op_done = max_iter || d_unity;

    // Next State Combinational Always
    always@(*) begin
        next_state = current_state;
        case (current_state)
            IDLE:
                if(recip_en_reg && !op_done) begin
                    next_state = ACTIVE;
                end
            ACTIVE:
                if(op_done) begin
                    next_state = IDLE;
                end
        endcase
    end

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            recip_en_reg <= 1'b0;
        end
        else begin
            recip_en_reg <= recip_en;
        end
    end

    // Iterations Counter
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            iter_counter <= 'd0;
        end
        else begin
            if(iter_counter_en) begin
                iter_counter <= iter_counter + 'd1;
            end
            else begin
                iter_counter <= 'd0;
            end
        end
    end
    assign iter_counter_en = (next_state == ACTIVE);

    assign est_max_mux = recip_en ? est_max : est_max_new;
    assign est_min_mux = recip_en ? est_min : est_min_new;

    assign min_max_add = est_max_mux + est_min_mux;

    assign out_temp = min_max_add >> 1;

    assign out_temp_mux = bef_max_iter ? 'd0 : out_temp;

    assign in_abs_mux = recip_en ? in_abs : in_abs_reg;

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            out_temp_mux_reg <= 'd0;
            in_abs_mux_reg <= 'd0;
        end
        else begin
            out_temp_mux_reg <= out_temp_mux;
            in_abs_mux_reg <= in_abs_mux;
        end
    end

    mul #(
        .IN1_INT_WIDTH(FRACT_WIDTH),
        .IN1_FRACT_WIDTH(FRACT_WIDTH),
        .IN2_INT_WIDTH(IN_INT_WIDTH),
        .IN2_FRACT_WIDTH(FRACT_WIDTH),
        .OUT_INT_WIDTH(1),
        .OUT_FRACT_WIDTH(FRACT_WIDTH))
    U0_mul (
        .in1(out_temp_mux_reg),
        .in2(in_abs_mux_reg),
        .out(d));

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            out_temp_reg <= 'd0;
        end
        else begin
            out_temp_reg <= out_temp;
        end
    end

    assign sample_out = neg_flag ? -out_temp_reg : out_temp_reg;

    assign est_max_comb = recip_en ? est_max : est_max_new;
    assign est_min_comb = recip_en ? est_min : est_min_new;

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            est_max_reg <= 'd0;
            est_min_reg <= 'd0;
        end
        else begin
            est_max_reg <= est_max_comb;
            est_min_reg <= est_min_comb;
        end
    end

    assign est_max_new = (d[FRACT_WIDTH]) ? out_temp_reg : est_max_reg;
    assign est_min_new = (d[FRACT_WIDTH]) ? est_min_reg : out_temp_reg;

    assign recip_vld = op_done;

endmodule