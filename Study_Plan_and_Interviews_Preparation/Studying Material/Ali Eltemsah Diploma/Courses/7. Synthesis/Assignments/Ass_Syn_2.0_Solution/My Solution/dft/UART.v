/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 12 21:07:31 2022
/////////////////////////////////////////////////////////////


module mux_2X1_0 ( I0, I1, sel, out );
  input I0, I1, sel;
  output out;


  MX2X6M U1 ( .A(I0), .B(I1), .S0(sel), .Y(out) );
endmodule


module mux_2X1_2 ( I0, I1, sel, out );
  input I0, I1, sel;
  output out;


  MX2X6M U1 ( .A(I0), .B(I1), .S0(sel), .Y(out) );
endmodule


module mux_2X1_1 ( I0, I1, sel, out );
  input I0, I1, sel;
  output out;


  MX2X6M U1 ( .A(I0), .B(I1), .S0(sel), .Y(out) );
endmodule


module UART_Tx_FSM_test_1 ( Data_Valid, PAR_EN, ser_done, clk, rst, ser_load, 
        ser_en, parity_load, mux_sel, busy, test_si, test_so, test_se );
  output [2:0] mux_sel;
  input Data_Valid, PAR_EN, ser_done, clk, rst, test_si, test_se;
  output ser_load, ser_en, parity_load, busy, test_so;
  wire   busy_comb, n9, n10, n11, n22, ser_load, n5, n6, n7, n12, n13, n21,
         n26, n27, n28, n29, n30, n31;
  wire   [2:0] current_state;
  assign parity_load = ser_load;
  assign test_so = n6;

  SDFFRQX1M \current_state_reg[0]  ( .D(mux_sel[0]), .SI(n30), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[0]) );
  CLKINVX1M U7 ( .A(n26), .Y(n13) );
  INVX2M U8 ( .A(current_state[1]), .Y(n12) );
  INVX2M U9 ( .A(n5), .Y(n6) );
  OAI32X2M U11 ( .A0(n5), .A1(current_state[0]), .A2(n12), .B0(n6), .B1(n13), 
        .Y(n11) );
  INVXLM U12 ( .A(n22), .Y(n7) );
  INVX2M U13 ( .A(n7), .Y(ser_en) );
  AOI211X2M U14 ( .A0(n13), .A1(ser_done), .B0(n21), .C0(current_state[2]), 
        .Y(n22) );
  NOR2X2M U21 ( .A(n9), .B(mux_sel[1]), .Y(ser_load) );
  INVX2M U22 ( .A(n9), .Y(mux_sel[0]) );
  NAND2BX2M U23 ( .AN(mux_sel[1]), .B(n9), .Y(busy_comb) );
  NOR3X4M U24 ( .A(n12), .B(n6), .C(n10), .Y(mux_sel[2]) );
  AOI2B1X1M U25 ( .A1N(PAR_EN), .A0(ser_done), .B0(n21), .Y(n10) );
  AOI21X4M U26 ( .A0(Data_Valid), .A1(n11), .B0(ser_en), .Y(n9) );
  INVX2M U27 ( .A(current_state[0]), .Y(n21) );
  AOI21X6M U28 ( .A0(n21), .A1(n12), .B0(n6), .Y(mux_sel[1]) );
  DLY1X1M U31 ( .A(n31), .Y(n28) );
  INVXLM U34 ( .A(n29), .Y(n31) );
  SDFFRX1M \current_state_reg[1]  ( .D(mux_sel[1]), .SI(n21), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[1]), .QN(n26) );
  SDFFRX1M busy_reg ( .D(busy_comb), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .QN(n29) );
  SDFFRX1M \current_state_reg[2]  ( .D(mux_sel[2]), .SI(n12), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[2]), .QN(n5) );
  CLKINVX40M U3 ( .A(n27), .Y(busy) );
  INVX32M U4 ( .A(n27), .Y(n30) );
  CLKINVX2M U5 ( .A(n28), .Y(n27) );
endmodule


module serializer_test_1 ( data_in, load, enable, clk, rst, done, data_out, 
        test_si, test_so, test_se );
  input [7:0] data_in;
  input load, enable, clk, rst, test_si, test_se;
  output done, data_out, test_so;
  wire   \counter[0] , N12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n13, n36, n37,
         n38, n39, n52, n53, n57, n1, n2, n3, n4;
  wire   [2:0] counter_comb;
  wire   [7:1] shift_reg;
  assign test_so = shift_reg[7];

  XNOR2X2M U16 ( .A(n4), .B(n39), .Y(n26) );
  INVX2M U18 ( .A(n13), .Y(done) );
  INVX2M U19 ( .A(n2), .Y(n37) );
  INVX2M U21 ( .A(n38), .Y(n39) );
  NAND2XLM U22 ( .A(n39), .B(n4), .Y(n23) );
  AND3XLM U23 ( .A(n37), .B(n57), .C(n39), .Y(N12) );
  NOR2X2M U36 ( .A(n24), .B(n4), .Y(counter_comb[0]) );
  NOR2X8M U37 ( .A(n53), .B(n52), .Y(n16) );
  CLKBUFX6M U38 ( .A(load), .Y(n52) );
  CLKBUFX6M U39 ( .A(n14), .Y(n53) );
  NOR2X1M U40 ( .A(n52), .B(enable), .Y(n14) );
  OAI2BB1X2M U41 ( .A0N(n53), .A1N(shift_reg[6]), .B0(n17), .Y(n29) );
  AOI22X1M U42 ( .A0(shift_reg[7]), .A1(n16), .B0(data_in[6]), .B1(n52), .Y(
        n17) );
  OAI2BB1X2M U43 ( .A0N(n53), .A1N(shift_reg[2]), .B0(n21), .Y(n33) );
  AOI22X1M U44 ( .A0(shift_reg[3]), .A1(n16), .B0(data_in[2]), .B1(n52), .Y(
        n21) );
  OAI2BB1X2M U45 ( .A0N(n53), .A1N(shift_reg[3]), .B0(n20), .Y(n32) );
  AOI22X1M U46 ( .A0(shift_reg[4]), .A1(n16), .B0(data_in[3]), .B1(n52), .Y(
        n20) );
  OAI2BB1X2M U47 ( .A0N(n53), .A1N(shift_reg[4]), .B0(n19), .Y(n31) );
  AOI22X1M U48 ( .A0(shift_reg[5]), .A1(n16), .B0(data_in[4]), .B1(n52), .Y(
        n19) );
  OAI2BB1X2M U49 ( .A0N(data_out), .A1N(n53), .B0(n15), .Y(n27) );
  AOI22X1M U50 ( .A0(shift_reg[1]), .A1(n16), .B0(n52), .B1(data_in[0]), .Y(
        n15) );
  OAI2BB1X2M U51 ( .A0N(shift_reg[1]), .A1N(n53), .B0(n22), .Y(n34) );
  AOI22X1M U52 ( .A0(shift_reg[2]), .A1(n16), .B0(data_in[1]), .B1(n52), .Y(
        n22) );
  OAI2BB1X2M U53 ( .A0N(n53), .A1N(shift_reg[5]), .B0(n18), .Y(n30) );
  AOI22X1M U54 ( .A0(shift_reg[6]), .A1(n16), .B0(data_in[5]), .B1(n52), .Y(
        n18) );
  AO22X1M U55 ( .A0(n53), .A1(shift_reg[7]), .B0(data_in[7]), .B1(n52), .Y(n28) );
  OAI32X2M U56 ( .A0(n23), .A1(n37), .A2(n24), .B0(n25), .B1(n2), .Y(
        counter_comb[2]) );
  AOI2BB1X2M U57 ( .A0N(n24), .A1N(n39), .B0(counter_comb[0]), .Y(n25) );
  NAND2BX2M U58 ( .AN(done), .B(enable), .Y(n24) );
  NOR2X2M U59 ( .A(n26), .B(n24), .Y(counter_comb[1]) );
  DLY1X1M U60 ( .A(n4), .Y(n57) );
  SDFFRX1M done_reg ( .D(N12), .SI(n2), .SE(test_se), .CK(clk), .RN(rst), .QN(
        n13) );
  SDFFRX1M \counter_reg[1]  ( .D(counter_comb[1]), .SI(n57), .SE(test_se), 
        .CK(clk), .RN(rst), .QN(n38) );
  SDFFRX1M \counter_reg[0]  ( .D(counter_comb[0]), .SI(test_si), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(\counter[0] ) );
  SDFFRX1M \counter_reg[2]  ( .D(counter_comb[2]), .SI(n39), .SE(test_se), 
        .CK(clk), .RN(rst), .QN(n36) );
  SDFFRX1M \shift_reg_reg[7]  ( .D(n28), .SI(shift_reg[6]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[7]) );
  SDFFRX1M \shift_reg_reg[5]  ( .D(n30), .SI(shift_reg[4]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[5]) );
  SDFFRX1M \shift_reg_reg[4]  ( .D(n31), .SI(shift_reg[3]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[4]) );
  SDFFRX1M \shift_reg_reg[3]  ( .D(n32), .SI(shift_reg[2]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[3]) );
  SDFFRX1M \shift_reg_reg[2]  ( .D(n33), .SI(shift_reg[1]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[2]) );
  SDFFRX1M \shift_reg_reg[1]  ( .D(n34), .SI(data_out), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(shift_reg[1]) );
  SDFFRX1M \shift_reg_reg[6]  ( .D(n29), .SI(shift_reg[5]), .SE(test_se), .CK(
        clk), .RN(rst), .Q(shift_reg[6]) );
  SDFFRX1M \shift_reg_reg[0]  ( .D(n27), .SI(done), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(data_out) );
  INVXLM U3 ( .A(n36), .Y(n1) );
  INVX2M U4 ( .A(n1), .Y(n2) );
  INVXLM U5 ( .A(\counter[0] ), .Y(n3) );
  INVX2M U6 ( .A(n3), .Y(n4) );
