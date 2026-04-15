/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Jul 11 00:26:58 2022
/////////////////////////////////////////////////////////////


module Up_Dn_Counter ( IN, Load, Up, Down, clk, Counter, High, Low );
  input [4:0] IN;
  output [4:0] Counter;
  input Load, Up, Down, clk;
  output High, Low;
  wire   N18, N19, N20, N21, N22, N23, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;

  EDFFHQX2M \Counter_reg[4]  ( .D(N23), .E(N18), .CK(clk), .Q(Counter[4]) );
  EDFFHQX2M \Counter_reg[3]  ( .D(N22), .E(N18), .CK(clk), .Q(Counter[3]) );
  EDFFHQX2M \Counter_reg[2]  ( .D(N21), .E(N18), .CK(clk), .Q(Counter[2]) );
  EDFFHQX2M \Counter_reg[1]  ( .D(N20), .E(N18), .CK(clk), .Q(Counter[1]) );
  EDFFHQX2M \Counter_reg[0]  ( .D(N19), .E(N18), .CK(clk), .Q(Counter[0]) );
  OAI2BB2X1M U17 ( .B0(n11), .B1(n12), .A0N(Load), .A1N(IN[4]), .Y(N23) );
  XOR3XLM U18 ( .A(n13), .B(n14), .C(n15), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n16), .B1(n17), .A0N(n18), .A1N(n14), .Y(n15) );
  NOR2X1M U20 ( .A(n14), .B(n18), .Y(n16) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n19), .A0N(IN[3]), .A1N(Load), .Y(N22) );
  XOR3XLM U22 ( .A(n17), .B(n14), .C(n18), .Y(n19) );
  OAI2BB1X1M U23 ( .A0N(n20), .A1N(n14), .B0(n21), .Y(n18) );
  OAI21X1M U24 ( .A0(n14), .A1(n20), .B0(Counter[2]), .Y(n21) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n22), .A0N(IN[2]), .A1N(Load), .Y(N21) );
  XOR3XLM U26 ( .A(n23), .B(n14), .C(n20), .Y(n22) );
  OAI21X1M U27 ( .A0(n24), .A1(n25), .B0(n26), .Y(n20) );
  CLKINVX1M U28 ( .A(n25), .Y(n14) );
  OAI2BB2X1M U29 ( .B0(n27), .B1(n11), .A0N(IN[1]), .A1N(Load), .Y(N20) );
  AOI2B1X1M U30 ( .A1N(Counter[1]), .A0(n28), .B0(n29), .Y(n27) );
  MXI2X1M U31 ( .A(n26), .B(n30), .S0(n25), .Y(n29) );
  NAND2BX1M U32 ( .AN(Counter[0]), .B(Counter[1]), .Y(n30) );
  XNOR2X1M U33 ( .A(Counter[0]), .B(n25), .Y(n28) );
  OAI2BB2X1M U34 ( .B0(Counter[0]), .B1(n11), .A0N(IN[0]), .A1N(Load), .Y(N19)
         );
  NAND2BX1M U35 ( .AN(Load), .B(n11), .Y(N18) );
  AO21XLM U36 ( .A0(n25), .A1(n31), .B0(Load), .Y(n11) );
  NAND2BX1M U37 ( .AN(High), .B(Up), .Y(n31) );
  NOR4X1M U38 ( .A(n13), .B(n17), .C(n23), .D(n26), .Y(High) );
  CLKNAND2X2M U39 ( .A(Counter[1]), .B(Counter[0]), .Y(n26) );
  CLKNAND2X2M U40 ( .A(Down), .B(n32), .Y(n25) );
  CLKINVX1M U41 ( .A(n32), .Y(Low) );
  NAND4X1M U42 ( .A(n17), .B(n13), .C(n23), .D(n24), .Y(n32) );
  NOR2X1M U43 ( .A(Counter[0]), .B(Counter[1]), .Y(n24) );
  CLKINVX1M U44 ( .A(Counter[2]), .Y(n23) );
  CLKINVX1M U45 ( .A(Counter[4]), .Y(n13) );
  CLKINVX1M U46 ( .A(Counter[3]), .Y(n17) );
endmodule

