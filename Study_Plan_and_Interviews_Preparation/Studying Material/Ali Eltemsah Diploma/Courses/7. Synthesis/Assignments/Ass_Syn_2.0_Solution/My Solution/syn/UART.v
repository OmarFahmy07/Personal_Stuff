/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Aug 11 18:33:12 2022
/////////////////////////////////////////////////////////////


module UART_Tx_FSM ( Data_Valid, PAR_EN, ser_done, clk, rst, ser_load, ser_en, 
        parity_load, mux_sel, busy );
  output [2:0] mux_sel;
  input Data_Valid, PAR_EN, ser_done, clk, rst;
  output ser_load, ser_en, parity_load, busy;
  wire   n11, busy_comb, n5, n6, n7, ser_load, n1, n3, n8, n9, n10;
  wire   [2:0] current_state;
  assign parity_load = ser_load;

  AOI211X4M U8 ( .A0(current_state[1]), .A1(ser_done), .B0(current_state[2]), 
        .C0(n8), .Y(ser_en) );
  DFFRQX2M \current_state_reg[1]  ( .D(mux_sel[1]), .CK(clk), .RN(rst), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(mux_sel[0]), .CK(clk), .RN(rst), .Q(
        current_state[0]) );
  DFFRQX2M busy_reg ( .D(busy_comb), .CK(clk), .RN(rst), .Q(n11) );
  DFFRX4M \current_state_reg[2]  ( .D(mux_sel[2]), .CK(clk), .RN(rst), .Q(
        current_state[2]), .QN(n10) );
  OAI32X2M U3 ( .A0(n10), .A1(current_state[0]), .A2(n9), .B0(current_state[2]), .B1(current_state[1]), .Y(n7) );
  CLKINVX1M U4 ( .A(n11), .Y(n1) );
  CLKINVX40M U5 ( .A(n1), .Y(busy) );
  AOI211X2M U6 ( .A0(current_state[1]), .A1(ser_done), .B0(current_state[2]), 
        .C0(n8), .Y(n3) );
  AOI21X3M U7 ( .A0(Data_Valid), .A1(n7), .B0(n3), .Y(n5) );
  NOR2X2M U9 ( .A(n5), .B(mux_sel[1]), .Y(ser_load) );
  INVX2M U10 ( .A(n5), .Y(mux_sel[0]) );
  NAND2BX2M U11 ( .AN(mux_sel[1]), .B(n5), .Y(busy_comb) );
  NOR3X4M U12 ( .A(n9), .B(current_state[2]), .C(n6), .Y(mux_sel[2]) );
  AOI2B1X1M U13 ( .A1N(PAR_EN), .A0(ser_done), .B0(n8), .Y(n6) );
  INVX2M U14 ( .A(current_state[0]), .Y(n8) );
  INVX2M U15 ( .A(current_state[1]), .Y(n9) );
  AOI21X6M U16 ( .A0(n8), .A1(n9), .B0(current_state[2]), .Y(mux_sel[1]) );
endmodule