endmodule


module Parity_Calc_test_1 ( rst, clk, data_in, load, type, parity_result, 
        test_si, test_se );
  input [7:0] data_in;
  input rst, clk, load, type, test_si, test_se;
  output parity_result;
  wire   n1, n3, n4, n5, n6, n8, n9;

  OAI2BB2X1M U3 ( .B0(n1), .B1(n9), .A0N(parity_result), .A1N(n9), .Y(n8) );
  INVX2M U4 ( .A(load), .Y(n9) );
  XOR3XLM U5 ( .A(n3), .B(type), .C(n4), .Y(n1) );
  XOR3XLM U6 ( .A(data_in[1]), .B(data_in[0]), .C(n5), .Y(n4) );
  XNOR2X2M U7 ( .A(data_in[3]), .B(data_in[2]), .Y(n5) );
  XOR3XLM U8 ( .A(data_in[5]), .B(data_in[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U10 ( .A(data_in[7]), .B(data_in[6]), .Y(n6) );
  SDFFRX1M parity_result_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(parity_result) );
endmodule


module MUX_8x1_test_1 ( clk, rst, sel, data, out, test_se );
  input [2:0] sel;
  input [7:0] data;
  input clk, rst, test_se;
  output out;
  wire   out_comb, n2, n7, n5, n6, n1, n4;

  MX2X2M U7 ( .A(n6), .B(n5), .S0(sel[2]), .Y(out_comb) );
  MX4X1M U8 ( .A(data[4]), .B(data[5]), .C(data[6]), .D(data[7]), .S0(sel[0]), 
        .S1(sel[1]), .Y(n5) );
  MX4X1M U9 ( .A(data[0]), .B(data[1]), .C(data[2]), .D(data[3]), .S0(sel[0]), 
        .S1(sel[1]), .Y(n6) );
  SDFFSX1M out_reg ( .D(out_comb), .SI(data[2]), .SE(test_se), .CK(clk), .SN(
        rst), .QN(n2) );
  CLKINVX1M U3 ( .A(n4), .Y(n1) );
  CLKINVX40M U4 ( .A(n1), .Y(out) );
  INVXLM U5 ( .A(n7), .Y(n4) );
  CLKBUFX1M U6 ( .A(n2), .Y(n7) );
endmodule


module UART_Tx_test_1 ( CLK, RST, PAR_TYP, PAR_EN, P_DATA, DATA_VALID, TX_OUT, 
        Busy, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, DATA_VALID, test_si, test_se;
  output TX_OUT, Busy;
  wire   ser_done, ser_load, ser_en, parity_load, ser_data_out, parity_result,
         n1, n2;
  wire   [2:0] mux_sel;

  UART_Tx_FSM_test_1 U0 ( .Data_Valid(DATA_VALID), .PAR_EN(PAR_EN), .ser_done(
        ser_done), .clk(CLK), .rst(RST), .ser_load(ser_load), .ser_en(ser_en), 
        .parity_load(parity_load), .mux_sel(mux_sel), .busy(Busy), .test_si(
        test_si), .test_so(n2), .test_se(test_se) );
  serializer_test_1 U1 ( .data_in(P_DATA), .load(ser_load), .enable(ser_en), 
        .clk(CLK), .rst(RST), .done(ser_done), .data_out(ser_data_out), 
        .test_si(n2), .test_so(n1), .test_se(test_se) );
  Parity_Calc_test_1 U2 ( .rst(RST), .clk(CLK), .data_in(P_DATA), .load(
        parity_load), .type(PAR_TYP), .parity_result(parity_result), .test_si(
        n1), .test_se(test_se) );
  MUX_8x1_test_1 U3 ( .clk(CLK), .rst(RST), .sel(mux_sel), .data({1'b1, 1'b1, 
        1'b1, 1'b1, ser_data_out, parity_result, 1'b0, 1'b1}), .out(TX_OUT), 
        .test_se(test_se) );
endmodule


module UART_Rx_FSM_test_1 ( clock, reset, data_in, parity_en, bit_counter, 
        edge_counter, prescale, start_glitch, parity_error, stop_error, 
        counter_en, deserializer_en, start_check_en, parity_check_en, 
        stop_check_en, data_valid, test_si, test_se );
  input [3:0] bit_counter;
  input [5:0] edge_counter;
  input [5:0] prescale;
  input clock, reset, data_in, parity_en, start_glitch, parity_error,
         stop_error, test_si, test_se;
  output counter_en, deserializer_en, start_check_en, parity_check_en,
         stop_check_en, data_valid;
  wire   n62, N33, N34, N35, N36, N37, N52, N53, N54, N55, N56, N57, N58, N59,
         N75, N77, N79, N81, \add_80/carry[5] , \add_80/carry[4] ,
         \add_80/carry[3] , \add_80/carry[2] , \add_223/carry[4] ,
         \add_223/carry[3] , \add_223/carry[2] , n1, n2, n3, n4, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n65, n5, n18;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [5:0] third_sample_edge;
  assign deserializer_en = N75;
  assign start_check_en = N77;
  assign parity_check_en = N79;
  assign stop_check_en = N81;

  NOR3X2M U5 ( .A(n23), .B(stop_error), .C(counter_en), .Y(n1) );
  NOR3X2M U6 ( .A(n54), .B(current_state[0]), .C(n25), .Y(N79) );
  NOR4X2M U7 ( .A(n22), .B(n17), .C(n16), .D(n15), .Y(N59) );
  INVX4M U9 ( .A(current_state[0]), .Y(n30) );
  NOR3X2M U10 ( .A(n54), .B(n25), .C(n30), .Y(N75) );
  AOI2BB2X2M U13 ( .B0(n33), .B1(n32), .A0N(data_in), .A1N(current_state[0]), 
        .Y(n36) );
  NOR2X3M U14 ( .A(n30), .B(n3), .Y(n33) );
  OAI21X2M U15 ( .A0(N59), .A1(n26), .B0(n31), .Y(next_state[1]) );
  OR2X4M U16 ( .A(next_state[0]), .B(next_state[1]), .Y(counter_en) );
  NOR3BX4M U17 ( .AN(n33), .B(n65), .C(n54), .Y(N77) );
  NAND4X4M U18 ( .A(n55), .B(n56), .C(n57), .D(n58), .Y(n54) );
  OAI2BB1X2M U19 ( .A0N(parity_error), .A1N(parity_en), .B0(next_state[2]), 
        .Y(n23) );
  OAI32X4M U20 ( .A0(n30), .A1(n27), .A2(n25), .B0(n18), .B1(n36), .Y(
        next_state[0]) );
  INVXLM U21 ( .A(current_state[2]), .Y(n2) );
  INVX2M U22 ( .A(n2), .Y(n3) );
  CLKINVX1M U23 ( .A(n62), .Y(n4) );
  CLKINVX40M U24 ( .A(n4), .Y(data_valid) );
  NOR3X2M U25 ( .A(n35), .B(bit_counter[2]), .C(bit_counter[1]), .Y(n45) );
  NOR2BX2M U26 ( .AN(n18), .B(n3), .Y(n34) );
  OAI21X2M U27 ( .A0(n24), .A1(n25), .B0(n26), .Y(next_state[2]) );
  NAND3X2M U28 ( .A(n18), .B(n30), .C(n3), .Y(n26) );
  NOR2X2M U29 ( .A(n9), .B(prescale[5]), .Y(N58) );
  NAND2BX2M U30 ( .AN(prescale[1]), .B(N52), .Y(n6) );
  OR2X2M U31 ( .A(n8), .B(prescale[4]), .Y(n9) );
  OR2X2M U32 ( .A(n6), .B(prescale[2]), .Y(n7) );
  OR2X2M U33 ( .A(n7), .B(prescale[3]), .Y(n8) );
  OAI2BB1XLM U34 ( .A0N(n6), .A1N(prescale[2]), .B0(n7), .Y(N54) );
  CLKINVX2M U35 ( .A(n34), .Y(n25) );
  OAI2BB1XLM U36 ( .A0N(n8), .A1N(prescale[4]), .B0(n9), .Y(N56) );
  NAND4X2M U37 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n35) );
  NAND4X2M U38 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n32) );
  NOR3X2M U39 ( .A(n50), .B(n51), .C(n52), .Y(n49) );
  OAI2BB1XLM U40 ( .A0N(n7), .A1N(prescale[3]), .B0(n8), .Y(N55) );
  NOR3X2M U43 ( .A(n59), .B(n60), .C(n61), .Y(n58) );
  ADDHX2M U44 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_223/carry[2] ), .S(
        third_sample_edge[1]) );
  ADDHX2M U45 ( .A(prescale[3]), .B(\add_223/carry[2] ), .CO(
        \add_223/carry[3] ), .S(third_sample_edge[2]) );
  ADDHX2M U46 ( .A(prescale[4]), .B(\add_223/carry[3] ), .CO(
        \add_223/carry[4] ), .S(third_sample_edge[3]) );
  ADDHX2M U47 ( .A(prescale[5]), .B(\add_223/carry[4] ), .CO(
        third_sample_edge[5]), .S(third_sample_edge[4]) );
  ADDHX1M U48 ( .A(third_sample_edge[1]), .B(third_sample_edge[0]), .CO(
        \add_80/carry[2] ), .S(N33) );
  ADDHX1M U49 ( .A(third_sample_edge[2]), .B(\add_80/carry[2] ), .CO(
        \add_80/carry[3] ), .S(N34) );
  ADDHX1M U50 ( .A(third_sample_edge[3]), .B(\add_80/carry[3] ), .CO(
        \add_80/carry[4] ), .S(N35) );
  ADDHX1M U51 ( .A(third_sample_edge[4]), .B(\add_80/carry[4] ), .CO(
        \add_80/carry[5] ), .S(N36) );
  INVX2M U52 ( .A(prescale[0]), .Y(N52) );
  INVX2M U53 ( .A(prescale[1]), .Y(third_sample_edge[0]) );
  CLKXOR2X2M U55 ( .A(\add_80/carry[5] ), .B(third_sample_edge[5]), .Y(N37) );
  OAI2BB1X1M U56 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n6), .Y(N53) );
  AO21XLM U57 ( .A0(n9), .A1(prescale[5]), .B0(N58), .Y(N57) );
  OAI2B2X1M U58 ( .A1N(edge_counter[1]), .A0(n10), .B0(N53), .B1(n10), .Y(n14)
         );
  XNOR2X1M U59 ( .A(N57), .B(edge_counter[5]), .Y(n13) );
  OAI2B2X1M U60 ( .A1N(N53), .A0(n11), .B0(edge_counter[1]), .B1(n11), .Y(n12)
         );
  NAND4BX1M U61 ( .AN(N58), .B(n14), .C(n13), .D(n12), .Y(n22) );
  CLKXOR2X2M U62 ( .A(N56), .B(edge_counter[4]), .Y(n17) );
  CLKXOR2X2M U64 ( .A(N55), .B(edge_counter[3]), .Y(n15) );
  AOI22X1M U65 ( .A0(n27), .A1(n28), .B0(n29), .B1(n30), .Y(n24) );
  CLKINVX1M U66 ( .A(parity_en), .Y(n28) );
  AOI31X1M U67 ( .A0(n29), .A1(n32), .A2(n33), .B0(n34), .Y(n31) );
  CLKINVX1M U68 ( .A(n35), .Y(n29) );
  CLKXOR2X2M U70 ( .A(edge_counter[1]), .B(N33), .Y(n41) );
  CLKXOR2X2M U71 ( .A(n44), .B(N36), .Y(n39) );
  CLKINVX1M U72 ( .A(edge_counter[4]), .Y(n44) );
  XNOR2X1M U73 ( .A(edge_counter[5]), .B(N37), .Y(n38) );
  XNOR2X1M U74 ( .A(edge_counter[3]), .B(N35), .Y(n37) );
  AND3X1M U75 ( .A(bit_counter[3]), .B(bit_counter[0]), .C(n45), .Y(n27) );
  CLKXOR2X2M U76 ( .A(prescale[4]), .B(edge_counter[4]), .Y(n52) );
  CLKXOR2X2M U77 ( .A(prescale[1]), .B(edge_counter[1]), .Y(n51) );
  CLKXOR2X2M U79 ( .A(n53), .B(prescale[2]), .Y(n48) );
  XNOR2X1M U80 ( .A(edge_counter[3]), .B(prescale[3]), .Y(n47) );
  XNOR2X1M U81 ( .A(edge_counter[5]), .B(prescale[5]), .Y(n46) );
  NOR2X1M U82 ( .A(n26), .B(n54), .Y(N81) );
  CLKXOR2X2M U83 ( .A(third_sample_edge[4]), .B(edge_counter[4]), .Y(n61) );
  CLKXOR2X2M U84 ( .A(third_sample_edge[1]), .B(edge_counter[1]), .Y(n60) );
  CLKXOR2X2M U86 ( .A(n53), .B(third_sample_edge[2]), .Y(n57) );
  CLKINVX1M U87 ( .A(edge_counter[2]), .Y(n53) );
  XNOR2X1M U88 ( .A(edge_counter[3]), .B(third_sample_edge[3]), .Y(n56) );
  XNOR2X1M U89 ( .A(edge_counter[5]), .B(third_sample_edge[5]), .Y(n55) );
  DLY1X1M U90 ( .A(n18), .Y(n65) );
  SDFFRQX1M \current_state_reg[2]  ( .D(next_state[2]), .SI(n65), .SE(test_se), 
        .CK(clock), .RN(reset), .Q(current_state[2]) );
  SDFFRQX1M data_valid_reg ( .D(n1), .SI(n3), .SE(test_se), .CK(clock), .RN(
        reset), .Q(n62) );
  SDFFRHQX1M \current_state_reg[1]  ( .D(next_state[1]), .SI(n30), .SE(test_se), .CK(clock), .RN(reset), .Q(current_state[1]) );
  SDFFRHQX1M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clock), .RN(reset), .Q(current_state[0]) );
  CLKXOR2X2M U3 ( .A(prescale[0]), .B(edge_counter[0]), .Y(n50) );
  NOR4BX2M U4 ( .AN(start_glitch), .B(n41), .C(n42), .D(n43), .Y(n40) );
  CLKXOR2X2M U8 ( .A(edge_counter[2]), .B(N34), .Y(n42) );
  XNOR2X2M U11 ( .A(edge_counter[0]), .B(third_sample_edge[0]), .Y(n43) );
  CLKXOR2X2M U12 ( .A(third_sample_edge[0]), .B(edge_counter[0]), .Y(n59) );
  CLKXOR2X2M U41 ( .A(N54), .B(edge_counter[2]), .Y(n16) );
  NOR2BX2M U42 ( .AN(N52), .B(edge_counter[0]), .Y(n10) );
  NOR2BX2M U54 ( .AN(edge_counter[0]), .B(N52), .Y(n11) );
  INVXLM U63 ( .A(current_state[1]), .Y(n5) );
  INVX2M U69 ( .A(n5), .Y(n18) );
