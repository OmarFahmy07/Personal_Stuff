// File : mul.sv
// Author : Omar Fahmy
// Date : 15/2/2023
// Version : 1
// Abstract : this module implements a parameterized fixed-point multiplier

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////// Module ports list, declaration, and data type ///////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

module mul #(parameter IN1_INT_WIDTH = 8,
                    parameter IN1_FRACT_WIDTH = 6,
                    parameter IN2_INT_WIDTH = 8,
                    parameter IN2_FRACT_WIDTH = 6,
                    parameter OUT_INT_WIDTH = 6,
                    parameter OUT_FRACT_WIDTH = 8,
                    IN1_DATA_WIDTH = IN1_INT_WIDTH + IN1_FRACT_WIDTH,
                    IN2_DATA_WIDTH = IN2_INT_WIDTH + IN2_FRACT_WIDTH,
                    OUT_DATA_WIDTH = OUT_INT_WIDTH + OUT_FRACT_WIDTH)
                    (input wire signed [IN1_DATA_WIDTH-1 : 0] in1,
                    input wire signed [IN2_DATA_WIDTH-1 : 0] in2,
                    output wire signed [OUT_DATA_WIDTH-1 : 0] out);
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////// Signals and Internal Connections ///////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    wire signed [IN1_DATA_WIDTH+IN2_DATA_WIDTH-1 : 0] out_bef_trunc;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////// Combinational Logic ////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
        assign out_bef_trunc = in1 * in2;
        assign out = out_bef_trunc[IN1_FRACT_WIDTH + IN2_FRACT_WIDTH + OUT_INT_WIDTH -1 : IN1_FRACT_WIDTH + IN2_FRACT_WIDTH - OUT_FRACT_WIDTH];

endmodule