module serializer ( data_in, load, enable, clk, rst, done, data_out );
  input [7:0] data_in;
  input load, enable, clk, rst;
  output done, data_out;
  wire   N12, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n1, n23, n24;
  wire   [2:0] counter;
  wire   [2:0] counter_comb;
  wire   [7:1] shift_reg;

  DFFRQX2M \shift_reg_reg[0]  ( .D(n15), .CK(clk), .RN(rst), .Q(data_out) );
  DFFRQX2M \shift_reg_reg[6]  ( .D(n17), .CK(clk), .RN(rst), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n18), .CK(clk), .RN(rst), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n19), .CK(clk), .RN(rst), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n20), .CK(clk), .RN(rst), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n21), .CK(clk), .RN(rst), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n22), .CK(clk), .RN(rst), .Q(shift_reg[1])
         );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n16), .CK(clk), .RN(rst), .Q(shift_reg[7])
         );
  DFFRQX2M \counter_reg[2]  ( .D(counter_comb[2]), .CK(clk), .RN(rst), .Q(
        counter[2]) );
  DFFRQX2M done_reg ( .D(N12), .CK(clk), .RN(rst), .Q(done) );
  DFFRQX2M \counter_reg[1]  ( .D(counter_comb[1]), .CK(clk), .RN(rst), .Q(
        counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(counter_comb[0]), .CK(clk), .RN(rst), .Q(
        counter[0]) );
  NOR2X2M U3 ( .A(n12), .B(counter[0]), .Y(counter_comb[0]) );
  NOR2X8M U4 ( .A(n23), .B(n1), .Y(n4) );
  CLKBUFX6M U5 ( .A(load), .Y(n1) );
  CLKBUFX6M U6 ( .A(n2), .Y(n23) );
  NOR2X1M U7 ( .A(n1), .B(enable), .Y(n2) );
  OAI2BB1X2M U8 ( .A0N(n23), .A1N(shift_reg[6]), .B0(n5), .Y(n17) );
  AOI22X1M U9 ( .A0(shift_reg[7]), .A1(n4), .B0(data_in[6]), .B1(n1), .Y(n5)
         );
  OAI2BB1X2M U10 ( .A0N(n23), .A1N(shift_reg[2]), .B0(n9), .Y(n21) );
  AOI22X1M U11 ( .A0(shift_reg[3]), .A1(n4), .B0(data_in[2]), .B1(n1), .Y(n9)
         );
  OAI2BB1X2M U12 ( .A0N(n23), .A1N(shift_reg[3]), .B0(n8), .Y(n20) );
  AOI22X1M U13 ( .A0(shift_reg[4]), .A1(n4), .B0(data_in[3]), .B1(n1), .Y(n8)
         );
  OAI2BB1X2M U14 ( .A0N(n23), .A1N(shift_reg[4]), .B0(n7), .Y(n19) );
  AOI22X1M U15 ( .A0(shift_reg[5]), .A1(n4), .B0(data_in[4]), .B1(n1), .Y(n7)
         );
  OAI2BB1X2M U16 ( .A0N(data_out), .A1N(n23), .B0(n3), .Y(n15) );
  AOI22X1M U17 ( .A0(shift_reg[1]), .A1(n4), .B0(n1), .B1(data_in[0]), .Y(n3)
         );
  OAI2BB1X2M U18 ( .A0N(shift_reg[1]), .A1N(n23), .B0(n10), .Y(n22) );
  AOI22X1M U19 ( .A0(shift_reg[2]), .A1(n4), .B0(data_in[1]), .B1(n1), .Y(n10)
         );
  OAI2BB1X2M U20 ( .A0N(n23), .A1N(shift_reg[5]), .B0(n6), .Y(n18) );
  AOI22X1M U21 ( .A0(shift_reg[6]), .A1(n4), .B0(data_in[5]), .B1(n1), .Y(n6)
         );
  AO22X1M U22 ( .A0(n23), .A1(shift_reg[7]), .B0(data_in[7]), .B1(n1), .Y(n16)
         );
  OAI32X2M U23 ( .A0(n11), .A1(counter[2]), .A2(n12), .B0(n13), .B1(n24), .Y(
        counter_comb[2]) );
  INVX2M U24 ( .A(counter[2]), .Y(n24) );
  NAND2X2M U25 ( .A(counter[1]), .B(counter[0]), .Y(n11) );
  AOI2BB1X2M U26 ( .A0N(n12), .A1N(counter[1]), .B0(counter_comb[0]), .Y(n13)
         );
  NAND2BX2M U27 ( .AN(done), .B(enable), .Y(n12) );
  NOR2X2M U28 ( .A(n14), .B(n12), .Y(counter_comb[1]) );
  XNOR2X2M U29 ( .A(counter[0]), .B(counter[1]), .Y(n14) );
  AND3X2M U30 ( .A(counter[2]), .B(counter[0]), .C(counter[1]), .Y(N12) );
endmodule


module Parity_Calc ( rst, clk, data_in, load, type, parity_result );
  input [7:0] data_in;
  input rst, clk, load, type;
  output parity_result;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX2M parity_result_reg ( .D(n7), .CK(clk), .RN(rst), .Q(parity_result)
         );
  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(parity_result), .A1N(n2), .Y(n7) );
  INVX2M U3 ( .A(load), .Y(n2) );
  XOR3XLM U4 ( .A(n3), .B(type), .C(n4), .Y(n1) );
  XOR3XLM U5 ( .A(data_in[1]), .B(data_in[0]), .C(n5), .Y(n4) );
  XNOR2X2M U6 ( .A(data_in[3]), .B(data_in[2]), .Y(n5) );
  XOR3XLM U7 ( .A(data_in[5]), .B(data_in[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(data_in[7]), .B(data_in[6]), .Y(n6) );
endmodule


module MUX_8x1 ( clk, rst, sel, data, out );
  input [2:0] sel;
  input [7:0] data;
  input clk, rst;
  output out;
  wire   n5, out_comb, n1, n3, n4;

  DFFSQX2M out_reg ( .D(out_comb), .CK(clk), .SN(rst), .Q(n5) );
  CLKINVX1M U3 ( .A(n5), .Y(n1) );
  CLKINVX40M U4 ( .A(n1), .Y(out) );
  MX2X2M U5 ( .A(n4), .B(n3), .S0(sel[2]), .Y(out_comb) );
  MX4X1M U6 ( .A(data[4]), .B(data[5]), .C(data[6]), .D(data[7]), .S0(sel[0]), 
        .S1(sel[1]), .Y(n3) );
  MX4X1M U7 ( .A(data[0]), .B(data[1]), .C(data[2]), .D(data[3]), .S0(sel[0]), 
        .S1(sel[1]), .Y(n4) );
endmodule


module UART_Tx ( CLK, RST, PAR_TYP, PAR_EN, P_DATA, DATA_VALID, TX_OUT, Busy
 );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, DATA_VALID;
  output TX_OUT, Busy;
  wire   ser_done, ser_load, ser_en, parity_load, ser_data_out, parity_result;
  wire   [2:0] mux_sel;

  UART_Tx_FSM U0 ( .Data_Valid(DATA_VALID), .PAR_EN(PAR_EN), .ser_done(
        ser_done), .clk(CLK), .rst(RST), .ser_load(ser_load), .ser_en(ser_en), 
        .parity_load(parity_load), .mux_sel(mux_sel), .busy(Busy) );
  serializer U1 ( .data_in(P_DATA), .load(ser_load), .enable(ser_en), .clk(CLK), .rst(RST), .done(ser_done), .data_out(ser_data_out) );
  Parity_Calc U2 ( .rst(RST), .clk(CLK), .data_in(P_DATA), .load(parity_load), 
        .type(PAR_TYP), .parity_result(parity_result) );
  MUX_8x1 U3 ( .clk(CLK), .rst(RST), .sel(mux_sel), .data({1'b1, 1'b1, 1'b1, 
        1'b1, ser_data_out, parity_result, 1'b0, 1'b1}), .out(TX_OUT) );
endmodule


module UART_Rx_FSM ( clock, reset, data_in, parity_en, bit_counter, 
        edge_counter, prescale, start_glitch, parity_error, stop_error, 
        counter_en, deserializer_en, start_check_en, parity_check_en, 
        stop_check_en, data_valid );
  input [3:0] bit_counter;
  input [5:0] edge_counter;
  input [5:0] prescale;
  input clock, reset, data_in, parity_en, start_glitch, parity_error,
         stop_error;
  output counter_en, deserializer_en, start_check_en, parity_check_en,
         stop_check_en, data_valid;
  wire   n56, N33, N34, N35, N36, N37, N52, N53, N54, N55, N56, N57, N58, N59,
         N75, N77, N79, N81, \add_80/carry[5] , \add_80/carry[4] ,
         \add_80/carry[3] , \add_80/carry[2] , \add_223/carry[4] ,
         \add_223/carry[3] , \add_223/carry[2] , n1, n2, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [5:0] third_sample_edge;
  assign deserializer_en = N75;
  assign start_check_en = N77;
  assign parity_check_en = N79;
  assign stop_check_en = N81;

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clock), .RN(reset), 
        .Q(current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clock), .RN(reset), 
        .Q(current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clock), .RN(reset), 
        .Q(current_state[0]) );
  DFFRQX2M data_valid_reg ( .D(n1), .CK(clock), .RN(reset), .Q(n56) );
  NOR3X2M U3 ( .A(n17), .B(stop_error), .C(counter_en), .Y(n1) );
  OR2X4M U4 ( .A(next_state[0]), .B(next_state[1]), .Y(counter_en) );
  NOR4X2M U5 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N59) );
  OAI2BB1X2M U6 ( .A0N(parity_error), .A1N(parity_en), .B0(next_state[2]), .Y(
        n17) );
  CLKINVX1M U7 ( .A(n56), .Y(n2) );
  CLKINVX40M U8 ( .A(n2), .Y(data_valid) );
  NOR3X2M U9 ( .A(n29), .B(bit_counter[2]), .C(bit_counter[1]), .Y(n39) );
  NOR4BX2M U10 ( .AN(start_glitch), .B(n35), .C(n36), .D(n37), .Y(n34) );
  NOR3X2M U11 ( .A(n48), .B(current_state[0]), .C(n19), .Y(N79) );
  NOR2X4M U12 ( .A(n24), .B(current_state[2]), .Y(n27) );
  INVX4M U13 ( .A(current_state[0]), .Y(n24) );
  NOR3X2M U14 ( .A(n48), .B(n19), .C(n24), .Y(N75) );
  NOR3BX4M U15 ( .AN(n27), .B(n48), .C(current_state[1]), .Y(N77) );
  NAND4X4M U16 ( .A(n49), .B(n50), .C(n51), .D(n52), .Y(n48) );
  OAI32X4M U17 ( .A0(n24), .A1(n21), .A2(n19), .B0(current_state[1]), .B1(n30), 
        .Y(next_state[0]) );
  AOI2BB2X1M U18 ( .B0(n27), .B1(n26), .A0N(data_in), .A1N(current_state[0]), 
        .Y(n30) );
  NOR2X2M U19 ( .A(n7), .B(prescale[5]), .Y(N58) );
  NOR2BX2M U20 ( .AN(edge_counter[0]), .B(N52), .Y(n9) );
  NOR2BX2M U21 ( .AN(N52), .B(edge_counter[0]), .Y(n8) );
  NAND2BX2M U22 ( .AN(prescale[1]), .B(N52), .Y(n4) );
  OR2X2M U23 ( .A(n6), .B(prescale[4]), .Y(n7) );
  OR2X2M U24 ( .A(n4), .B(prescale[2]), .Y(n5) );
  OR2X2M U25 ( .A(n5), .B(prescale[3]), .Y(n6) );
  OAI2BB1XLM U26 ( .A0N(n4), .A1N(prescale[2]), .B0(n5), .Y(N54) );
  OAI21X2M U27 ( .A0(n18), .A1(n19), .B0(n20), .Y(next_state[2]) );
  INVX2M U28 ( .A(n28), .Y(n19) );
  OAI21X2M U29 ( .A0(N59), .A1(n20), .B0(n25), .Y(next_state[1]) );
  NAND4X2M U30 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n26) );
  OAI2BB1XLM U31 ( .A0N(n6), .A1N(prescale[4]), .B0(n7), .Y(N56) );
  OAI2BB1XLM U32 ( .A0N(n5), .A1N(prescale[3]), .B0(n6), .Y(N55) );
  NAND4X2M U33 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n29) );
  NOR3X2M U34 ( .A(n44), .B(n45), .C(n46), .Y(n43) );
  NOR3X2M U35 ( .A(n53), .B(n54), .C(n55), .Y(n52) );
  NAND3X2M U36 ( .A(current_state[1]), .B(n24), .C(current_state[2]), .Y(n20)
         );
  NOR2BX2M U37 ( .AN(current_state[1]), .B(current_state[2]), .Y(n28) );
  ADDHX2M U38 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_223/carry[2] ), .S(
        third_sample_edge[1]) );
  ADDHX2M U39 ( .A(prescale[3]), .B(\add_223/carry[2] ), .CO(
        \add_223/carry[3] ), .S(third_sample_edge[2]) );
  ADDHX2M U40 ( .A(prescale[5]), .B(\add_223/carry[4] ), .CO(
        third_sample_edge[5]), .S(third_sample_edge[4]) );
  ADDHX2M U41 ( .A(prescale[4]), .B(\add_223/carry[3] ), .CO(
        \add_223/carry[4] ), .S(third_sample_edge[3]) );
  ADDHX1M U42 ( .A(third_sample_edge[1]), .B(third_sample_edge[0]), .CO(
        \add_80/carry[2] ), .S(N33) );
  ADDHX1M U43 ( .A(third_sample_edge[2]), .B(\add_80/carry[2] ), .CO(
        \add_80/carry[3] ), .S(N34) );
  ADDHX1M U44 ( .A(third_sample_edge[3]), .B(\add_80/carry[3] ), .CO(
        \add_80/carry[4] ), .S(N35) );
  ADDHX1M U45 ( .A(third_sample_edge[4]), .B(\add_80/carry[4] ), .CO(
        \add_80/carry[5] ), .S(N36) );
  INVX2M U46 ( .A(prescale[0]), .Y(N52) );
  INVX2M U47 ( .A(prescale[1]), .Y(third_sample_edge[0]) );
  XNOR2X2M U48 ( .A(edge_counter[0]), .B(third_sample_edge[0]), .Y(n37) );
  CLKXOR2X2M U49 ( .A(\add_80/carry[5] ), .B(third_sample_edge[5]), .Y(N37) );
  OAI2BB1X1M U50 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n4), .Y(N53) );
  AO21XLM U51 ( .A0(n7), .A1(prescale[5]), .B0(N58), .Y(N57) );
  OAI2B2X1M U52 ( .A1N(edge_counter[1]), .A0(n8), .B0(N53), .B1(n8), .Y(n12)
         );
  XNOR2X1M U53 ( .A(N57), .B(edge_counter[5]), .Y(n11) );
  OAI2B2X1M U54 ( .A1N(N53), .A0(n9), .B0(edge_counter[1]), .B1(n9), .Y(n10)
         );
  NAND4BX1M U55 ( .AN(N58), .B(n12), .C(n11), .D(n10), .Y(n16) );
  CLKXOR2X2M U56 ( .A(N56), .B(edge_counter[4]), .Y(n15) );
  CLKXOR2X2M U57 ( .A(N54), .B(edge_counter[2]), .Y(n14) );
  CLKXOR2X2M U58 ( .A(N55), .B(edge_counter[3]), .Y(n13) );
  AOI22X1M U59 ( .A0(n21), .A1(n22), .B0(n23), .B1(n24), .Y(n18) );
  CLKINVX1M U60 ( .A(parity_en), .Y(n22) );
  AOI31X1M U61 ( .A0(n23), .A1(n26), .A2(n27), .B0(n28), .Y(n25) );
  CLKINVX1M U62 ( .A(n29), .Y(n23) );
  CLKXOR2X2M U63 ( .A(edge_counter[2]), .B(N34), .Y(n36) );
  CLKXOR2X2M U64 ( .A(edge_counter[1]), .B(N33), .Y(n35) );
  CLKXOR2X2M U65 ( .A(n38), .B(N36), .Y(n33) );
  CLKINVX1M U66 ( .A(edge_counter[4]), .Y(n38) );
  XNOR2X1M U67 ( .A(edge_counter[5]), .B(N37), .Y(n32) );
  XNOR2X1M U68 ( .A(edge_counter[3]), .B(N35), .Y(n31) );
  AND3X1M U69 ( .A(bit_counter[3]), .B(bit_counter[0]), .C(n39), .Y(n21) );
  CLKXOR2X2M U70 ( .A(prescale[4]), .B(edge_counter[4]), .Y(n46) );
  CLKXOR2X2M U71 ( .A(prescale[1]), .B(edge_counter[1]), .Y(n45) );
  CLKXOR2X2M U72 ( .A(prescale[0]), .B(edge_counter[0]), .Y(n44) );
  CLKXOR2X2M U73 ( .A(n47), .B(prescale[2]), .Y(n42) );
  XNOR2X1M U74 ( .A(edge_counter[3]), .B(prescale[3]), .Y(n41) );
  XNOR2X1M U75 ( .A(edge_counter[5]), .B(prescale[5]), .Y(n40) );
  NOR2X1M U76 ( .A(n20), .B(n48), .Y(N81) );
  CLKXOR2X2M U77 ( .A(third_sample_edge[4]), .B(edge_counter[4]), .Y(n55) );
  CLKXOR2X2M U78 ( .A(third_sample_edge[1]), .B(edge_counter[1]), .Y(n54) );
  CLKXOR2X2M U79 ( .A(third_sample_edge[0]), .B(edge_counter[0]), .Y(n53) );
  CLKXOR2X2M U80 ( .A(n47), .B(third_sample_edge[2]), .Y(n51) );
  CLKINVX1M U81 ( .A(edge_counter[2]), .Y(n47) );
  XNOR2X1M U82 ( .A(edge_counter[3]), .B(third_sample_edge[3]), .Y(n50) );
  XNOR2X1M U83 ( .A(edge_counter[5]), .B(third_sample_edge[5]), .Y(n49) );