endmodule


module data_sampling_test_1 ( clock, reset, edge_counter, data_in, prescale, 
        data_out, test_si, test_so, test_se );
  input [5:0] edge_counter;
  input [5:0] prescale;
  input clock, reset, data_in, test_si, test_se;
  output data_out, test_so;
  wire   sample1, sample2, sample3, N1, N2, N3, N4, N5, N7, N8, N9, N10, N11,
         N12, N13, N14, N15, n3, n5, n7, n9, \sub_35/carry[4] ,
         \sub_35/carry[3] , n1, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38;
  assign N1 = prescale[1];

  NOR2X2M U3 ( .A(prescale[5]), .B(\sub_35/carry[4] ), .Y(n1) );
  NOR4X2M U6 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N15) );
  NOR3X4M U8 ( .A(prescale[4]), .B(prescale[5]), .C(n11), .Y(N13) );
  OR2X2M U9 ( .A(n10), .B(prescale[3]), .Y(n11) );
  NAND2BX2M U13 ( .AN(prescale[2]), .B(N8), .Y(n10) );
  OAI2BB1XLM U14 ( .A0N(n10), .A1N(prescale[3]), .B0(n11), .Y(N10) );
  OAI21X4M U21 ( .A0(n38), .A1(n37), .B0(n3), .Y(data_out) );
  INVX2M U22 ( .A(N1), .Y(N8) );
  INVX2M U23 ( .A(prescale[2]), .Y(N2) );
  OAI2BB2X1M U24 ( .B0(N14), .B1(n37), .A0N(data_in), .A1N(N14), .Y(n9) );
  OAI2BB2X1M U25 ( .B0(N7), .B1(n38), .A0N(N7), .A1N(data_in), .Y(n5) );
  AO2B2XLM U26 ( .B0(data_in), .B1(N15), .A0(test_so), .A1N(N15), .Y(n7) );
  OAI21X2M U27 ( .A0(sample1), .A1(sample2), .B0(sample3), .Y(n3) );
  INVX2M U28 ( .A(sample2), .Y(n37) );
  INVX2M U29 ( .A(sample1), .Y(n38) );
  XNOR2X1M U30 ( .A(\sub_35/carry[4] ), .B(prescale[5]), .Y(N5) );
  OR2X1M U31 ( .A(prescale[4]), .B(\sub_35/carry[3] ), .Y(\sub_35/carry[4] )
         );
  XNOR2X1M U32 ( .A(\sub_35/carry[3] ), .B(prescale[4]), .Y(N4) );
  OR2X1M U33 ( .A(prescale[3]), .B(prescale[2]), .Y(\sub_35/carry[3] ) );
  XNOR2X1M U34 ( .A(prescale[2]), .B(prescale[3]), .Y(N3) );
  OAI2BB1X1M U35 ( .A0N(N1), .A1N(prescale[2]), .B0(n10), .Y(N9) );
  XNOR2X1M U36 ( .A(prescale[4]), .B(n11), .Y(N11) );
  OAI21X1M U37 ( .A0(prescale[4]), .A1(n11), .B0(prescale[5]), .Y(n12) );
  NAND2BX1M U38 ( .AN(N13), .B(n12), .Y(N12) );
  OAI2B2X1M U39 ( .A1N(N2), .A0(n13), .B0(edge_counter[1]), .B1(n13), .Y(n16)
         );
  OAI2B2X1M U40 ( .A1N(edge_counter[1]), .A0(n30), .B0(N2), .B1(n30), .Y(n15)
         );
  NAND4BBX1M U41 ( .AN(n1), .BN(edge_counter[5]), .C(n16), .D(n15), .Y(n20) );
  CLKXOR2X2M U42 ( .A(N5), .B(edge_counter[4]), .Y(n19) );
  CLKXOR2X2M U44 ( .A(N4), .B(edge_counter[3]), .Y(n17) );
  OAI2B2X1M U45 ( .A1N(N9), .A0(n21), .B0(edge_counter[1]), .B1(n21), .Y(n24)
         );
  OAI2B2X1M U46 ( .A1N(edge_counter[1]), .A0(n22), .B0(N9), .B1(n22), .Y(n23)
         );
  NAND4BBX1M U47 ( .AN(N13), .BN(edge_counter[5]), .C(n24), .D(n23), .Y(n28)
         );
  CLKXOR2X2M U48 ( .A(N12), .B(edge_counter[4]), .Y(n27) );
  CLKXOR2X2M U50 ( .A(N11), .B(edge_counter[3]), .Y(n25) );
  OAI2B2X1M U51 ( .A1N(prescale[2]), .A0(n29), .B0(edge_counter[1]), .B1(n29), 
        .Y(n32) );
  OAI2B2X1M U52 ( .A1N(edge_counter[1]), .A0(n14), .B0(prescale[2]), .B1(n14), 
        .Y(n31) );
  NAND3BX1M U53 ( .AN(edge_counter[5]), .B(n32), .C(n31), .Y(n36) );
  CLKXOR2X2M U54 ( .A(prescale[5]), .B(edge_counter[4]), .Y(n35) );
  CLKXOR2X2M U56 ( .A(prescale[4]), .B(edge_counter[3]), .Y(n33) );
  DLY1X1M U57 ( .A(sample3), .Y(test_so) );
  SDFFRQX1M sample3_reg ( .D(n7), .SI(n37), .SE(test_se), .CK(clock), .RN(
        reset), .Q(sample3) );
  SDFFRQX1M sample2_reg ( .D(n9), .SI(n38), .SE(test_se), .CK(clock), .RN(
        reset), .Q(sample2) );
  SDFFRHQX1M sample1_reg ( .D(n5), .SI(test_si), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(sample1) );
  NOR4X4M U4 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N14) );
  CLKXOR2X2M U5 ( .A(N10), .B(edge_counter[2]), .Y(n26) );
  NOR4X4M U7 ( .A(n20), .B(n19), .C(n18), .D(n17), .Y(N7) );
  CLKXOR2X2M U10 ( .A(N3), .B(edge_counter[2]), .Y(n18) );
  CLKXOR2X2M U11 ( .A(prescale[3]), .B(edge_counter[2]), .Y(n34) );
  NOR2BX2M U12 ( .AN(N8), .B(edge_counter[0]), .Y(n22) );
  NOR2BX2M U15 ( .AN(edge_counter[0]), .B(N8), .Y(n21) );
  NOR2BX2M U16 ( .AN(edge_counter[0]), .B(N1), .Y(n13) );
  NOR2BX2M U17 ( .AN(edge_counter[0]), .B(N1), .Y(n29) );
  NOR2BX2M U18 ( .AN(N1), .B(edge_counter[0]), .Y(n14) );
  NOR2BX2M U19 ( .AN(N1), .B(edge_counter[0]), .Y(n30) );
