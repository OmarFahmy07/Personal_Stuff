/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Jul 11 01:24:59 2022
/////////////////////////////////////////////////////////////


module Up_Dn_Counter ( IN, Load, Up, Down, clk, Counter, High, Low );
  input [4:0] IN;
  output [4:0] Counter;
  input Load, Up, Down, clk;
  output High, Low;
  wire   n4, n5, n25, n26, n27, n28, n29, \r62/A[3] , \r62/A[4] , n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61;
  assign Counter[3] = \r62/A[3] ;
  assign Counter[4] = \r62/A[4] ;

  DFFQNX2M \Counter_reg[4]  ( .D(n28), .CK(clk), .QN(n5) );
  DFFQX2M \Counter_reg[2]  ( .D(n26), .CK(clk), .Q(Counter[2]) );
  DFFQNX2M \Counter_reg[3]  ( .D(n25), .CK(clk), .QN(n4) );
  DFFQX2M \Counter_reg[0]  ( .D(n29), .CK(clk), .Q(Counter[0]) );
  DFFQX2M \Counter_reg[1]  ( .D(n27), .CK(clk), .Q(Counter[1]) );
  CLKINVX1M U29 ( .A(n30), .Y(Low) );
  OAI2BB1X1M U30 ( .A0N(Load), .A1N(IN[0]), .B0(n31), .Y(n29) );
  MXI2X1M U31 ( .A(n32), .B(n33), .S0(Counter[0]), .Y(n31) );
  OAI2BB1X1M U32 ( .A0N(IN[4]), .A1N(Load), .B0(n34), .Y(n28) );
  AOI22X1M U33 ( .A0(n32), .A1(n35), .B0(n33), .B1(\r62/A[4] ), .Y(n34) );
  CLKINVX1M U34 ( .A(n5), .Y(\r62/A[4] ) );
  XOR3XLM U35 ( .A(n5), .B(n36), .C(n37), .Y(n35) );
  AOI21X1M U36 ( .A0(n36), .A1(n38), .B0(n39), .Y(n37) );
  AOI21X1M U37 ( .A0(n40), .A1(n41), .B0(n4), .Y(n39) );
  OAI221X1M U38 ( .A0(n42), .A1(n43), .B0(n44), .B1(n45), .C0(n46), .Y(n27) );
  CLKNAND2X2M U39 ( .A(IN[1]), .B(Load), .Y(n46) );
  AOI21X1M U40 ( .A0(n47), .A1(n44), .B0(n48), .Y(n42) );
  MXI2X1M U41 ( .A(n49), .B(n50), .S0(n36), .Y(n48) );
  CLKNAND2X2M U42 ( .A(Counter[1]), .B(n51), .Y(n49) );
  CLKINVX1M U43 ( .A(Counter[1]), .Y(n44) );
  CLKXOR2X2M U44 ( .A(n51), .B(n41), .Y(n47) );
  OAI221X1M U45 ( .A0(n43), .A1(n52), .B0(n53), .B1(n45), .C0(n54), .Y(n26) );
  CLKNAND2X2M U46 ( .A(IN[2]), .B(Load), .Y(n54) );
  CLKINVX1M U47 ( .A(n33), .Y(n45) );
  XOR3XLM U48 ( .A(Counter[2]), .B(n41), .C(n55), .Y(n52) );
  CLKINVX1M U49 ( .A(n32), .Y(n43) );
  OAI2BB1X1M U50 ( .A0N(IN[3]), .A1N(Load), .B0(n56), .Y(n25) );
  AOI22X1M U51 ( .A0(n32), .A1(n57), .B0(n33), .B1(\r62/A[3] ), .Y(n56) );
  CLKINVX1M U52 ( .A(n4), .Y(\r62/A[3] ) );
  NOR2X1M U53 ( .A(Load), .B(n32), .Y(n33) );
  XOR3XLM U54 ( .A(n4), .B(n36), .C(n40), .Y(n57) );
  CLKINVX1M U55 ( .A(n38), .Y(n40) );
  OAI2BB1X1M U56 ( .A0N(n55), .A1N(n36), .B0(n58), .Y(n38) );
  OAI21X1M U57 ( .A0(n36), .A1(n55), .B0(Counter[2]), .Y(n58) );
  CLKNAND2X2M U58 ( .A(n50), .B(n59), .Y(n55) );
  OAI21X1M U59 ( .A0(Counter[0]), .A1(Counter[1]), .B0(n36), .Y(n59) );
  CLKINVX1M U60 ( .A(n41), .Y(n36) );
  AOI21X1M U61 ( .A0(n41), .A1(n60), .B0(Load), .Y(n32) );
  NAND2BX1M U62 ( .AN(High), .B(Up), .Y(n60) );
  NOR4X1M U63 ( .A(n53), .B(n50), .C(n4), .D(n5), .Y(High) );
  CLKNAND2X2M U64 ( .A(Counter[1]), .B(Counter[0]), .Y(n50) );
  CLKINVX1M U65 ( .A(Counter[2]), .Y(n53) );
  CLKNAND2X2M U66 ( .A(Down), .B(n30), .Y(n41) );
  NAND4X1M U67 ( .A(n4), .B(n5), .C(n61), .D(n51), .Y(n30) );
  CLKINVX1M U68 ( .A(Counter[0]), .Y(n51) );
  NOR2X1M U69 ( .A(Counter[2]), .B(Counter[1]), .Y(n61) );
endmodule