endmodule


module data_sampling ( clock, reset, edge_counter, data_in, prescale, data_out
 );
  input [5:0] edge_counter;
  input [5:0] prescale;
  input clock, reset, data_in;
  output data_out;
  wire   sample1, sample2, sample3, N1, N2, N3, N4, N5, N7, N8, N9, N10, N11,
         N12, N13, N14, N15, n3, n4, n5, n6, \sub_35/carry[4] ,
         \sub_35/carry[3] , n1, n2, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34;
  assign N1 = prescale[1];

  DFFRQX2M sample3_reg ( .D(n5), .CK(clock), .RN(reset), .Q(sample3) );
  DFFRQX2M sample1_reg ( .D(n4), .CK(clock), .RN(reset), .Q(sample1) );
  DFFRQX2M sample2_reg ( .D(n6), .CK(clock), .RN(reset), .Q(sample2) );
  NOR2X2M U3 ( .A(prescale[5]), .B(\sub_35/carry[4] ), .Y(n1) );
  NOR4X2M U4 ( .A(n32), .B(n31), .C(n30), .D(n29), .Y(N15) );
  NOR3X4M U5 ( .A(prescale[4]), .B(prescale[5]), .C(n7), .Y(N13) );
  NOR4X2M U6 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(N7) );
  NOR4X2M U7 ( .A(n24), .B(n23), .C(n22), .D(n21), .Y(N14) );
  OR2X2M U8 ( .A(n2), .B(prescale[3]), .Y(n7) );
  NAND2BX2M U9 ( .AN(prescale[2]), .B(N8), .Y(n2) );
  OAI2BB1XLM U10 ( .A0N(n2), .A1N(prescale[3]), .B0(n7), .Y(N10) );
  NOR2BX2M U11 ( .AN(edge_counter[0]), .B(N8), .Y(n17) );
  NOR2BX2M U12 ( .AN(edge_counter[0]), .B(N1), .Y(n9) );
  NOR2BX2M U13 ( .AN(edge_counter[0]), .B(N1), .Y(n25) );
  NOR2BX2M U14 ( .AN(N8), .B(edge_counter[0]), .Y(n18) );
  NOR2BX2M U15 ( .AN(N1), .B(edge_counter[0]), .Y(n26) );
  NOR2BX2M U16 ( .AN(N1), .B(edge_counter[0]), .Y(n10) );
  OAI21X4M U17 ( .A0(n34), .A1(n33), .B0(n3), .Y(data_out) );
  INVX2M U18 ( .A(N1), .Y(N8) );
  INVX2M U19 ( .A(prescale[2]), .Y(N2) );
  OAI2BB2X1M U20 ( .B0(N14), .B1(n33), .A0N(data_in), .A1N(N14), .Y(n6) );
  OAI2BB2X1M U21 ( .B0(N7), .B1(n34), .A0N(N7), .A1N(data_in), .Y(n4) );
  AO2B2XLM U22 ( .B0(data_in), .B1(N15), .A0(sample3), .A1N(N15), .Y(n5) );
  OAI21X2M U23 ( .A0(sample1), .A1(sample2), .B0(sample3), .Y(n3) );
  INVX2M U24 ( .A(sample2), .Y(n33) );
  INVX2M U25 ( .A(sample1), .Y(n34) );
  XNOR2X1M U26 ( .A(\sub_35/carry[4] ), .B(prescale[5]), .Y(N5) );
  OR2X1M U27 ( .A(prescale[4]), .B(\sub_35/carry[3] ), .Y(\sub_35/carry[4] )
         );
  XNOR2X1M U28 ( .A(\sub_35/carry[3] ), .B(prescale[4]), .Y(N4) );
  OR2X1M U29 ( .A(prescale[3]), .B(prescale[2]), .Y(\sub_35/carry[3] ) );
  XNOR2X1M U30 ( .A(prescale[2]), .B(prescale[3]), .Y(N3) );
  OAI2BB1X1M U31 ( .A0N(N1), .A1N(prescale[2]), .B0(n2), .Y(N9) );
  XNOR2X1M U32 ( .A(prescale[4]), .B(n7), .Y(N11) );
  OAI21X1M U33 ( .A0(prescale[4]), .A1(n7), .B0(prescale[5]), .Y(n8) );
  NAND2BX1M U34 ( .AN(N13), .B(n8), .Y(N12) );
  OAI2B2X1M U35 ( .A1N(N2), .A0(n9), .B0(edge_counter[1]), .B1(n9), .Y(n12) );
  OAI2B2X1M U36 ( .A1N(edge_counter[1]), .A0(n10), .B0(N2), .B1(n10), .Y(n11)
         );
  NAND4BBX1M U37 ( .AN(n1), .BN(edge_counter[5]), .C(n12), .D(n11), .Y(n16) );
  CLKXOR2X2M U38 ( .A(N5), .B(edge_counter[4]), .Y(n15) );
  CLKXOR2X2M U39 ( .A(N3), .B(edge_counter[2]), .Y(n14) );
  CLKXOR2X2M U40 ( .A(N4), .B(edge_counter[3]), .Y(n13) );
  OAI2B2X1M U41 ( .A1N(N9), .A0(n17), .B0(edge_counter[1]), .B1(n17), .Y(n20)
         );
  OAI2B2X1M U42 ( .A1N(edge_counter[1]), .A0(n18), .B0(N9), .B1(n18), .Y(n19)
         );
  NAND4BBX1M U43 ( .AN(N13), .BN(edge_counter[5]), .C(n20), .D(n19), .Y(n24)
         );
  CLKXOR2X2M U44 ( .A(N12), .B(edge_counter[4]), .Y(n23) );
  CLKXOR2X2M U45 ( .A(N10), .B(edge_counter[2]), .Y(n22) );
  CLKXOR2X2M U46 ( .A(N11), .B(edge_counter[3]), .Y(n21) );
  OAI2B2X1M U47 ( .A1N(prescale[2]), .A0(n25), .B0(edge_counter[1]), .B1(n25), 
        .Y(n28) );
  OAI2B2X1M U48 ( .A1N(edge_counter[1]), .A0(n26), .B0(prescale[2]), .B1(n26), 
        .Y(n27) );
  NAND3BX1M U49 ( .AN(edge_counter[5]), .B(n28), .C(n27), .Y(n32) );
  CLKXOR2X2M U50 ( .A(prescale[5]), .B(edge_counter[4]), .Y(n31) );
  CLKXOR2X2M U51 ( .A(prescale[3]), .B(edge_counter[2]), .Y(n30) );
  CLKXOR2X2M U52 ( .A(prescale[4]), .B(edge_counter[3]), .Y(n29) );