endmodule


module deserializer_test_1 ( enable, clock, reset, data_in, shift_reg, test_si, 
        test_so, test_se );
  output [7:0] shift_reg;
  input enable, clock, reset, data_in, test_si, test_se;
  output test_so;
  wire   n29, n30, n31, n10, n12, n14, n16, n18, n20, n22, n24, n4, n5, n6, n7,
         n8, n25, n26, n27, n28, n35, n36;

  BUFX2M U2 ( .A(n31), .Y(shift_reg[2]) );
  BUFX2M U3 ( .A(n29), .Y(shift_reg[6]) );
  INVX2M U4 ( .A(shift_reg[2]), .Y(n27) );
  INVX2M U5 ( .A(shift_reg[6]), .Y(n7) );
  INVX2M U6 ( .A(n30), .Y(n25) );
  CLKBUFX1M U7 ( .A(n30), .Y(shift_reg[4]) );
  OAI22X1M U8 ( .A0(n5), .A1(n6), .B0(n4), .B1(n7), .Y(n22) );
  OAI22X1M U9 ( .A0(n5), .A1(n36), .B0(n4), .B1(n27), .Y(n14) );
  OAI22X1M U10 ( .A0(n5), .A1(n35), .B0(n4), .B1(n25), .Y(n18) );
  CLKINVX2M U11 ( .A(shift_reg[1]), .Y(n28) );
  OAI2BB2X1M U12 ( .B0(n5), .B1(n28), .A0N(shift_reg[0]), .A1N(n5), .Y(n10) );
  INVX4M U13 ( .A(n4), .Y(n5) );
  OAI22X1M U14 ( .A0(n5), .A1(n25), .B0(n4), .B1(n26), .Y(n16) );
  OAI22X1M U15 ( .A0(n5), .A1(n27), .B0(n4), .B1(n28), .Y(n12) );
  OAI22X1M U16 ( .A0(n5), .A1(n7), .B0(n4), .B1(n8), .Y(n20) );
  OAI2BB2X1M U17 ( .B0(n4), .B1(test_so), .A0N(data_in), .A1N(n4), .Y(n24) );
  CLKBUFX6M U26 ( .A(enable), .Y(n4) );
  CLKINVX1M U27 ( .A(shift_reg[3]), .Y(n26) );
  CLKINVX1M U28 ( .A(shift_reg[5]), .Y(n8) );
  CLKINVX1M U29 ( .A(shift_reg[7]), .Y(n6) );
  DLY1X1M U30 ( .A(n6), .Y(test_so) );
  DLY1X1M U31 ( .A(n8), .Y(n35) );
  DLY1X1M U32 ( .A(n26), .Y(n36) );
  SDFFRQX1M \shift_reg_reg[6]  ( .D(n22), .SI(n35), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(n29) );
  SDFFRQX1M \shift_reg_reg[4]  ( .D(n18), .SI(n36), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(n30) );
  SDFFRQX1M \shift_reg_reg[2]  ( .D(n14), .SI(n28), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(n31) );
  SDFFRHQX2M \shift_reg_reg[7]  ( .D(n24), .SI(n7), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(shift_reg[7]) );
  SDFFRHQX2M \shift_reg_reg[3]  ( .D(n16), .SI(n27), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(shift_reg[3]) );
  SDFFRHQX2M \shift_reg_reg[1]  ( .D(n12), .SI(shift_reg[0]), .SE(test_se), 
        .CK(clock), .RN(reset), .Q(shift_reg[1]) );
  SDFFRHQX2M \shift_reg_reg[5]  ( .D(n20), .SI(n25), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(shift_reg[5]) );
  SDFFRHQX2M \shift_reg_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(
        clock), .RN(reset), .Q(shift_reg[0]) );
endmodule


module edge_bit_counter_test_1 ( clock, reset, enable, prescale, edge_counter, 
        bit_counter, test_si, test_se );
  input [5:0] prescale;
  output [5:0] edge_counter;
  output [3:0] bit_counter;
  input clock, reset, enable, test_si, test_se;
  wire   n51, n62, n63, n64, n65, n66, n61, N6, N10, N11, N12, N13, N14, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         \add_37_aco/carry[5] , \add_37_aco/carry[4] , \add_37_aco/carry[3] ,
         \add_37_aco/carry[2] , \mult_add_37_aco/B[0] , n1, n2, n3, n4, n15,
         n16, n17, n18, n19, n20, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n5, n7, n9, n11, n14, n43;
  wire   [5:0] edge_counter_comb;

  SDFFRHQX4M \bit_counter_reg[1]  ( .D(n28), .SI(n56), .SE(test_se), .CK(clock), .RN(reset), .Q(bit_counter[1]) );
  NOR4X4M U5 ( .A(n37), .B(n36), .C(n35), .D(n34), .Y(N6) );
  AND2X2M U15 ( .A(edge_counter[1]), .B(\mult_add_37_aco/B[0] ), .Y(n2) );
  AND2X2M U16 ( .A(n48), .B(\mult_add_37_aco/B[0] ), .Y(n3) );
  AND2X2M U17 ( .A(n46), .B(\mult_add_37_aco/B[0] ), .Y(n4) );
  AND2X2M U18 ( .A(n47), .B(\mult_add_37_aco/B[0] ), .Y(n15) );
  AOI2BB2X2M U19 ( .B0(enable), .B1(n41), .A0N(n17), .A1N(n22), .Y(n25) );
  OAI31X2M U20 ( .A0(n27), .A1(n52), .A2(N6), .B0(n21), .Y(n26) );
  NAND2X2M U21 ( .A(n55), .B(N6), .Y(n21) );
  NOR2X1M U25 ( .A(n17), .B(n26), .Y(n31) );
  INVX2M U26 ( .A(bit_counter[2]), .Y(n41) );
  CLKBUFX6M U27 ( .A(n38), .Y(n17) );
  INVXLM U28 ( .A(enable), .Y(n38) );
  NOR2X2M U29 ( .A(n16), .B(n17), .Y(edge_counter_comb[0]) );
  NOR2BX2M U30 ( .AN(N10), .B(n17), .Y(edge_counter_comb[1]) );
  NOR2BX2M U31 ( .AN(N11), .B(n17), .Y(edge_counter_comb[2]) );
  NOR2BX2M U32 ( .AN(N12), .B(n17), .Y(edge_counter_comb[3]) );
  NOR2BX2M U33 ( .AN(N13), .B(n17), .Y(edge_counter_comb[4]) );
  CLKINVX3M U34 ( .A(N6), .Y(\mult_add_37_aco/B[0] ) );
  INVX2M U35 ( .A(n21), .Y(n39) );
  NOR2X2M U36 ( .A(n40), .B(n21), .Y(n22) );
  OAI33X2M U37 ( .A0(n40), .A1(n39), .A2(n17), .B0(n17), .B1(bit_counter[1]), 
        .B2(n21), .Y(n28) );
  OAI32X2M U38 ( .A0(n24), .A1(n40), .A2(n41), .B0(n25), .B1(n42), .Y(n30) );
  NAND3XLM U39 ( .A(n39), .B(n42), .C(enable), .Y(n24) );
  INVX2M U40 ( .A(bit_counter[3]), .Y(n42) );
  OAI31X2M U41 ( .A0(n17), .A1(n22), .A2(n41), .B0(n23), .Y(n29) );
  NAND4X1M U42 ( .A(bit_counter[1]), .B(enable), .C(n39), .D(n45), .Y(n23) );
  NOR3X2M U43 ( .A(bit_counter[1]), .B(bit_counter[3]), .C(bit_counter[2]), 
        .Y(n27) );
  NOR2BX2M U44 ( .AN(N14), .B(n17), .Y(edge_counter_comb[5]) );
  ADDHX1M U45 ( .A(n2), .B(n16), .CO(\add_37_aco/carry[2] ), .S(N10) );
  ADDHX1M U46 ( .A(n3), .B(\add_37_aco/carry[3] ), .CO(\add_37_aco/carry[4] ), 
        .S(N12) );
  ADDHX1M U47 ( .A(n1), .B(\add_37_aco/carry[2] ), .CO(\add_37_aco/carry[3] ), 
        .S(N11) );
  ADDHX1M U48 ( .A(n4), .B(\add_37_aco/carry[4] ), .CO(\add_37_aco/carry[5] ), 
        .S(N13) );
  CLKINVX2M U49 ( .A(bit_counter[1]), .Y(n40) );
  CLKXOR2X2M U50 ( .A(\add_37_aco/carry[5] ), .B(n15), .Y(N14) );
  OAI2B2X1M U51 ( .A1N(prescale[1]), .A0(n18), .B0(edge_counter[1]), .B1(n18), 
        .Y(n33) );
  OAI2B2X1M U52 ( .A1N(edge_counter[1]), .A0(n19), .B0(prescale[1]), .B1(n19), 
        .Y(n32) );
  XNOR2X1M U53 ( .A(prescale[5]), .B(n47), .Y(n20) );
  NAND3X1M U54 ( .A(n33), .B(n32), .C(n20), .Y(n37) );
  CLKXOR2X2M U55 ( .A(prescale[4]), .B(edge_counter[4]), .Y(n36) );
  CLKXOR2X2M U57 ( .A(prescale[3]), .B(edge_counter[3]), .Y(n34) );
  INVXLM U58 ( .A(bit_counter[2]), .Y(n45) );
  DLY1X1M U59 ( .A(edge_counter[4]), .Y(n46) );
  DLY1X1M U60 ( .A(edge_counter[5]), .Y(n47) );
  DLY1X1M U61 ( .A(edge_counter[3]), .Y(n48) );
  DLY1X1M U62 ( .A(n50), .Y(n49) );
  INVXLM U63 ( .A(n59), .Y(n50) );
  INVXLM U64 ( .A(n49), .Y(bit_counter[0]) );
  INVXLM U65 ( .A(n49), .Y(n52) );
  DLY1X1M U66 ( .A(n54), .Y(n53) );
  INVXLM U67 ( .A(n60), .Y(n54) );
  INVXLM U68 ( .A(n53), .Y(n55) );
  INVXLM U69 ( .A(n53), .Y(n56) );
  DLY1X1M U70 ( .A(n58), .Y(n57) );
  INVXLM U71 ( .A(n61), .Y(n58) );
  INVXLM U72 ( .A(n57), .Y(n59) );
  INVXLM U73 ( .A(n57), .Y(n60) );
  SDFFRQX1M \bit_counter_reg[0]  ( .D(n31), .SI(test_si), .SE(test_se), .CK(
        clock), .RN(reset), .Q(n61) );
  SDFFRHQX1M \edge_counter_reg[0]  ( .D(edge_counter_comb[0]), .SI(n42), .SE(
        test_se), .CK(clock), .RN(reset), .Q(n64) );
  SDFFRHQX8M \edge_counter_reg[1]  ( .D(edge_counter_comb[1]), .SI(
        edge_counter[0]), .SE(test_se), .CK(clock), .RN(reset), .Q(
        edge_counter[1]) );
  SDFFRHQX1M \edge_counter_reg[2]  ( .D(edge_counter_comb[2]), .SI(
        edge_counter[1]), .SE(test_se), .CK(clock), .RN(reset), .Q(n63) );
  SDFFRHQX4M \edge_counter_reg[3]  ( .D(edge_counter_comb[3]), .SI(n14), .SE(
        test_se), .CK(clock), .RN(reset), .Q(edge_counter[3]) );
  SDFFRHQX1M \edge_counter_reg[4]  ( .D(edge_counter_comb[4]), .SI(n48), .SE(
        test_se), .CK(clock), .RN(reset), .Q(n62) );
  SDFFRHQX1M \edge_counter_reg[5]  ( .D(edge_counter_comb[5]), .SI(n46), .SE(
        test_se), .CK(clock), .RN(reset), .Q(n51) );
  SDFFRHQX1M \bit_counter_reg[2]  ( .D(n29), .SI(n40), .SE(test_se), .CK(clock), .RN(reset), .Q(n66) );
  SDFFRHQX1M \bit_counter_reg[3]  ( .D(n30), .SI(n41), .SE(test_se), .CK(clock), .RN(reset), .Q(n65) );
  CLKXOR2X2M U3 ( .A(prescale[2]), .B(n14), .Y(n35) );
  NOR2BX2M U4 ( .AN(prescale[0]), .B(n64), .Y(n19) );
  NOR2BX2M U6 ( .AN(edge_counter[0]), .B(prescale[0]), .Y(n18) );
  INVXLM U7 ( .A(n65), .Y(n5) );
  INVX2M U8 ( .A(n5), .Y(bit_counter[3]) );
  INVXLM U9 ( .A(n66), .Y(n7) );
  INVX2M U10 ( .A(n7), .Y(bit_counter[2]) );
  INVXLM U11 ( .A(n51), .Y(n9) );
  INVX4M U12 ( .A(n9), .Y(edge_counter[5]) );
  INVXLM U13 ( .A(n62), .Y(n11) );
  INVX4M U14 ( .A(n11), .Y(edge_counter[4]) );
  BUFX4M U22 ( .A(n63), .Y(edge_counter[2]) );
  BUFX2M U23 ( .A(n63), .Y(n14) );
  AND2X1M U24 ( .A(n14), .B(\mult_add_37_aco/B[0] ), .Y(n1) );
  INVXLM U56 ( .A(n64), .Y(n43) );
  INVX8M U74 ( .A(n43), .Y(edge_counter[0]) );
  AND2X1M U75 ( .A(edge_counter[0]), .B(\mult_add_37_aco/B[0] ), .Y(n16) );