endmodule


module deserializer ( enable, clock, reset, data_in, shift_reg );
  output [7:0] shift_reg;
  input enable, clock, reset, data_in;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n5, n6, n7, n8,
         n17, n18;

  DFFRQX2M \shift_reg_reg[4]  ( .D(n13), .CK(clock), .RN(reset), .Q(
        shift_reg[4]) );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n16), .CK(clock), .RN(reset), .Q(
        shift_reg[7]) );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n11), .CK(clock), .RN(reset), .Q(
        shift_reg[2]) );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n10), .CK(clock), .RN(reset), .Q(
        shift_reg[1]) );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n12), .CK(clock), .RN(reset), .Q(
        shift_reg[3]) );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n14), .CK(clock), .RN(reset), .Q(
        shift_reg[5]) );
  DFFRX2M \shift_reg_reg[6]  ( .D(n15), .CK(clock), .RN(reset), .QN(n3) );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n9), .CK(clock), .RN(reset), .Q(
        shift_reg[0]) );
  INVX2M U2 ( .A(n3), .Y(shift_reg[6]) );
  INVX2M U3 ( .A(shift_reg[2]), .Y(n2) );
  INVX2M U4 ( .A(shift_reg[4]), .Y(n5) );
  INVX2M U5 ( .A(shift_reg[7]), .Y(n1) );
  CLKINVX2M U6 ( .A(shift_reg[1]), .Y(n18) );
  OAI2BB2X1M U7 ( .B0(n7), .B1(n18), .A0N(shift_reg[0]), .A1N(n7), .Y(n9) );
  INVX4M U8 ( .A(n6), .Y(n7) );
  OAI22X1M U9 ( .A0(n7), .A1(n1), .B0(n6), .B1(n3), .Y(n15) );
  OAI22X1M U10 ( .A0(n7), .A1(n17), .B0(n6), .B1(n2), .Y(n11) );
  OAI22X1M U11 ( .A0(n7), .A1(n5), .B0(n6), .B1(n17), .Y(n12) );
  OAI22X1M U12 ( .A0(n7), .A1(n2), .B0(n6), .B1(n18), .Y(n10) );
  OAI22X1M U13 ( .A0(n7), .A1(n8), .B0(n6), .B1(n5), .Y(n13) );
  OAI22X1M U14 ( .A0(n7), .A1(n3), .B0(n6), .B1(n8), .Y(n14) );
  OAI2BB2X1M U15 ( .B0(n6), .B1(n1), .A0N(data_in), .A1N(n6), .Y(n16) );
  CLKBUFX6M U16 ( .A(enable), .Y(n6) );
  CLKINVX1M U17 ( .A(shift_reg[3]), .Y(n17) );
  CLKINVX1M U18 ( .A(shift_reg[5]), .Y(n8) );