endmodule


module parity_check_test_1 ( data_in, parity_bit, enable, clock, reset, 
        parity_type, parity_error, test_si, test_se );
  input [7:0] data_in;
  input parity_bit, enable, clock, reset, parity_type, test_si, test_se;
  output parity_error;
  wire   n1, n3, n4, n9, n2, n5, n6, n7;

  XOR3XLM U2 ( .A(n3), .B(n4), .C(n2), .Y(n1) );
  XNOR2X2M U3 ( .A(parity_type), .B(data_in[1]), .Y(n2) );
  XNOR2X2M U4 ( .A(parity_bit), .B(data_in[7]), .Y(n5) );
  XOR3XLM U5 ( .A(data_in[6]), .B(data_in[5]), .C(n5), .Y(n4) );
  OAI2BB2X1M U6 ( .B0(n1), .B1(n7), .A0N(parity_error), .A1N(n7), .Y(n9) );
  CLKXOR2X2M U7 ( .A(data_in[4]), .B(data_in[3]), .Y(n6) );
  XNOR3X1M U8 ( .A(data_in[2]), .B(data_in[0]), .C(n6), .Y(n3) );
  CLKINVX1M U9 ( .A(enable), .Y(n7) );
  SDFFRHQX2M parity_error_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(parity_error) );