endmodule


module edge_bit_counter ( clock, reset, enable, prescale, edge_counter, 
        bit_counter );
  input [5:0] prescale;
  output [5:0] edge_counter;
  output [3:0] bit_counter;
  input clock, reset, enable;
  wire   N6, N10, N11, N12, N13, N14, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, \add_37_aco/carry[5] , \add_37_aco/carry[4] ,
         \add_37_aco/carry[3] , \add_37_aco/carry[2] , \mult_add_37_aco/B[0] ,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32;
  wire   [5:0] edge_counter_comb;

  DFFRHQX8M \edge_counter_reg[1]  ( .D(edge_counter_comb[1]), .CK(clock), .RN(
        reset), .Q(edge_counter[1]) );
  DFFRHQX8M \edge_counter_reg[0]  ( .D(edge_counter_comb[0]), .CK(clock), .RN(
        reset), .Q(edge_counter[0]) );
  DFFRQX2M \bit_counter_reg[0]  ( .D(n21), .CK(clock), .RN(reset), .Q(
        bit_counter[0]) );
  DFFRQX2M \bit_counter_reg[3]  ( .D(n20), .CK(clock), .RN(reset), .Q(
        bit_counter[3]) );
  DFFRQX2M \bit_counter_reg[2]  ( .D(n19), .CK(clock), .RN(reset), .Q(
        bit_counter[2]) );
  DFFRQX4M \edge_counter_reg[3]  ( .D(edge_counter_comb[3]), .CK(clock), .RN(
        reset), .Q(edge_counter[3]) );
  DFFRQX4M \edge_counter_reg[4]  ( .D(edge_counter_comb[4]), .CK(clock), .RN(
        reset), .Q(edge_counter[4]) );
  DFFRQX4M \edge_counter_reg[5]  ( .D(edge_counter_comb[5]), .CK(clock), .RN(
        reset), .Q(edge_counter[5]) );
  DFFRQX4M \edge_counter_reg[2]  ( .D(edge_counter_comb[2]), .CK(clock), .RN(
        reset), .Q(edge_counter[2]) );
  DFFRQX4M \bit_counter_reg[1]  ( .D(n18), .CK(clock), .RN(reset), .Q(
        bit_counter[1]) );
  AND2X2M U3 ( .A(edge_counter[2]), .B(\mult_add_37_aco/B[0] ), .Y(n1) );
  AND2X2M U4 ( .A(edge_counter[1]), .B(\mult_add_37_aco/B[0] ), .Y(n2) );
  AND2X2M U5 ( .A(edge_counter[3]), .B(\mult_add_37_aco/B[0] ), .Y(n3) );
  AND2X2M U6 ( .A(edge_counter[4]), .B(\mult_add_37_aco/B[0] ), .Y(n4) );
  AND2X2M U7 ( .A(\mult_add_37_aco/B[0] ), .B(edge_counter[5]), .Y(n5) );
  AOI2BB2X1M U8 ( .B0(enable), .B1(n31), .A0N(n7), .A1N(n12), .Y(n15) );
  OAI31X2M U9 ( .A0(n17), .A1(bit_counter[0]), .A2(N6), .B0(n11), .Y(n16) );
  NOR4X4M U10 ( .A(n27), .B(n26), .C(n25), .D(n24), .Y(N6) );
  NOR2BX2M U11 ( .AN(edge_counter[0]), .B(prescale[0]), .Y(n8) );
  NOR2BX2M U12 ( .AN(prescale[0]), .B(edge_counter[0]), .Y(n9) );
  CLKAND2X2M U13 ( .A(edge_counter[0]), .B(\mult_add_37_aco/B[0] ), .Y(n6) );
  NOR2X1M U14 ( .A(n7), .B(n16), .Y(n21) );
  INVX2M U15 ( .A(bit_counter[2]), .Y(n31) );
  CLKBUFX6M U16 ( .A(n28), .Y(n7) );
  INVXLM U17 ( .A(enable), .Y(n28) );
  NOR2X2M U18 ( .A(n6), .B(n7), .Y(edge_counter_comb[0]) );
  NOR2BX2M U19 ( .AN(N10), .B(n7), .Y(edge_counter_comb[1]) );
  NOR2BX2M U20 ( .AN(N11), .B(n7), .Y(edge_counter_comb[2]) );
  NOR2BX2M U21 ( .AN(N12), .B(n7), .Y(edge_counter_comb[3]) );
  NOR2BX2M U22 ( .AN(N13), .B(n7), .Y(edge_counter_comb[4]) );
  CLKINVX3M U23 ( .A(N6), .Y(\mult_add_37_aco/B[0] ) );
  INVX2M U24 ( .A(n11), .Y(n29) );
  NOR2X2M U25 ( .A(n30), .B(n11), .Y(n12) );
  OAI33X2M U26 ( .A0(n30), .A1(n29), .A2(n7), .B0(n7), .B1(bit_counter[1]), 
        .B2(n11), .Y(n18) );
  OAI32X2M U27 ( .A0(n14), .A1(n30), .A2(n31), .B0(n15), .B1(n32), .Y(n20) );
  NAND3XLM U28 ( .A(n29), .B(n32), .C(enable), .Y(n14) );
  INVX2M U29 ( .A(bit_counter[3]), .Y(n32) );
  OAI31X2M U30 ( .A0(n31), .A1(n12), .A2(n7), .B0(n13), .Y(n19) );
  NAND4X1M U31 ( .A(bit_counter[1]), .B(enable), .C(n29), .D(n31), .Y(n13) );
  NOR3X2M U32 ( .A(bit_counter[1]), .B(bit_counter[3]), .C(bit_counter[2]), 
        .Y(n17) );
  NOR2BX2M U33 ( .AN(N14), .B(n7), .Y(edge_counter_comb[5]) );
  ADDHX1M U34 ( .A(n2), .B(n6), .CO(\add_37_aco/carry[2] ), .S(N10) );
  ADDHX1M U35 ( .A(n3), .B(\add_37_aco/carry[3] ), .CO(\add_37_aco/carry[4] ), 
        .S(N12) );
  ADDHX1M U36 ( .A(n1), .B(\add_37_aco/carry[2] ), .CO(\add_37_aco/carry[3] ), 
        .S(N11) );
  ADDHX1M U37 ( .A(n4), .B(\add_37_aco/carry[4] ), .CO(\add_37_aco/carry[5] ), 
        .S(N13) );
  NAND2X2M U38 ( .A(bit_counter[0]), .B(N6), .Y(n11) );
  CLKINVX2M U39 ( .A(bit_counter[1]), .Y(n30) );
  CLKXOR2X2M U40 ( .A(\add_37_aco/carry[5] ), .B(n5), .Y(N14) );
  OAI2B2X1M U41 ( .A1N(prescale[1]), .A0(n8), .B0(edge_counter[1]), .B1(n8), 
        .Y(n23) );
  OAI2B2X1M U42 ( .A1N(edge_counter[1]), .A0(n9), .B0(prescale[1]), .B1(n9), 
        .Y(n22) );
  XNOR2X1M U43 ( .A(prescale[5]), .B(edge_counter[5]), .Y(n10) );
  NAND3X1M U44 ( .A(n23), .B(n22), .C(n10), .Y(n27) );
  CLKXOR2X2M U45 ( .A(prescale[4]), .B(edge_counter[4]), .Y(n26) );
  CLKXOR2X2M U46 ( .A(prescale[2]), .B(edge_counter[2]), .Y(n25) );
  CLKXOR2X2M U47 ( .A(prescale[3]), .B(edge_counter[3]), .Y(n24) );
endmodule


module parity_check ( data_in, parity_bit, enable, clock, reset, parity_type, 
        parity_error );
  input [7:0] data_in;
  input parity_bit, enable, clock, reset, parity_type;
  output parity_error;
  wire   n1, n3, n4, n8, n2, n5, n6, n7;

  DFFRQX2M parity_error_reg ( .D(n8), .CK(clock), .RN(reset), .Q(parity_error)
         );
  XOR3XLM U2 ( .A(n3), .B(n4), .C(n2), .Y(n1) );
  XNOR2X2M U3 ( .A(parity_type), .B(data_in[1]), .Y(n2) );
  XNOR2X2M U4 ( .A(parity_bit), .B(data_in[7]), .Y(n5) );
  XOR3XLM U5 ( .A(data_in[6]), .B(data_in[5]), .C(n5), .Y(n4) );
  CLKXOR2X2M U6 ( .A(data_in[4]), .B(data_in[3]), .Y(n6) );
  XNOR3X1M U7 ( .A(data_in[2]), .B(data_in[0]), .C(n6), .Y(n3) );
  OAI2BB2X1M U8 ( .B0(n1), .B1(n7), .A0N(parity_error), .A1N(n7), .Y(n8) );
  CLKINVX1M U9 ( .A(enable), .Y(n7) );