endmodule


module start_check_test_1 ( data_in, clock, reset, enable, glitch, test_si, 
        test_se );
  input data_in, clock, reset, enable, test_si, test_se;
  output glitch;
  wire   n2;

  AO2B2XLM U2 ( .B0(enable), .B1(data_in), .A0(glitch), .A1N(enable), .Y(n2)
         );
  SDFFRHQX2M glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(clock), .RN(
        reset), .Q(glitch) );
endmodule


module stop_check_test_1 ( data_in, enable, clock, reset, stop_error, test_si, 
        test_so, test_se );
  input data_in, enable, clock, reset, test_si, test_se;
  output stop_error, test_so;
  wire   n5, n3, n4;
  assign test_so = n5;

  CLKBUFX1M U2 ( .A(n5), .Y(stop_error) );
  OAI2BB2X1M U3 ( .B0(data_in), .B1(n4), .A0N(n5), .A1N(n4), .Y(n3) );
  INVX2M U5 ( .A(enable), .Y(n4) );
  SDFFRHQX2M stop_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(clock), 
        .RN(reset), .Q(n5) );
endmodule


module UART_Rx_test_1 ( RX_IN, prescale, PAR_EN, PAR_TYP, CLK, RST, P_DATA, 
        PAR_ERR, STP_ERR, data_valid, test_si, test_so, test_se );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST, test_si, test_se;
  output PAR_ERR, STP_ERR, data_valid, test_so;
  wire   n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n30, start_glitch,
         counter_en, deserializer_en, start_check_en, parity_check_en,
         stop_check_en, sampler_output, n5, n6, n7, n8, n10, n11, n13, n14,
         n16, n17, n18, n19, n21, n22, n23, n24, n25, n26, n28, n29, n42, n43,
         n46, n1, n2, n9;
  wire   [3:0] bit_counter;
  wire   [5:0] edge_counter;
  assign PAR_ERR = n46;

  BUFX2M U2 ( .A(n34), .Y(n23) );
  BUFX2M U5 ( .A(n36), .Y(n21) );
  BUFX2M U7 ( .A(n32), .Y(n16) );
  BUFX2M U9 ( .A(n40), .Y(n5) );
  CLKINVX1M U11 ( .A(n34), .Y(n24) );
  CLKINVX40M U12 ( .A(n24), .Y(P_DATA[4]) );
  CLKINVX1M U13 ( .A(n36), .Y(n22) );
  CLKINVX40M U14 ( .A(n22), .Y(P_DATA[2]) );
  CLKINVX1M U15 ( .A(n32), .Y(n17) );
  CLKINVX40M U16 ( .A(n17), .Y(P_DATA[6]) );
  CLKINVX1M U17 ( .A(n40), .Y(n6) );
  CLKINVX40M U18 ( .A(n6), .Y(STP_ERR) );
  UART_Rx_FSM_test_1 U0_FSM ( .clock(CLK), .reset(RST), .data_in(RX_IN), 
        .parity_en(PAR_EN), .bit_counter(bit_counter), .edge_counter(
        edge_counter), .prescale(prescale), .start_glitch(start_glitch), 
        .parity_error(n9), .stop_error(n5), .counter_en(counter_en), 
        .deserializer_en(deserializer_en), .start_check_en(start_check_en), 
        .parity_check_en(parity_check_en), .stop_check_en(stop_check_en), 
        .data_valid(n30), .test_si(test_si), .test_se(test_se) );
  data_sampling_test_1 U1_Sampler ( .clock(CLK), .reset(RST), .edge_counter(
        edge_counter), .data_in(RX_IN), .prescale(prescale), .data_out(
        sampler_output), .test_si(n2), .test_so(n43), .test_se(test_se) );
  deserializer_test_1 U2_Deserializer ( .enable(deserializer_en), .clock(CLK), 
        .reset(RST), .data_in(sampler_output), .shift_reg({n31, n32, n33, n34, 
        n35, n36, n37, n38}), .test_si(n43), .test_so(n42), .test_se(test_se)
         );
  edge_bit_counter_test_1 U3_Counter ( .clock(CLK), .reset(RST), .enable(
        counter_en), .prescale(prescale), .edge_counter(edge_counter), 
        .bit_counter(bit_counter), .test_si(n42), .test_se(test_se) );
  parity_check_test_1 U4_Parity ( .data_in({n8, n16, n19, n23, n11, n21, n14, 
        n29}), .parity_bit(sampler_output), .enable(parity_check_en), .clock(
        CLK), .reset(RST), .parity_type(PAR_TYP), .parity_error(n39), 
        .test_si(edge_counter[5]), .test_se(test_se) );
  start_check_test_1 U5_Start ( .data_in(sampler_output), .clock(CLK), .reset(
        RST), .enable(start_check_en), .glitch(start_glitch), .test_si(n26), 
        .test_se(test_se) );
  stop_check_test_1 U6_Stop ( .data_in(sampler_output), .enable(stop_check_en), 
        .clock(CLK), .reset(RST), .stop_error(n40), .test_si(start_glitch), 
        .test_so(test_so), .test_se(test_se) );
  INVX32M U1 ( .A(n25), .Y(n9) );
  INVX32M U3 ( .A(n25), .Y(n26) );
  CLKINVX40M U4 ( .A(n25), .Y(n46) );
  CLKINVX2M U6 ( .A(n30), .Y(n1) );
  INVX32M U8 ( .A(n1), .Y(n2) );
  CLKINVX40M U10 ( .A(n1), .Y(data_valid) );
  CLKINVX40M U19 ( .A(n28), .Y(P_DATA[0]) );
  CLKINVX2M U20 ( .A(n38), .Y(n28) );
  CLKINVX2M U21 ( .A(n39), .Y(n25) );
  CLKINVX40M U22 ( .A(n18), .Y(P_DATA[5]) );
  CLKINVX2M U23 ( .A(n33), .Y(n18) );
  CLKINVX40M U24 ( .A(n13), .Y(P_DATA[1]) );
  CLKINVX2M U25 ( .A(n37), .Y(n13) );
  CLKINVX40M U26 ( .A(n10), .Y(P_DATA[3]) );
  CLKINVX2M U27 ( .A(n35), .Y(n10) );
  CLKINVX40M U28 ( .A(n7), .Y(P_DATA[7]) );
  CLKINVX2M U29 ( .A(n31), .Y(n7) );
  INVX32M U30 ( .A(n28), .Y(n29) );
  INVX32M U31 ( .A(n18), .Y(n19) );
  INVX32M U32 ( .A(n13), .Y(n14) );
  INVX32M U33 ( .A(n10), .Y(n11) );
  INVX32M U34 ( .A(n7), .Y(n8) );