endmodule


module start_check ( data_in, clock, reset, enable, glitch );
  input data_in, clock, reset, enable;
  output glitch;
  wire   n1;

  DFFRQX2M glitch_reg ( .D(n1), .CK(clock), .RN(reset), .Q(glitch) );
  AO2B2XLM U2 ( .B0(enable), .B1(data_in), .A0(glitch), .A1N(enable), .Y(n1)
         );
endmodule


module stop_check ( data_in, enable, clock, reset, stop_error );
  input data_in, enable, clock, reset;
  output stop_error;
  wire   n2, n1;

  DFFRQX2M stop_error_reg ( .D(n2), .CK(clock), .RN(reset), .Q(stop_error) );
  OAI2BB2X1M U2 ( .B0(data_in), .B1(n1), .A0N(stop_error), .A1N(n1), .Y(n2) );
  INVX2M U3 ( .A(enable), .Y(n1) );
endmodule


module UART_Rx ( RX_IN, prescale, PAR_EN, PAR_TYP, CLK, RST, P_DATA, PAR_ERR, 
        STP_ERR, data_valid );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, CLK, RST;
  output PAR_ERR, STP_ERR, data_valid;
  wire   n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, start_glitch,
         counter_en, deserializer_en, start_check_en, parity_check_en,
         stop_check_en, sampler_output, n2, n3, n5, n6, n7, n8, n10, n11, n13,
         n14, n16, n17, n19, n20, n22, n23, n25, n26, n28, n29;
  wire   [3:0] bit_counter;
  wire   [5:0] edge_counter;

  UART_Rx_FSM U0_FSM ( .clock(CLK), .reset(RST), .data_in(RX_IN), .parity_en(
        PAR_EN), .bit_counter(bit_counter), .edge_counter(edge_counter), 
        .prescale(prescale), .start_glitch(start_glitch), .parity_error(n26), 
        .stop_error(n5), .counter_en(counter_en), .deserializer_en(
        deserializer_en), .start_check_en(start_check_en), .parity_check_en(
        parity_check_en), .stop_check_en(stop_check_en), .data_valid(
        data_valid) );
  data_sampling U1_Sampler ( .clock(CLK), .reset(RST), .edge_counter(
        edge_counter), .data_in(RX_IN), .prescale(prescale), .data_out(
        sampler_output) );
  deserializer U2_Deserializer ( .enable(deserializer_en), .clock(CLK), 
        .reset(RST), .data_in(sampler_output), .shift_reg({n31, n32, n33, n34, 
        n35, n36, n37, n38}) );
  edge_bit_counter U3_Counter ( .clock(CLK), .reset(RST), .enable(counter_en), 
        .prescale(prescale), .edge_counter(edge_counter), .bit_counter(
        bit_counter) );
  parity_check U4_Parity ( .data_in({n8, n17, n20, n2, n11, n23, n14, n29}), 
        .parity_bit(sampler_output), .enable(parity_check_en), .clock(CLK), 
        .reset(RST), .parity_type(PAR_TYP), .parity_error(n39) );
  start_check U5_Start ( .data_in(sampler_output), .clock(CLK), .reset(RST), 
        .enable(start_check_en), .glitch(start_glitch) );
  stop_check U6_Stop ( .data_in(sampler_output), .enable(stop_check_en), 
        .clock(CLK), .reset(RST), .stop_error(n40) );
  INVX2M U1 ( .A(n7), .Y(n8) );
  BUFX2M U2 ( .A(n34), .Y(n2) );
  INVX2M U3 ( .A(n10), .Y(n11) );
  INVX2M U4 ( .A(n22), .Y(n23) );
  INVX2M U5 ( .A(n28), .Y(n29) );
  INVX2M U6 ( .A(n13), .Y(n14) );
  INVX2M U7 ( .A(n19), .Y(n20) );
  INVX2M U8 ( .A(n16), .Y(n17) );
  BUFX2M U9 ( .A(n40), .Y(n5) );
  INVX2M U10 ( .A(n25), .Y(n26) );
  CLKINVX1M U11 ( .A(n34), .Y(n3) );
  CLKINVX40M U12 ( .A(n3), .Y(P_DATA[4]) );
  CLKINVX1M U13 ( .A(n40), .Y(n6) );
  CLKINVX40M U14 ( .A(n6), .Y(STP_ERR) );
  CLKINVX2M U15 ( .A(n31), .Y(n7) );
  CLKINVX40M U16 ( .A(n7), .Y(P_DATA[7]) );
  CLKINVX2M U17 ( .A(n35), .Y(n10) );
  CLKINVX40M U18 ( .A(n10), .Y(P_DATA[3]) );
  CLKINVX2M U19 ( .A(n37), .Y(n13) );
  CLKINVX40M U20 ( .A(n13), .Y(P_DATA[1]) );
  CLKINVX2M U21 ( .A(n32), .Y(n16) );
  CLKINVX40M U22 ( .A(n16), .Y(P_DATA[6]) );
  CLKINVX2M U23 ( .A(n33), .Y(n19) );
  CLKINVX40M U24 ( .A(n19), .Y(P_DATA[5]) );
  CLKINVX2M U25 ( .A(n36), .Y(n22) );
  CLKINVX40M U26 ( .A(n22), .Y(P_DATA[2]) );
  CLKINVX2M U27 ( .A(n39), .Y(n25) );
  CLKINVX40M U28 ( .A(n25), .Y(PAR_ERR) );
  CLKINVX2M U29 ( .A(n38), .Y(n28) );
  CLKINVX40M U30 ( .A(n28), .Y(P_DATA[0]) );
endmodule


module UART ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, P_DATA_TX, DATA_VALID_TX, 
        RX_IN, PRESCALE_RX, TX_OUT, BUSY_TX, P_DATA_RX, PAR_ERR_RX, STP_ERR_RX, 
        DATA_VALID_RX );
  input [7:0] P_DATA_TX;
  input [5:0] PRESCALE_RX;
  output [7:0] P_DATA_RX;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, DATA_VALID_TX, RX_IN;
  output TX_OUT, BUSY_TX, PAR_ERR_RX, STP_ERR_RX, DATA_VALID_RX;
  wire   n1, n2, n3, n4, n5, n6;

  UART_Tx U0_UART_Tx ( .CLK(TX_CLK), .RST(RST), .PAR_TYP(PAR_TYP), .PAR_EN(
        PAR_EN), .P_DATA(P_DATA_TX), .DATA_VALID(DATA_VALID_TX), .TX_OUT(
        TX_OUT), .Busy(BUSY_TX) );
  UART_Rx U1_UART_Rx ( .RX_IN(RX_IN), .prescale({n6, n5, n4, n3, n2, n1}), 
        .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .CLK(RX_CLK), .RST(RST), .P_DATA(
        P_DATA_RX), .PAR_ERR(PAR_ERR_RX), .STP_ERR(STP_ERR_RX), .data_valid(
        DATA_VALID_RX) );
  BUFX6M U1 ( .A(PRESCALE_RX[1]), .Y(n2) );
  BUFX6M U2 ( .A(PRESCALE_RX[2]), .Y(n3) );
  CLKBUFX6M U3 ( .A(PRESCALE_RX[4]), .Y(n5) );
  BUFX4M U4 ( .A(PRESCALE_RX[0]), .Y(n1) );
  CLKBUFX6M U5 ( .A(PRESCALE_RX[3]), .Y(n4) );
  CLKBUFX6M U6 ( .A(PRESCALE_RX[5]), .Y(n6) );
endmodule