endmodule


module UART ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, P_DATA_TX, DATA_VALID_TX, 
        RX_IN, PRESCALE_RX, TX_OUT, BUSY_TX, P_DATA_RX, PAR_ERR_RX, STP_ERR_RX, 
        DATA_VALID_RX, SI, SE, test_mode, scan_rst, scan_clk, SO );
  input [7:0] P_DATA_TX;
  input [5:0] PRESCALE_RX;
  output [7:0] P_DATA_RX;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, DATA_VALID_TX, RX_IN, SI, SE,
         test_mode, scan_rst, scan_clk;
  output TX_OUT, BUSY_TX, PAR_ERR_RX, STP_ERR_RX, DATA_VALID_RX, SO;
  wire   n13, Tx_muxed_clk, Rx_muxed_clk, muxed_rst, n1, n2, n3, n4, n5, n6,
         n10, n11;

  BUFX6M U1 ( .A(PRESCALE_RX[1]), .Y(n2) );
  BUFX6M U2 ( .A(PRESCALE_RX[2]), .Y(n3) );
  CLKBUFX6M U3 ( .A(PRESCALE_RX[4]), .Y(n5) );
  BUFX4M U4 ( .A(PRESCALE_RX[0]), .Y(n1) );
  CLKBUFX6M U5 ( .A(PRESCALE_RX[3]), .Y(n4) );
  CLKBUFX6M U6 ( .A(PRESCALE_RX[5]), .Y(n6) );
  mux_2X1_0 U0_Tx_clk_mux ( .I0(TX_CLK), .I1(scan_clk), .sel(test_mode), .out(
        Tx_muxed_clk) );
  mux_2X1_2 U0_Rx_clk_mux ( .I0(RX_CLK), .I1(scan_clk), .sel(test_mode), .out(
        Rx_muxed_clk) );
  mux_2X1_1 U0_rst_mux ( .I0(RST), .I1(scan_rst), .sel(test_mode), .out(
        muxed_rst) );
  UART_Tx_test_1 U0_UART_Tx ( .CLK(Tx_muxed_clk), .RST(muxed_rst), .PAR_TYP(
        PAR_TYP), .PAR_EN(PAR_EN), .P_DATA(P_DATA_TX), .DATA_VALID(
        DATA_VALID_TX), .TX_OUT(n13), .Busy(BUSY_TX), .test_si(SI), .test_se(
        SE) );
  UART_Rx_test_1 U1_UART_Rx ( .RX_IN(RX_IN), .prescale({n6, n5, n4, n3, n2, n1}), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .CLK(Rx_muxed_clk), .RST(muxed_rst), 
        .P_DATA(P_DATA_RX), .PAR_ERR(PAR_ERR_RX), .STP_ERR(STP_ERR_RX), 
        .data_valid(DATA_VALID_RX), .test_si(n11), .test_so(SO), .test_se(SE)
         );
  CLKINVX2M U7 ( .A(n13), .Y(n10) );
  INVX32M U8 ( .A(n10), .Y(n11) );
  CLKINVX40M U9 ( .A(n10), .Y(TX_OUT) );
endmodule

