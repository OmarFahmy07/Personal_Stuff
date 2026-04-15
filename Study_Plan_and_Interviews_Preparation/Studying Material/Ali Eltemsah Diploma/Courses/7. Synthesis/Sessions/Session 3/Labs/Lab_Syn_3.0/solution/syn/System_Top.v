/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Jul 29 18:22:17 2022
/////////////////////////////////////////////////////////////


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, REG0, REG1, 
        REG2 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  input CLK, RST, WrEn, RdEn;
  wire   n392, n280, n281, n282, n283, n284, n285, \regArr[15][7] ,
         \regArr[15][6] , \regArr[15][5] , \regArr[15][4] , \regArr[15][3] ,
         \regArr[15][2] , \regArr[15][1] , \regArr[15][0] , \regArr[14][7] ,
         \regArr[14][6] , \regArr[14][5] , \regArr[14][4] , \regArr[14][3] ,
         \regArr[14][2] , \regArr[14][1] , \regArr[14][0] , \regArr[13][7] ,
         \regArr[13][6] , \regArr[13][5] , \regArr[13][4] , \regArr[13][3] ,
         \regArr[13][2] , \regArr[13][1] , \regArr[13][0] , \regArr[12][7] ,
         \regArr[12][6] , \regArr[12][5] , \regArr[12][4] , \regArr[12][3] ,
         \regArr[12][2] , \regArr[12][1] , \regArr[12][0] , \regArr[11][7] ,
         \regArr[11][6] , \regArr[11][5] , \regArr[11][4] , \regArr[11][3] ,
         \regArr[11][2] , \regArr[11][1] , \regArr[11][0] , \regArr[10][7] ,
         \regArr[10][6] , \regArr[10][5] , \regArr[10][4] , \regArr[10][3] ,
         \regArr[10][2] , \regArr[10][1] , \regArr[10][0] , \regArr[9][7] ,
         \regArr[9][6] , \regArr[9][5] , \regArr[9][4] , \regArr[9][3] ,
         \regArr[9][2] , \regArr[9][1] , \regArr[9][0] , \regArr[8][7] ,
         \regArr[8][6] , \regArr[8][5] , \regArr[8][4] , \regArr[8][3] ,
         \regArr[8][2] , \regArr[8][1] , \regArr[8][0] , \regArr[7][7] ,
         \regArr[7][6] , \regArr[7][5] , \regArr[7][4] , \regArr[7][3] ,
         \regArr[7][2] , \regArr[7][1] , \regArr[7][0] , \regArr[6][7] ,
         \regArr[6][6] , \regArr[6][5] , \regArr[6][4] , \regArr[6][3] ,
         \regArr[6][2] , \regArr[6][1] , \regArr[6][0] , \regArr[5][7] ,
         \regArr[5][6] , \regArr[5][5] , \regArr[5][4] , \regArr[5][3] ,
         \regArr[5][2] , \regArr[5][1] , \regArr[5][0] , \regArr[4][7] ,
         \regArr[4][6] , \regArr[4][5] , \regArr[4][4] , \regArr[4][3] ,
         \regArr[4][2] , \regArr[4][1] , \regArr[4][0] , \regArr[3][7] ,
         \regArr[3][6] , \regArr[3][5] , \regArr[3][4] , \regArr[3][3] ,
         \regArr[3][2] , \regArr[3][1] , \regArr[3][0] , N36, N37, N38, N39,
         N40, N41, N42, N43, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n224, n225, n227, n228, n229, n231, n233,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n223, n226, n230, n234, n324, n327,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391;
  assign REG1[2] = n283;
  assign REG1[1] = n284;

  EDFFHQX2M \RdData_reg[7]  ( .D(N36), .E(n323), .CK(CLK), .Q(RdData[7]) );
  EDFFHQX2M \RdData_reg[6]  ( .D(N37), .E(n323), .CK(CLK), .Q(RdData[6]) );
  EDFFHQX2M \RdData_reg[5]  ( .D(N38), .E(n323), .CK(CLK), .Q(RdData[5]) );
  EDFFHQX2M \RdData_reg[4]  ( .D(N39), .E(n323), .CK(CLK), .Q(RdData[4]) );
  EDFFHQX2M \RdData_reg[3]  ( .D(N40), .E(n323), .CK(CLK), .Q(RdData[3]) );
  EDFFHQX2M \RdData_reg[2]  ( .D(N41), .E(n323), .CK(CLK), .Q(RdData[2]) );
  EDFFHQX2M \RdData_reg[1]  ( .D(N42), .E(n323), .CK(CLK), .Q(RdData[1]) );
  EDFFHQX2M \RdData_reg[0]  ( .D(N43), .E(n323), .CK(CLK), .Q(RdData[0]) );
  DFFRQX1M \regArr_reg[9][7]  ( .D(n119), .CK(CLK), .RN(n388), .Q(
        \regArr[9][7] ) );
  DFFRQX1M \regArr_reg[9][6]  ( .D(n118), .CK(CLK), .RN(n388), .Q(
        \regArr[9][6] ) );
  DFFRQX1M \regArr_reg[9][5]  ( .D(n117), .CK(CLK), .RN(n388), .Q(
        \regArr[9][5] ) );
  DFFRQX1M \regArr_reg[9][4]  ( .D(n116), .CK(CLK), .RN(n388), .Q(
        \regArr[9][4] ) );
  DFFRQX1M \regArr_reg[9][3]  ( .D(n115), .CK(CLK), .RN(n388), .Q(
        \regArr[9][3] ) );
  DFFRQX1M \regArr_reg[9][2]  ( .D(n114), .CK(CLK), .RN(n388), .Q(
        \regArr[9][2] ) );
  DFFRQX1M \regArr_reg[9][1]  ( .D(n113), .CK(CLK), .RN(n387), .Q(
        \regArr[9][1] ) );
  DFFRQX1M \regArr_reg[9][0]  ( .D(n112), .CK(CLK), .RN(n387), .Q(
        \regArr[9][0] ) );
  DFFRQX1M \regArr_reg[5][7]  ( .D(n87), .CK(CLK), .RN(n387), .Q(
        \regArr[5][7] ) );
  DFFRQX1M \regArr_reg[5][6]  ( .D(n86), .CK(CLK), .RN(n387), .Q(
        \regArr[5][6] ) );
  DFFRQX1M \regArr_reg[5][5]  ( .D(n85), .CK(CLK), .RN(n387), .Q(
        \regArr[5][5] ) );
  DFFRQX1M \regArr_reg[5][4]  ( .D(n84), .CK(CLK), .RN(n387), .Q(
        \regArr[5][4] ) );
  DFFRQX1M \regArr_reg[5][3]  ( .D(n83), .CK(CLK), .RN(n387), .Q(
        \regArr[5][3] ) );
  DFFRQX1M \regArr_reg[5][2]  ( .D(n82), .CK(CLK), .RN(n387), .Q(
        \regArr[5][2] ) );
  DFFRQX1M \regArr_reg[5][1]  ( .D(n81), .CK(CLK), .RN(n387), .Q(
        \regArr[5][1] ) );
  DFFRQX1M \regArr_reg[5][0]  ( .D(n80), .CK(CLK), .RN(n387), .Q(
        \regArr[5][0] ) );
  DFFRQX1M \regArr_reg[11][7]  ( .D(n135), .CK(CLK), .RN(n386), .Q(
        \regArr[11][7] ) );
  DFFRQX1M \regArr_reg[11][6]  ( .D(n134), .CK(CLK), .RN(n386), .Q(
        \regArr[11][6] ) );
  DFFRQX1M \regArr_reg[11][5]  ( .D(n133), .CK(CLK), .RN(n386), .Q(
        \regArr[11][5] ) );
  DFFRQX1M \regArr_reg[11][4]  ( .D(n132), .CK(CLK), .RN(n386), .Q(
        \regArr[11][4] ) );
  DFFRQX1M \regArr_reg[11][3]  ( .D(n131), .CK(CLK), .RN(n386), .Q(
        \regArr[11][3] ) );
  DFFRQX1M \regArr_reg[11][2]  ( .D(n130), .CK(CLK), .RN(n386), .Q(
        \regArr[11][2] ) );
  DFFRQX1M \regArr_reg[11][1]  ( .D(n129), .CK(CLK), .RN(n386), .Q(
        \regArr[11][1] ) );
  DFFRQX1M \regArr_reg[11][0]  ( .D(n128), .CK(CLK), .RN(n386), .Q(
        \regArr[11][0] ) );
  DFFRQX1M \regArr_reg[7][7]  ( .D(n103), .CK(CLK), .RN(n385), .Q(
        \regArr[7][7] ) );
  DFFRQX1M \regArr_reg[7][6]  ( .D(n102), .CK(CLK), .RN(n385), .Q(
        \regArr[7][6] ) );
  DFFRQX1M \regArr_reg[7][5]  ( .D(n101), .CK(CLK), .RN(n385), .Q(
        \regArr[7][5] ) );
  DFFRQX1M \regArr_reg[7][4]  ( .D(n100), .CK(CLK), .RN(n385), .Q(
        \regArr[7][4] ) );
  DFFRQX1M \regArr_reg[7][3]  ( .D(n99), .CK(CLK), .RN(n385), .Q(
        \regArr[7][3] ) );
  DFFRQX1M \regArr_reg[7][2]  ( .D(n98), .CK(CLK), .RN(n385), .Q(
        \regArr[7][2] ) );
  DFFRQX1M \regArr_reg[7][1]  ( .D(n97), .CK(CLK), .RN(n385), .Q(
        \regArr[7][1] ) );
  DFFRQX1M \regArr_reg[7][0]  ( .D(n96), .CK(CLK), .RN(n385), .Q(
        \regArr[7][0] ) );
  DFFRQX1M \regArr_reg[10][7]  ( .D(n127), .CK(CLK), .RN(n384), .Q(
        \regArr[10][7] ) );
  DFFRQX1M \regArr_reg[10][6]  ( .D(n126), .CK(CLK), .RN(n383), .Q(
        \regArr[10][6] ) );
  DFFRQX1M \regArr_reg[10][5]  ( .D(n125), .CK(CLK), .RN(n383), .Q(
        \regArr[10][5] ) );
  DFFRQX1M \regArr_reg[10][4]  ( .D(n124), .CK(CLK), .RN(n383), .Q(
        \regArr[10][4] ) );
  DFFRQX1M \regArr_reg[10][3]  ( .D(n123), .CK(CLK), .RN(n383), .Q(
        \regArr[10][3] ) );
  DFFRQX1M \regArr_reg[10][2]  ( .D(n122), .CK(CLK), .RN(n383), .Q(
        \regArr[10][2] ) );
  DFFRQX1M \regArr_reg[10][1]  ( .D(n121), .CK(CLK), .RN(n383), .Q(
        \regArr[10][1] ) );
  DFFRQX1M \regArr_reg[10][0]  ( .D(n120), .CK(CLK), .RN(n383), .Q(
        \regArr[10][0] ) );
  DFFRQX1M \regArr_reg[6][7]  ( .D(n95), .CK(CLK), .RN(n383), .Q(
        \regArr[6][7] ) );
  DFFRQX1M \regArr_reg[6][6]  ( .D(n94), .CK(CLK), .RN(n383), .Q(
        \regArr[6][6] ) );
  DFFRQX1M \regArr_reg[6][5]  ( .D(n93), .CK(CLK), .RN(n383), .Q(
        \regArr[6][5] ) );
  DFFRQX1M \regArr_reg[6][4]  ( .D(n92), .CK(CLK), .RN(n383), .Q(
        \regArr[6][4] ) );
  DFFRQX1M \regArr_reg[6][3]  ( .D(n91), .CK(CLK), .RN(n383), .Q(
        \regArr[6][3] ) );
  DFFRQX1M \regArr_reg[6][2]  ( .D(n90), .CK(CLK), .RN(n383), .Q(
        \regArr[6][2] ) );
  DFFRQX1M \regArr_reg[6][1]  ( .D(n89), .CK(CLK), .RN(n382), .Q(
        \regArr[6][1] ) );
  DFFRQX1M \regArr_reg[6][0]  ( .D(n88), .CK(CLK), .RN(n382), .Q(
        \regArr[6][0] ) );
  DFFRQX1M \regArr_reg[8][7]  ( .D(n111), .CK(CLK), .RN(n382), .Q(
        \regArr[8][7] ) );
  DFFRQX1M \regArr_reg[8][6]  ( .D(n110), .CK(CLK), .RN(n382), .Q(
        \regArr[8][6] ) );
  DFFRQX1M \regArr_reg[8][5]  ( .D(n109), .CK(CLK), .RN(n382), .Q(
        \regArr[8][5] ) );
  DFFRQX1M \regArr_reg[8][4]  ( .D(n108), .CK(CLK), .RN(n381), .Q(
        \regArr[8][4] ) );
  DFFRQX1M \regArr_reg[8][3]  ( .D(n107), .CK(CLK), .RN(n381), .Q(
        \regArr[8][3] ) );
  DFFRQX1M \regArr_reg[8][2]  ( .D(n106), .CK(CLK), .RN(n381), .Q(
        \regArr[8][2] ) );
  DFFRQX1M \regArr_reg[8][1]  ( .D(n105), .CK(CLK), .RN(n381), .Q(
        \regArr[8][1] ) );
  DFFRQX1M \regArr_reg[8][0]  ( .D(n104), .CK(CLK), .RN(n381), .Q(
        \regArr[8][0] ) );
  DFFRQX1M \regArr_reg[4][7]  ( .D(n79), .CK(CLK), .RN(n381), .Q(
        \regArr[4][7] ) );
  DFFRQX1M \regArr_reg[4][6]  ( .D(n78), .CK(CLK), .RN(n381), .Q(
        \regArr[4][6] ) );
  DFFRQX1M \regArr_reg[4][5]  ( .D(n77), .CK(CLK), .RN(n381), .Q(
        \regArr[4][5] ) );
  DFFRQX1M \regArr_reg[4][4]  ( .D(n76), .CK(CLK), .RN(n381), .Q(
        \regArr[4][4] ) );
  DFFRQX1M \regArr_reg[4][3]  ( .D(n75), .CK(CLK), .RN(n381), .Q(
        \regArr[4][3] ) );
  DFFRQX1M \regArr_reg[4][2]  ( .D(n74), .CK(CLK), .RN(n381), .Q(
        \regArr[4][2] ) );
  DFFRQX1M \regArr_reg[4][1]  ( .D(n73), .CK(CLK), .RN(n381), .Q(
        \regArr[4][1] ) );
  DFFRQX1M \regArr_reg[4][0]  ( .D(n72), .CK(CLK), .RN(n381), .Q(
        \regArr[4][0] ) );
  DFFRQX1M \regArr_reg[13][7]  ( .D(n151), .CK(CLK), .RN(n384), .Q(
        \regArr[13][7] ) );
  DFFRQX1M \regArr_reg[13][6]  ( .D(n150), .CK(CLK), .RN(n379), .Q(
        \regArr[13][6] ) );
  DFFRQX1M \regArr_reg[13][5]  ( .D(n149), .CK(CLK), .RN(n388), .Q(
        \regArr[13][5] ) );
  DFFRQX1M \regArr_reg[13][4]  ( .D(n148), .CK(CLK), .RN(n388), .Q(
        \regArr[13][4] ) );
  DFFRQX1M \regArr_reg[13][3]  ( .D(n147), .CK(CLK), .RN(n388), .Q(
        \regArr[13][3] ) );
  DFFRQX1M \regArr_reg[13][2]  ( .D(n146), .CK(CLK), .RN(n388), .Q(
        \regArr[13][2] ) );
  DFFRQX1M \regArr_reg[13][1]  ( .D(n145), .CK(CLK), .RN(n388), .Q(
        \regArr[13][1] ) );
  DFFRQX1M \regArr_reg[13][0]  ( .D(n144), .CK(CLK), .RN(n388), .Q(
        \regArr[13][0] ) );
  DFFRQX1M \regArr_reg[12][7]  ( .D(n143), .CK(CLK), .RN(n382), .Q(
        \regArr[12][7] ) );
  DFFRQX1M \regArr_reg[12][6]  ( .D(n142), .CK(CLK), .RN(n382), .Q(
        \regArr[12][6] ) );
  DFFRQX1M \regArr_reg[12][5]  ( .D(n141), .CK(CLK), .RN(n382), .Q(
        \regArr[12][5] ) );
  DFFRQX1M \regArr_reg[12][4]  ( .D(n140), .CK(CLK), .RN(n382), .Q(
        \regArr[12][4] ) );
  DFFRQX1M \regArr_reg[12][3]  ( .D(n139), .CK(CLK), .RN(n382), .Q(
        \regArr[12][3] ) );
  DFFRQX1M \regArr_reg[12][2]  ( .D(n138), .CK(CLK), .RN(n382), .Q(
        \regArr[12][2] ) );
  DFFRQX1M \regArr_reg[12][1]  ( .D(n137), .CK(CLK), .RN(n382), .Q(
        \regArr[12][1] ) );
  DFFRQX1M \regArr_reg[12][0]  ( .D(n136), .CK(CLK), .RN(n382), .Q(
        \regArr[12][0] ) );
  DFFRQX1M \regArr_reg[15][7]  ( .D(n167), .CK(CLK), .RN(n387), .Q(
        \regArr[15][7] ) );
  DFFRQX1M \regArr_reg[15][6]  ( .D(n166), .CK(CLK), .RN(n387), .Q(
        \regArr[15][6] ) );
  DFFRQX1M \regArr_reg[15][5]  ( .D(n165), .CK(CLK), .RN(n387), .Q(
        \regArr[15][5] ) );
  DFFRQX1M \regArr_reg[15][4]  ( .D(n164), .CK(CLK), .RN(n386), .Q(
        \regArr[15][4] ) );
  DFFRQX1M \regArr_reg[15][3]  ( .D(n163), .CK(CLK), .RN(n386), .Q(
        \regArr[15][3] ) );
  DFFRQX1M \regArr_reg[15][2]  ( .D(n162), .CK(CLK), .RN(n386), .Q(
        \regArr[15][2] ) );
  DFFRQX1M \regArr_reg[15][1]  ( .D(n161), .CK(CLK), .RN(n386), .Q(
        \regArr[15][1] ) );
  DFFRQX1M \regArr_reg[15][0]  ( .D(n160), .CK(CLK), .RN(n386), .Q(
        \regArr[15][0] ) );
  DFFRQX1M \regArr_reg[14][7]  ( .D(n159), .CK(CLK), .RN(n384), .Q(
        \regArr[14][7] ) );
  DFFRQX1M \regArr_reg[14][6]  ( .D(n158), .CK(CLK), .RN(n384), .Q(
        \regArr[14][6] ) );
  DFFRQX1M \regArr_reg[14][5]  ( .D(n157), .CK(CLK), .RN(n384), .Q(
        \regArr[14][5] ) );
  DFFRQX1M \regArr_reg[14][4]  ( .D(n156), .CK(CLK), .RN(n384), .Q(
        \regArr[14][4] ) );
  DFFRQX1M \regArr_reg[14][3]  ( .D(n155), .CK(CLK), .RN(n384), .Q(
        \regArr[14][3] ) );
  DFFRQX1M \regArr_reg[14][2]  ( .D(n154), .CK(CLK), .RN(n384), .Q(
        \regArr[14][2] ) );
  DFFRQX1M \regArr_reg[14][1]  ( .D(n153), .CK(CLK), .RN(n384), .Q(
        \regArr[14][1] ) );
  DFFRQX1M \regArr_reg[14][0]  ( .D(n152), .CK(CLK), .RN(n384), .Q(
        \regArr[14][0] ) );
  DFFRQX1M \regArr_reg[3][7]  ( .D(n71), .CK(CLK), .RN(n385), .Q(
        \regArr[3][7] ) );
  DFFRQX1M \regArr_reg[3][6]  ( .D(n70), .CK(CLK), .RN(n385), .Q(
        \regArr[3][6] ) );
  DFFRQX1M \regArr_reg[3][5]  ( .D(n69), .CK(CLK), .RN(n385), .Q(
        \regArr[3][5] ) );
  DFFRQX1M \regArr_reg[3][4]  ( .D(n68), .CK(CLK), .RN(n385), .Q(
        \regArr[3][4] ) );
  DFFRQX1M \regArr_reg[3][3]  ( .D(n67), .CK(CLK), .RN(n385), .Q(
        \regArr[3][3] ) );
  DFFRQX1M \regArr_reg[3][2]  ( .D(n66), .CK(CLK), .RN(n384), .Q(
        \regArr[3][2] ) );
  DFFRQX1M \regArr_reg[3][1]  ( .D(n65), .CK(CLK), .RN(n384), .Q(
        \regArr[3][1] ) );
  DFFRQX1M \regArr_reg[3][0]  ( .D(n64), .CK(CLK), .RN(n384), .Q(
        \regArr[3][0] ) );
  DFFSQX2M \regArr_reg[2][2]  ( .D(n58), .CK(CLK), .SN(n379), .Q(REG2[2]) );
  DFFRQX2M \regArr_reg[2][7]  ( .D(n63), .CK(CLK), .RN(n380), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n62), .CK(CLK), .RN(n380), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n61), .CK(CLK), .RN(n380), .Q(REG2[5]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n60), .CK(CLK), .RN(n380), .Q(REG2[4]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n59), .CK(CLK), .RN(n380), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n57), .CK(CLK), .RN(n380), .Q(REG2[1]) );
  DFFRQX2M \regArr_reg[2][0]  ( .D(n56), .CK(CLK), .RN(n380), .Q(REG2[0]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n40), .CK(CLK), .RN(n380), .Q(REG0[0]) );
  DFFSQX2M \regArr_reg[0][1]  ( .D(n41), .CK(CLK), .SN(n379), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n42), .CK(CLK), .RN(n380), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n43), .CK(CLK), .RN(n380), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n44), .CK(CLK), .RN(n380), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n45), .CK(CLK), .RN(n380), .Q(REG0[5]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n46), .CK(CLK), .RN(n379), .Q(REG0[6]) );
  DFFSQX2M \regArr_reg[1][3]  ( .D(n51), .CK(CLK), .SN(n379), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[0][7]  ( .D(n47), .CK(CLK), .RN(n380), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n49), .CK(CLK), .RN(n379), .Q(n284) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n50), .CK(CLK), .RN(n379), .Q(n283) );
  DFFRQX1M \regArr_reg[1][4]  ( .D(n52), .CK(CLK), .RN(n379), .Q(n282) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n48), .CK(CLK), .RN(n379), .Q(n285) );
  DFFRQX1M \regArr_reg[1][6]  ( .D(n54), .CK(CLK), .RN(n379), .Q(n392) );
  DFFRQX1M \regArr_reg[1][5]  ( .D(n53), .CK(CLK), .RN(n379), .Q(n281) );
  DFFRQX1M \regArr_reg[1][7]  ( .D(n55), .CK(CLK), .RN(RST), .Q(n280) );
  INVX2M U326 ( .A(n285), .Y(n327) );
  OR2X2M U327 ( .A(n206), .B(Address[2]), .Y(n223) );
  OR2X2M U328 ( .A(Address[1]), .B(Address[2]), .Y(n226) );
  INVXLM U329 ( .A(n280), .Y(n230) );
  INVX6M U330 ( .A(n230), .Y(REG1[7]) );
  INVXLM U331 ( .A(n281), .Y(n234) );
  INVX8M U332 ( .A(n234), .Y(REG1[5]) );
  INVXLM U333 ( .A(n392), .Y(n324) );
  INVX8M U334 ( .A(n324), .Y(REG1[6]) );
  BUFX10M U335 ( .A(n282), .Y(REG1[4]) );
  INVX8M U336 ( .A(n327), .Y(REG1[0]) );
  AND2X2M U337 ( .A(n358), .B(n229), .Y(n220) );
  NOR2BX4M U338 ( .AN(n229), .B(n355), .Y(n233) );
  NOR2BX4M U339 ( .AN(n229), .B(n356), .Y(n231) );
  AND2X2M U340 ( .A(n357), .B(n229), .Y(n218) );
  BUFX4M U341 ( .A(n215), .Y(n333) );
  BUFX4M U342 ( .A(n214), .Y(n335) );
  BUFX4M U343 ( .A(n213), .Y(n337) );
  BUFX4M U344 ( .A(n212), .Y(n339) );
  BUFX4M U345 ( .A(n211), .Y(n341) );
  BUFX4M U346 ( .A(n210), .Y(n343) );
  BUFX4M U347 ( .A(n209), .Y(n345) );
  BUFX4M U348 ( .A(n208), .Y(n347) );
  NOR2X4M U349 ( .A(n201), .B(RdEn), .Y(n229) );
  INVX4M U350 ( .A(n376), .Y(n199) );
  INVX4M U351 ( .A(n360), .Y(n195) );
  INVX4M U352 ( .A(n378), .Y(n200) );
  INVX4M U353 ( .A(n362), .Y(n196) );
  INVX4M U354 ( .A(n359), .Y(n193) );
  INVX4M U355 ( .A(n363), .Y(n198) );
  INVX4M U356 ( .A(n377), .Y(n194) );
  INVX4M U357 ( .A(n361), .Y(n197) );
  INVX8M U358 ( .A(n351), .Y(n203) );
  INVX8M U359 ( .A(n353), .Y(n202) );
  INVX4M U360 ( .A(n329), .Y(n364) );
  INVX4M U361 ( .A(n329), .Y(n365) );
  INVX4M U362 ( .A(n330), .Y(n368) );
  INVX4M U363 ( .A(n330), .Y(n369) );
  INVX4M U364 ( .A(n331), .Y(n370) );
  INVX4M U365 ( .A(n331), .Y(n371) );
  INVX4M U366 ( .A(n332), .Y(n366) );
  INVX4M U367 ( .A(n332), .Y(n367) );
  CLKBUFX8M U368 ( .A(n390), .Y(n379) );
  CLKBUFX8M U369 ( .A(n390), .Y(n380) );
  CLKBUFX8M U370 ( .A(n391), .Y(n381) );
  CLKBUFX8M U371 ( .A(n390), .Y(n382) );
  CLKBUFX8M U372 ( .A(n391), .Y(n383) );
  CLKBUFX8M U373 ( .A(n389), .Y(n385) );
  CLKBUFX8M U374 ( .A(n389), .Y(n386) );
  CLKBUFX8M U375 ( .A(n391), .Y(n387) );
  CLKBUFX8M U376 ( .A(n389), .Y(n384) );
  BUFX6M U377 ( .A(n390), .Y(n388) );
  CLKINVX12M U378 ( .A(n350), .Y(n204) );
  CLKINVX12M U379 ( .A(n349), .Y(n205) );
  CLKBUFX8M U380 ( .A(n224), .Y(n374) );
  NAND2X2M U381 ( .A(n351), .B(n218), .Y(n224) );
  CLKBUFX8M U382 ( .A(n222), .Y(n375) );
  NAND2X2M U383 ( .A(n351), .B(n220), .Y(n222) );
  CLKBUFX6M U384 ( .A(n216), .Y(n359) );
  NAND2X2M U385 ( .A(n220), .B(n204), .Y(n216) );
  CLKBUFX6M U386 ( .A(n217), .Y(n378) );
  NAND2X2M U387 ( .A(n218), .B(n204), .Y(n217) );
  CLKBUFX6M U388 ( .A(n221), .Y(n376) );
  NAND2X2M U389 ( .A(n205), .B(n218), .Y(n221) );
  CLKBUFX6M U390 ( .A(n219), .Y(n377) );
  NAND2X2M U391 ( .A(n205), .B(n220), .Y(n219) );
  INVX6M U392 ( .A(n226), .Y(n353) );
  INVX6M U393 ( .A(n223), .Y(n351) );
  INVX6M U394 ( .A(n226), .Y(n354) );
  INVX6M U395 ( .A(n223), .Y(n352) );
  CLKBUFX6M U396 ( .A(n240), .Y(n360) );
  NAND2X2M U397 ( .A(n233), .B(n353), .Y(n240) );
  CLKBUFX6M U398 ( .A(n237), .Y(n362) );
  NAND2X2M U399 ( .A(n233), .B(n351), .Y(n237) );
  CLKBUFX6M U400 ( .A(n236), .Y(n363) );
  NAND2X2M U401 ( .A(n231), .B(n351), .Y(n236) );
  CLKBUFX6M U402 ( .A(n238), .Y(n361) );
  NAND2X2M U403 ( .A(n231), .B(n353), .Y(n238) );
  CLKBUFX8M U404 ( .A(n225), .Y(n373) );
  NAND2X2M U405 ( .A(n353), .B(n220), .Y(n225) );
  CLKBUFX8M U406 ( .A(n227), .Y(n372) );
  NAND2X2M U407 ( .A(n353), .B(n218), .Y(n227) );
  AND2X2M U408 ( .A(n233), .B(n205), .Y(n329) );
  AND2X2M U409 ( .A(n233), .B(n204), .Y(n330) );
  AND2X2M U410 ( .A(n231), .B(n204), .Y(n331) );
  AND2X2M U411 ( .A(n231), .B(n205), .Y(n332) );
  BUFX2M U412 ( .A(n391), .Y(n390) );
  BUFX2M U413 ( .A(n379), .Y(n389) );
  BUFX10M U414 ( .A(n248), .Y(n349) );
  NAND2X2M U415 ( .A(Address[2]), .B(n206), .Y(n248) );
  OAI22X1M U416 ( .A0(n203), .A1(n168), .B0(n202), .B1(n184), .Y(n253) );
  OAI22X1M U417 ( .A0(n203), .A1(n24), .B0(n202), .B1(n8), .Y(n252) );
  OAI22X1M U418 ( .A0(n203), .A1(n39), .B0(n202), .B1(n183), .Y(n262) );
  OAI22X1M U419 ( .A0(n203), .A1(n23), .B0(n202), .B1(n7), .Y(n261) );
  OAI22X1M U420 ( .A0(n203), .A1(n38), .B0(n202), .B1(n182), .Y(n271) );
  OAI22X1M U421 ( .A0(n203), .A1(n22), .B0(n202), .B1(n6), .Y(n270) );
  OAI22X1M U422 ( .A0(n203), .A1(n37), .B0(n202), .B1(n181), .Y(n286) );
  OAI22X1M U423 ( .A0(n203), .A1(n21), .B0(n202), .B1(n5), .Y(n279) );
  OAI22X1M U424 ( .A0(n203), .A1(n36), .B0(n202), .B1(n180), .Y(n295) );
  OAI22X1M U425 ( .A0(n203), .A1(n20), .B0(n202), .B1(n4), .Y(n294) );
  OAI22X1M U426 ( .A0(n203), .A1(n35), .B0(n202), .B1(n179), .Y(n304) );
  OAI22X1M U427 ( .A0(n203), .A1(n19), .B0(n202), .B1(n3), .Y(n303) );
  OAI22X1M U428 ( .A0(n203), .A1(n34), .B0(n202), .B1(n178), .Y(n313) );
  OAI22X1M U429 ( .A0(n203), .A1(n18), .B0(n202), .B1(n2), .Y(n312) );
  OAI22X1M U430 ( .A0(n203), .A1(n33), .B0(n202), .B1(n177), .Y(n322) );
  OAI22X1M U431 ( .A0(n203), .A1(n17), .B0(n202), .B1(n1), .Y(n321) );
  OAI22X1M U432 ( .A0(n199), .A1(n192), .B0(n333), .B1(n376), .Y(n72) );
  OAI22X1M U433 ( .A0(n199), .A1(n191), .B0(n335), .B1(n376), .Y(n73) );
  OAI22X1M U434 ( .A0(n199), .A1(n190), .B0(n337), .B1(n376), .Y(n74) );
  OAI22X1M U435 ( .A0(n199), .A1(n189), .B0(n339), .B1(n376), .Y(n75) );
  OAI22X1M U436 ( .A0(n199), .A1(n188), .B0(n341), .B1(n376), .Y(n76) );
  OAI22X1M U437 ( .A0(n199), .A1(n187), .B0(n343), .B1(n376), .Y(n77) );
  OAI22X1M U438 ( .A0(n199), .A1(n186), .B0(n345), .B1(n376), .Y(n78) );
  OAI22X1M U439 ( .A0(n199), .A1(n185), .B0(n347), .B1(n376), .Y(n79) );
  OAI22X1M U440 ( .A0(n195), .A1(n184), .B0(n333), .B1(n360), .Y(n104) );
  OAI22X1M U441 ( .A0(n195), .A1(n183), .B0(n335), .B1(n360), .Y(n105) );
  OAI22X1M U442 ( .A0(n195), .A1(n182), .B0(n337), .B1(n360), .Y(n106) );
  OAI22X1M U443 ( .A0(n195), .A1(n181), .B0(n339), .B1(n360), .Y(n107) );
  OAI22X1M U444 ( .A0(n195), .A1(n180), .B0(n341), .B1(n360), .Y(n108) );
  OAI22X1M U445 ( .A0(n195), .A1(n179), .B0(n343), .B1(n360), .Y(n109) );
  OAI22X1M U446 ( .A0(n195), .A1(n178), .B0(n345), .B1(n360), .Y(n110) );
  OAI22X1M U447 ( .A0(n195), .A1(n177), .B0(n347), .B1(n360), .Y(n111) );
  OAI22X1M U448 ( .A0(n200), .A1(n176), .B0(n333), .B1(n378), .Y(n88) );
  OAI22X1M U449 ( .A0(n200), .A1(n175), .B0(n335), .B1(n378), .Y(n89) );
  OAI22X1M U450 ( .A0(n200), .A1(n174), .B0(n337), .B1(n378), .Y(n90) );
  OAI22X1M U451 ( .A0(n200), .A1(n173), .B0(n339), .B1(n378), .Y(n91) );
  OAI22X1M U452 ( .A0(n200), .A1(n172), .B0(n378), .B1(n342), .Y(n92) );
  OAI22X1M U453 ( .A0(n200), .A1(n171), .B0(n378), .B1(n344), .Y(n93) );
  OAI22X1M U454 ( .A0(n200), .A1(n170), .B0(n378), .B1(n346), .Y(n94) );
  OAI22X1M U455 ( .A0(n200), .A1(n169), .B0(n378), .B1(n348), .Y(n95) );
  OAI22X1M U456 ( .A0(n196), .A1(n168), .B0(n333), .B1(n362), .Y(n120) );
  OAI22X1M U457 ( .A0(n196), .A1(n39), .B0(n335), .B1(n362), .Y(n121) );
  OAI22X1M U458 ( .A0(n196), .A1(n38), .B0(n337), .B1(n362), .Y(n122) );
  OAI22X1M U459 ( .A0(n196), .A1(n37), .B0(n339), .B1(n362), .Y(n123) );
  OAI22X1M U460 ( .A0(n196), .A1(n36), .B0(n341), .B1(n362), .Y(n124) );
  OAI22X1M U461 ( .A0(n196), .A1(n35), .B0(n343), .B1(n362), .Y(n125) );
  OAI22X1M U462 ( .A0(n196), .A1(n34), .B0(n345), .B1(n362), .Y(n126) );
  OAI22X1M U463 ( .A0(n196), .A1(n33), .B0(n347), .B1(n362), .Y(n127) );
  OAI22X1M U464 ( .A0(n193), .A1(n32), .B0(n359), .B1(n334), .Y(n96) );
  OAI22X1M U465 ( .A0(n193), .A1(n31), .B0(n359), .B1(n336), .Y(n97) );
  OAI22X1M U466 ( .A0(n193), .A1(n30), .B0(n359), .B1(n338), .Y(n98) );
  OAI22X1M U467 ( .A0(n193), .A1(n29), .B0(n359), .B1(n340), .Y(n99) );
  OAI22X1M U468 ( .A0(n193), .A1(n28), .B0(n359), .B1(n342), .Y(n100) );
  OAI22X1M U469 ( .A0(n193), .A1(n27), .B0(n359), .B1(n344), .Y(n101) );
  OAI22X1M U470 ( .A0(n193), .A1(n26), .B0(n359), .B1(n346), .Y(n102) );
  OAI22X1M U471 ( .A0(n193), .A1(n25), .B0(n359), .B1(n348), .Y(n103) );
  OAI22X1M U472 ( .A0(n198), .A1(n24), .B0(n333), .B1(n363), .Y(n128) );
  OAI22X1M U473 ( .A0(n198), .A1(n23), .B0(n335), .B1(n363), .Y(n129) );
  OAI22X1M U474 ( .A0(n198), .A1(n22), .B0(n337), .B1(n363), .Y(n130) );
  OAI22X1M U475 ( .A0(n198), .A1(n21), .B0(n339), .B1(n363), .Y(n131) );
  OAI22X1M U476 ( .A0(n198), .A1(n20), .B0(n341), .B1(n363), .Y(n132) );
  OAI22X1M U477 ( .A0(n198), .A1(n19), .B0(n343), .B1(n363), .Y(n133) );
  OAI22X1M U478 ( .A0(n198), .A1(n18), .B0(n345), .B1(n363), .Y(n134) );
  OAI22X1M U479 ( .A0(n198), .A1(n17), .B0(n347), .B1(n363), .Y(n135) );
  OAI22X1M U480 ( .A0(n194), .A1(n16), .B0(n333), .B1(n377), .Y(n80) );
  OAI22X1M U481 ( .A0(n194), .A1(n15), .B0(n335), .B1(n377), .Y(n81) );
  OAI22X1M U482 ( .A0(n194), .A1(n14), .B0(n337), .B1(n377), .Y(n82) );
  OAI22X1M U483 ( .A0(n194), .A1(n13), .B0(n339), .B1(n377), .Y(n83) );
  OAI22X1M U484 ( .A0(n194), .A1(n12), .B0(n341), .B1(n377), .Y(n84) );
  OAI22X1M U485 ( .A0(n194), .A1(n11), .B0(n343), .B1(n377), .Y(n85) );
  OAI22X1M U486 ( .A0(n194), .A1(n10), .B0(n345), .B1(n377), .Y(n86) );
  OAI22X1M U487 ( .A0(n194), .A1(n9), .B0(n347), .B1(n377), .Y(n87) );
  OAI22X1M U488 ( .A0(n197), .A1(n8), .B0(n333), .B1(n361), .Y(n112) );
  OAI22X1M U489 ( .A0(n197), .A1(n7), .B0(n335), .B1(n361), .Y(n113) );
  OAI22X1M U490 ( .A0(n197), .A1(n6), .B0(n337), .B1(n361), .Y(n114) );
  OAI22X1M U491 ( .A0(n197), .A1(n5), .B0(n339), .B1(n361), .Y(n115) );
  OAI22X1M U492 ( .A0(n197), .A1(n4), .B0(n341), .B1(n361), .Y(n116) );
  OAI22X1M U493 ( .A0(n197), .A1(n3), .B0(n343), .B1(n361), .Y(n117) );
  OAI22X1M U494 ( .A0(n197), .A1(n2), .B0(n345), .B1(n361), .Y(n118) );
  OAI22X1M U495 ( .A0(n197), .A1(n1), .B0(n347), .B1(n361), .Y(n119) );
  CLKBUFX6M U496 ( .A(n239), .Y(n356) );
  NAND2X2M U497 ( .A(Address[3]), .B(Address[0]), .Y(n239) );
  CLKBUFX6M U498 ( .A(n228), .Y(n357) );
  NOR2X2M U499 ( .A(Address[0]), .B(Address[3]), .Y(n228) );
  CLKBUFX6M U500 ( .A(n242), .Y(n358) );
  NOR2X2M U501 ( .A(n207), .B(Address[3]), .Y(n242) );
  INVX2M U502 ( .A(Address[0]), .Y(n207) );
  INVX2M U503 ( .A(Address[1]), .Y(n206) );
  CLKBUFX6M U504 ( .A(n241), .Y(n355) );
  NAND2X2M U505 ( .A(Address[3]), .B(n207), .Y(n241) );
  BUFX10M U506 ( .A(n249), .Y(n350) );
  NAND2X2M U507 ( .A(Address[2]), .B(Address[1]), .Y(n249) );
  BUFX4M U508 ( .A(n215), .Y(n334) );
  BUFX4M U509 ( .A(n214), .Y(n336) );
  BUFX4M U510 ( .A(n213), .Y(n338) );
  BUFX4M U511 ( .A(n212), .Y(n340) );
  BUFX4M U512 ( .A(n211), .Y(n342) );
  BUFX4M U513 ( .A(n210), .Y(n344) );
  BUFX4M U514 ( .A(n209), .Y(n346) );
  BUFX4M U515 ( .A(n208), .Y(n348) );
  BUFX2M U516 ( .A(RST), .Y(n391) );
  OAI221X1M U517 ( .A0(n349), .A1(n16), .B0(n350), .B1(n32), .C0(n250), .Y(
        n247) );
  AOI22X1M U518 ( .A0(n285), .A1(n354), .B0(\regArr[3][0] ), .B1(n352), .Y(
        n250) );
  OAI221X1M U519 ( .A0(n349), .A1(n187), .B0(n350), .B1(n171), .C0(n302), .Y(
        n299) );
  AOI22X1M U520 ( .A0(REG0[5]), .A1(n353), .B0(REG2[5]), .B1(n351), .Y(n302)
         );
  OAI221X1M U521 ( .A0(n349), .A1(n186), .B0(n350), .B1(n170), .C0(n311), .Y(
        n308) );
  AOI22X1M U522 ( .A0(REG0[6]), .A1(n353), .B0(REG2[6]), .B1(n351), .Y(n311)
         );
  OAI221X1M U523 ( .A0(n349), .A1(n185), .B0(n350), .B1(n169), .C0(n320), .Y(
        n317) );
  AOI22X1M U524 ( .A0(REG0[7]), .A1(n353), .B0(REG2[7]), .B1(n351), .Y(n320)
         );
  OAI221X1M U525 ( .A0(n349), .A1(n15), .B0(n350), .B1(n31), .C0(n259), .Y(
        n258) );
  AOI22X1M U526 ( .A0(n284), .A1(n354), .B0(\regArr[3][1] ), .B1(n352), .Y(
        n259) );
  OAI221X1M U527 ( .A0(n349), .A1(n14), .B0(n350), .B1(n30), .C0(n268), .Y(
        n267) );
  AOI22X1M U528 ( .A0(n283), .A1(n354), .B0(\regArr[3][2] ), .B1(n352), .Y(
        n268) );
  OAI221X1M U529 ( .A0(n349), .A1(n13), .B0(n350), .B1(n29), .C0(n277), .Y(
        n276) );
  AOI22X1M U530 ( .A0(REG1[3]), .A1(n354), .B0(\regArr[3][3] ), .B1(n352), .Y(
        n277) );
  OAI221X1M U531 ( .A0(n349), .A1(n12), .B0(n350), .B1(n28), .C0(n292), .Y(
        n291) );
  AOI22X1M U532 ( .A0(REG1[4]), .A1(n354), .B0(\regArr[3][4] ), .B1(n352), .Y(
        n292) );
  OAI221X1M U533 ( .A0(n349), .A1(n11), .B0(n350), .B1(n27), .C0(n301), .Y(
        n300) );
  AOI22X1M U534 ( .A0(REG1[5]), .A1(n354), .B0(\regArr[3][5] ), .B1(n352), .Y(
        n301) );
  OAI221X1M U535 ( .A0(n349), .A1(n10), .B0(n350), .B1(n26), .C0(n310), .Y(
        n309) );
  AOI22X1M U536 ( .A0(REG1[6]), .A1(n353), .B0(\regArr[3][6] ), .B1(n351), .Y(
        n310) );
  OAI221X1M U537 ( .A0(n349), .A1(n9), .B0(n350), .B1(n25), .C0(n319), .Y(n318) );
  AOI22X1M U538 ( .A0(REG1[7]), .A1(n353), .B0(\regArr[3][7] ), .B1(n351), .Y(
        n319) );
  OAI221X1M U539 ( .A0(n243), .A1(n355), .B0(n244), .B1(n356), .C0(n245), .Y(
        N43) );
  AOI22X1M U540 ( .A0(n357), .A1(n246), .B0(n358), .B1(n247), .Y(n245) );
  AOI221X2M U541 ( .A0(\regArr[13][0] ), .A1(n205), .B0(\regArr[15][0] ), .B1(
        n204), .C0(n252), .Y(n244) );
  AOI221X2M U542 ( .A0(\regArr[12][0] ), .A1(n205), .B0(\regArr[14][0] ), .B1(
        n204), .C0(n253), .Y(n243) );
  OAI221X1M U543 ( .A0(n254), .A1(n355), .B0(n255), .B1(n356), .C0(n256), .Y(
        N42) );
  AOI22X1M U544 ( .A0(n357), .A1(n257), .B0(n358), .B1(n258), .Y(n256) );
  AOI221X2M U545 ( .A0(\regArr[13][1] ), .A1(n205), .B0(\regArr[15][1] ), .B1(
        n204), .C0(n261), .Y(n255) );
  AOI221X2M U546 ( .A0(\regArr[12][1] ), .A1(n205), .B0(\regArr[14][1] ), .B1(
        n204), .C0(n262), .Y(n254) );
  OAI221X1M U547 ( .A0(n263), .A1(n355), .B0(n264), .B1(n356), .C0(n265), .Y(
        N41) );
  AOI22X1M U548 ( .A0(n357), .A1(n266), .B0(n358), .B1(n267), .Y(n265) );
  AOI221X2M U549 ( .A0(\regArr[13][2] ), .A1(n205), .B0(\regArr[15][2] ), .B1(
        n204), .C0(n270), .Y(n264) );
  AOI221X2M U550 ( .A0(\regArr[12][2] ), .A1(n205), .B0(\regArr[14][2] ), .B1(
        n204), .C0(n271), .Y(n263) );
  OAI221X1M U551 ( .A0(n272), .A1(n355), .B0(n273), .B1(n356), .C0(n274), .Y(
        N40) );
  AOI22X1M U552 ( .A0(n357), .A1(n275), .B0(n358), .B1(n276), .Y(n274) );
  AOI221X2M U553 ( .A0(\regArr[13][3] ), .A1(n205), .B0(\regArr[15][3] ), .B1(
        n204), .C0(n279), .Y(n273) );
  AOI221X2M U554 ( .A0(\regArr[12][3] ), .A1(n205), .B0(\regArr[14][3] ), .B1(
        n204), .C0(n286), .Y(n272) );
  OAI221X1M U555 ( .A0(n287), .A1(n355), .B0(n288), .B1(n356), .C0(n289), .Y(
        N39) );
  AOI22X1M U556 ( .A0(n357), .A1(n290), .B0(n358), .B1(n291), .Y(n289) );
  AOI221X2M U557 ( .A0(\regArr[13][4] ), .A1(n205), .B0(\regArr[15][4] ), .B1(
        n204), .C0(n294), .Y(n288) );
  AOI221X2M U558 ( .A0(\regArr[12][4] ), .A1(n205), .B0(\regArr[14][4] ), .B1(
        n204), .C0(n295), .Y(n287) );
  OAI221X1M U559 ( .A0(n296), .A1(n355), .B0(n297), .B1(n356), .C0(n298), .Y(
        N38) );
  AOI22X1M U560 ( .A0(n357), .A1(n299), .B0(n358), .B1(n300), .Y(n298) );
  AOI221X2M U561 ( .A0(\regArr[13][5] ), .A1(n205), .B0(\regArr[15][5] ), .B1(
        n204), .C0(n303), .Y(n297) );
  AOI221X2M U562 ( .A0(\regArr[12][5] ), .A1(n205), .B0(\regArr[14][5] ), .B1(
        n204), .C0(n304), .Y(n296) );
  OAI221X1M U563 ( .A0(n305), .A1(n355), .B0(n306), .B1(n356), .C0(n307), .Y(
        N37) );
  AOI22X1M U564 ( .A0(n357), .A1(n308), .B0(n358), .B1(n309), .Y(n307) );
  AOI221X2M U565 ( .A0(\regArr[13][6] ), .A1(n205), .B0(\regArr[15][6] ), .B1(
        n204), .C0(n312), .Y(n306) );
  AOI221X2M U566 ( .A0(\regArr[12][6] ), .A1(n205), .B0(\regArr[14][6] ), .B1(
        n204), .C0(n313), .Y(n305) );
  OAI221X1M U567 ( .A0(n314), .A1(n355), .B0(n315), .B1(n356), .C0(n316), .Y(
        N36) );
  AOI22X1M U568 ( .A0(n357), .A1(n317), .B0(n358), .B1(n318), .Y(n316) );
  AOI221X2M U569 ( .A0(\regArr[13][7] ), .A1(n205), .B0(\regArr[15][7] ), .B1(
        n204), .C0(n321), .Y(n315) );
  AOI221X2M U570 ( .A0(\regArr[12][7] ), .A1(n205), .B0(\regArr[14][7] ), .B1(
        n204), .C0(n322), .Y(n314) );
  OAI221X1M U571 ( .A0(n349), .A1(n192), .B0(n350), .B1(n176), .C0(n251), .Y(
        n246) );
  AOI22X1M U572 ( .A0(REG0[0]), .A1(n354), .B0(REG2[0]), .B1(n352), .Y(n251)
         );
  OAI221X1M U573 ( .A0(n349), .A1(n191), .B0(n350), .B1(n175), .C0(n260), .Y(
        n257) );
  AOI22X1M U574 ( .A0(REG0[1]), .A1(n354), .B0(REG2[1]), .B1(n352), .Y(n260)
         );
  OAI221X1M U575 ( .A0(n349), .A1(n190), .B0(n350), .B1(n174), .C0(n269), .Y(
        n266) );
  AOI22X1M U576 ( .A0(REG0[2]), .A1(n354), .B0(REG2[2]), .B1(n352), .Y(n269)
         );
  OAI221X1M U577 ( .A0(n349), .A1(n189), .B0(n350), .B1(n173), .C0(n278), .Y(
        n275) );
  AOI22X1M U578 ( .A0(REG0[3]), .A1(n354), .B0(REG2[3]), .B1(n352), .Y(n278)
         );
  OAI221X1M U579 ( .A0(n349), .A1(n188), .B0(n350), .B1(n172), .C0(n293), .Y(
        n290) );
  AOI22X1M U580 ( .A0(REG0[4]), .A1(n354), .B0(REG2[4]), .B1(n352), .Y(n293)
         );
  OAI2BB2X1M U581 ( .B0(n338), .B1(n373), .A0N(n373), .A1N(n283), .Y(n50) );
  OAI2BB2X1M U582 ( .B0(n342), .B1(n373), .A0N(n373), .A1N(REG1[4]), .Y(n52)
         );
  OAI2BB2X1M U583 ( .B0(n344), .B1(n373), .A0N(n373), .A1N(REG1[5]), .Y(n53)
         );
  OAI2BB2X1M U584 ( .B0(n336), .B1(n373), .A0N(n373), .A1N(n284), .Y(n49) );
  OAI2BB2X1M U585 ( .B0(n334), .B1(n373), .A0N(n373), .A1N(n285), .Y(n48) );
  OAI2BB2X1M U586 ( .B0(n348), .B1(n373), .A0N(n373), .A1N(REG1[7]), .Y(n55)
         );
  OAI2BB2X1M U587 ( .B0(n346), .B1(n373), .A0N(n373), .A1N(REG1[6]), .Y(n54)
         );
  OAI2BB2X1M U588 ( .B0(n348), .B1(n372), .A0N(n372), .A1N(REG0[7]), .Y(n47)
         );
  OAI2BB2X1M U589 ( .B0(n346), .B1(n372), .A0N(n372), .A1N(REG0[6]), .Y(n46)
         );
  OAI2BB2X1M U590 ( .B0(n344), .B1(n372), .A0N(n372), .A1N(REG0[5]), .Y(n45)
         );
  OAI2BB2X1M U591 ( .B0(n342), .B1(n372), .A0N(n372), .A1N(REG0[4]), .Y(n44)
         );
  OAI2BB2X1M U592 ( .B0(n340), .B1(n372), .A0N(n372), .A1N(REG0[3]), .Y(n43)
         );
  OAI2BB2X1M U593 ( .B0(n338), .B1(n372), .A0N(n372), .A1N(REG0[2]), .Y(n42)
         );
  OAI2BB2X1M U594 ( .B0(n334), .B1(n372), .A0N(n372), .A1N(REG0[0]), .Y(n40)
         );
  OAI2BB2X1M U595 ( .B0(n334), .B1(n374), .A0N(n374), .A1N(REG2[0]), .Y(n56)
         );
  OAI2BB2X1M U596 ( .B0(n336), .B1(n374), .A0N(n374), .A1N(REG2[1]), .Y(n57)
         );
  OAI2BB2X1M U597 ( .B0(n340), .B1(n374), .A0N(n374), .A1N(REG2[3]), .Y(n59)
         );
  OAI2BB2X1M U598 ( .B0(n342), .B1(n374), .A0N(n374), .A1N(REG2[4]), .Y(n60)
         );
  OAI2BB2X1M U599 ( .B0(n344), .B1(n374), .A0N(n374), .A1N(REG2[5]), .Y(n61)
         );
  OAI2BB2X1M U600 ( .B0(n346), .B1(n374), .A0N(n374), .A1N(REG2[6]), .Y(n62)
         );
  OAI2BB2X1M U601 ( .B0(n348), .B1(n374), .A0N(n374), .A1N(REG2[7]), .Y(n63)
         );
  OAI2BB2X1M U602 ( .B0(n334), .B1(n375), .A0N(n375), .A1N(\regArr[3][0] ), 
        .Y(n64) );
  OAI2BB2X1M U603 ( .B0(n336), .B1(n375), .A0N(n375), .A1N(\regArr[3][1] ), 
        .Y(n65) );
  OAI2BB2X1M U604 ( .B0(n338), .B1(n375), .A0N(n375), .A1N(\regArr[3][2] ), 
        .Y(n66) );
  OAI2BB2X1M U605 ( .B0(n340), .B1(n375), .A0N(n375), .A1N(\regArr[3][3] ), 
        .Y(n67) );
  OAI2BB2X1M U606 ( .B0(n342), .B1(n375), .A0N(n375), .A1N(\regArr[3][4] ), 
        .Y(n68) );
  OAI2BB2X1M U607 ( .B0(n344), .B1(n375), .A0N(n375), .A1N(\regArr[3][5] ), 
        .Y(n69) );
  OAI2BB2X1M U608 ( .B0(n346), .B1(n375), .A0N(n375), .A1N(\regArr[3][6] ), 
        .Y(n70) );
  OAI2BB2X1M U609 ( .B0(n348), .B1(n375), .A0N(n375), .A1N(\regArr[3][7] ), 
        .Y(n71) );
  OAI2BB2X1M U610 ( .B0(n333), .B1(n364), .A0N(n364), .A1N(\regArr[12][0] ), 
        .Y(n136) );
  OAI2BB2X1M U611 ( .B0(n335), .B1(n365), .A0N(n365), .A1N(\regArr[12][1] ), 
        .Y(n137) );
  OAI2BB2X1M U612 ( .B0(n337), .B1(n364), .A0N(n364), .A1N(\regArr[12][2] ), 
        .Y(n138) );
  OAI2BB2X1M U613 ( .B0(n339), .B1(n365), .A0N(n365), .A1N(\regArr[12][3] ), 
        .Y(n139) );
  OAI2BB2X1M U614 ( .B0(n341), .B1(n364), .A0N(n364), .A1N(\regArr[12][4] ), 
        .Y(n140) );
  OAI2BB2X1M U615 ( .B0(n343), .B1(n365), .A0N(n365), .A1N(\regArr[12][5] ), 
        .Y(n141) );
  OAI2BB2X1M U616 ( .B0(n345), .B1(n364), .A0N(n364), .A1N(\regArr[12][6] ), 
        .Y(n142) );
  OAI2BB2X1M U617 ( .B0(n347), .B1(n365), .A0N(n365), .A1N(\regArr[12][7] ), 
        .Y(n143) );
  OAI2BB2X1M U618 ( .B0(n334), .B1(n368), .A0N(n368), .A1N(\regArr[14][0] ), 
        .Y(n152) );
  OAI2BB2X1M U619 ( .B0(n336), .B1(n369), .A0N(n369), .A1N(\regArr[14][1] ), 
        .Y(n153) );
  OAI2BB2X1M U620 ( .B0(n338), .B1(n368), .A0N(n368), .A1N(\regArr[14][2] ), 
        .Y(n154) );
  OAI2BB2X1M U621 ( .B0(n340), .B1(n369), .A0N(n369), .A1N(\regArr[14][3] ), 
        .Y(n155) );
  OAI2BB2X1M U622 ( .B0(n342), .B1(n368), .A0N(n368), .A1N(\regArr[14][4] ), 
        .Y(n156) );
  OAI2BB2X1M U623 ( .B0(n344), .B1(n369), .A0N(n369), .A1N(\regArr[14][5] ), 
        .Y(n157) );
  OAI2BB2X1M U624 ( .B0(n346), .B1(n368), .A0N(n368), .A1N(\regArr[14][6] ), 
        .Y(n158) );
  OAI2BB2X1M U625 ( .B0(n348), .B1(n369), .A0N(n369), .A1N(\regArr[14][7] ), 
        .Y(n159) );
  OAI2BB2X1M U626 ( .B0(n334), .B1(n370), .A0N(n370), .A1N(\regArr[15][0] ), 
        .Y(n160) );
  OAI2BB2X1M U627 ( .B0(n336), .B1(n371), .A0N(n371), .A1N(\regArr[15][1] ), 
        .Y(n161) );
  OAI2BB2X1M U628 ( .B0(n338), .B1(n370), .A0N(n370), .A1N(\regArr[15][2] ), 
        .Y(n162) );
  OAI2BB2X1M U629 ( .B0(n340), .B1(n371), .A0N(n371), .A1N(\regArr[15][3] ), 
        .Y(n163) );
  OAI2BB2X1M U630 ( .B0(n342), .B1(n370), .A0N(n370), .A1N(\regArr[15][4] ), 
        .Y(n164) );
  OAI2BB2X1M U631 ( .B0(n344), .B1(n371), .A0N(n371), .A1N(\regArr[15][5] ), 
        .Y(n165) );
  OAI2BB2X1M U632 ( .B0(n346), .B1(n370), .A0N(n370), .A1N(\regArr[15][6] ), 
        .Y(n166) );
  OAI2BB2X1M U633 ( .B0(n348), .B1(n371), .A0N(n371), .A1N(\regArr[15][7] ), 
        .Y(n167) );
  OAI2BB2X1M U634 ( .B0(n334), .B1(n366), .A0N(n366), .A1N(\regArr[13][0] ), 
        .Y(n144) );
  OAI2BB2X1M U635 ( .B0(n336), .B1(n367), .A0N(n367), .A1N(\regArr[13][1] ), 
        .Y(n145) );
  OAI2BB2X1M U636 ( .B0(n338), .B1(n366), .A0N(n366), .A1N(\regArr[13][2] ), 
        .Y(n146) );
  OAI2BB2X1M U637 ( .B0(n340), .B1(n367), .A0N(n367), .A1N(\regArr[13][3] ), 
        .Y(n147) );
  OAI2BB2X1M U638 ( .B0(n341), .B1(n366), .A0N(n366), .A1N(\regArr[13][4] ), 
        .Y(n148) );
  OAI2BB2X1M U639 ( .B0(n343), .B1(n367), .A0N(n367), .A1N(\regArr[13][5] ), 
        .Y(n149) );
  OAI2BB2X1M U640 ( .B0(n345), .B1(n366), .A0N(n366), .A1N(\regArr[13][6] ), 
        .Y(n150) );
  OAI2BB2X1M U641 ( .B0(n347), .B1(n367), .A0N(n367), .A1N(\regArr[13][7] ), 
        .Y(n151) );
  OAI2BB2X1M U642 ( .B0(n340), .B1(n373), .A0N(n373), .A1N(REG1[3]), .Y(n51)
         );
  OAI2BB2X1M U643 ( .B0(n336), .B1(n372), .A0N(n372), .A1N(REG0[1]), .Y(n41)
         );
  OAI2BB2X1M U644 ( .B0(n338), .B1(n374), .A0N(n374), .A1N(REG2[2]), .Y(n58)
         );
  INVX2M U645 ( .A(WrEn), .Y(n201) );
  AND3X4M U646 ( .A(n201), .B(n379), .C(RdEn), .Y(n323) );
  INVX2M U647 ( .A(WrData[0]), .Y(n215) );
  INVX2M U648 ( .A(WrData[1]), .Y(n214) );
  INVX2M U649 ( .A(WrData[2]), .Y(n213) );
  INVX2M U650 ( .A(WrData[3]), .Y(n212) );
  INVX2M U651 ( .A(WrData[4]), .Y(n211) );
  INVX2M U652 ( .A(WrData[5]), .Y(n210) );
  INVX2M U653 ( .A(WrData[6]), .Y(n209) );
  INVX2M U654 ( .A(WrData[7]), .Y(n208) );
  INVX2M U655 ( .A(\regArr[8][0] ), .Y(n184) );
  INVX2M U656 ( .A(\regArr[9][0] ), .Y(n8) );
  INVX2M U657 ( .A(\regArr[8][1] ), .Y(n183) );
  INVX2M U658 ( .A(\regArr[9][1] ), .Y(n7) );
  INVX2M U659 ( .A(\regArr[8][2] ), .Y(n182) );
  INVX2M U660 ( .A(\regArr[9][2] ), .Y(n6) );
  INVX2M U661 ( .A(\regArr[8][3] ), .Y(n181) );
  INVX2M U662 ( .A(\regArr[9][3] ), .Y(n5) );
  INVX2M U663 ( .A(\regArr[8][4] ), .Y(n180) );
  INVX2M U664 ( .A(\regArr[9][4] ), .Y(n4) );
  INVX2M U665 ( .A(\regArr[8][5] ), .Y(n179) );
  INVX2M U666 ( .A(\regArr[9][5] ), .Y(n3) );
  INVX2M U667 ( .A(\regArr[8][6] ), .Y(n178) );
  INVX2M U668 ( .A(\regArr[9][6] ), .Y(n2) );
  INVX2M U669 ( .A(\regArr[8][7] ), .Y(n177) );
  INVX2M U670 ( .A(\regArr[9][7] ), .Y(n1) );
  INVX2M U671 ( .A(\regArr[10][0] ), .Y(n168) );
  INVX2M U672 ( .A(\regArr[11][0] ), .Y(n24) );
  INVX2M U673 ( .A(\regArr[10][1] ), .Y(n39) );
  INVX2M U674 ( .A(\regArr[11][1] ), .Y(n23) );
  INVX2M U675 ( .A(\regArr[10][2] ), .Y(n38) );
  INVX2M U676 ( .A(\regArr[11][2] ), .Y(n22) );
  INVX2M U677 ( .A(\regArr[10][3] ), .Y(n37) );
  INVX2M U678 ( .A(\regArr[11][3] ), .Y(n21) );
  INVX2M U679 ( .A(\regArr[10][4] ), .Y(n36) );
  INVX2M U680 ( .A(\regArr[11][4] ), .Y(n20) );
  INVX2M U681 ( .A(\regArr[10][5] ), .Y(n35) );
  INVX2M U682 ( .A(\regArr[11][5] ), .Y(n19) );
  INVX2M U683 ( .A(\regArr[10][6] ), .Y(n34) );
  INVX2M U684 ( .A(\regArr[11][6] ), .Y(n18) );
  INVX2M U685 ( .A(\regArr[10][7] ), .Y(n33) );
  INVX2M U686 ( .A(\regArr[11][7] ), .Y(n17) );
  INVX2M U687 ( .A(\regArr[7][0] ), .Y(n32) );
  INVX2M U688 ( .A(\regArr[6][0] ), .Y(n176) );
  INVX2M U689 ( .A(\regArr[7][1] ), .Y(n31) );
  INVX2M U690 ( .A(\regArr[6][1] ), .Y(n175) );
  INVX2M U691 ( .A(\regArr[7][2] ), .Y(n30) );
  INVX2M U692 ( .A(\regArr[6][2] ), .Y(n174) );
  INVX2M U693 ( .A(\regArr[7][3] ), .Y(n29) );
  INVX2M U694 ( .A(\regArr[6][3] ), .Y(n173) );
  INVX2M U695 ( .A(\regArr[7][4] ), .Y(n28) );
  INVX2M U696 ( .A(\regArr[6][4] ), .Y(n172) );
  INVX2M U697 ( .A(\regArr[7][5] ), .Y(n27) );
  INVX2M U698 ( .A(\regArr[6][5] ), .Y(n171) );
  INVX2M U699 ( .A(\regArr[7][6] ), .Y(n26) );
  INVX2M U700 ( .A(\regArr[6][6] ), .Y(n170) );
  INVX2M U701 ( .A(\regArr[7][7] ), .Y(n25) );
  INVX2M U702 ( .A(\regArr[6][7] ), .Y(n169) );
  INVX2M U703 ( .A(\regArr[5][0] ), .Y(n16) );
  INVX2M U704 ( .A(\regArr[4][0] ), .Y(n192) );
  INVX2M U705 ( .A(\regArr[5][1] ), .Y(n15) );
  INVX2M U706 ( .A(\regArr[4][1] ), .Y(n191) );
  INVX2M U707 ( .A(\regArr[5][2] ), .Y(n14) );
  INVX2M U708 ( .A(\regArr[4][2] ), .Y(n190) );
  INVX2M U709 ( .A(\regArr[5][3] ), .Y(n13) );
  INVX2M U710 ( .A(\regArr[4][3] ), .Y(n189) );
  INVX2M U711 ( .A(\regArr[5][4] ), .Y(n12) );
  INVX2M U712 ( .A(\regArr[4][4] ), .Y(n188) );
  INVX2M U713 ( .A(\regArr[5][5] ), .Y(n11) );
  INVX2M U714 ( .A(\regArr[4][5] ), .Y(n187) );
  INVX2M U715 ( .A(\regArr[5][6] ), .Y(n10) );
  INVX2M U716 ( .A(\regArr[4][6] ), .Y(n186) );
  INVX2M U717 ( .A(\regArr[5][7] ), .Y(n9) );
  INVX2M U718 ( .A(\regArr[4][7] ), .Y(n185) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n149, n1, n2, n3, n6, n10, n11, n12, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n4, n5, n7, n9, n13,
         n14, n15, n121, n147, n148;

  OAI2B2X8M U63 ( .A1N(n87), .A0(n86), .B0(n88), .B1(n12), .Y(quotient[2]) );
  AOI22X4M U115 ( .A0(a[5]), .A1(n136), .B0(quotient[5]), .B1(n134), .Y(n119)
         );
  AOI22X4M U118 ( .A0(n138), .A1(n139), .B0(n140), .B1(n137), .Y(n132) );
  OAI22X4M U150 ( .A0(n119), .A1(n124), .B0(n9), .B1(n135), .Y(n116) );
  XNOR2X4M U151 ( .A(n130), .B(n131), .Y(n114) );
  BUFX2M U152 ( .A(n103), .Y(n4) );
  AOI22X1M U153 ( .A0(n108), .A1(n109), .B0(n110), .B1(n107), .Y(n103) );
  CLKINVX2M U154 ( .A(n4), .Y(quotient[3]) );
  NOR2BX4M U155 ( .AN(n141), .B(n15), .Y(n139) );
  INVX2M U156 ( .A(n122), .Y(quotient[4]) );
  NOR2X2M U157 ( .A(n144), .B(quotient[6]), .Y(n137) );
  NOR2BX2M U158 ( .AN(n109), .B(n147), .Y(n141) );
  INVX2M U159 ( .A(n111), .Y(n12) );
  NOR2X4M U160 ( .A(n7), .B(a[5]), .Y(n134) );
  NOR2X2M U161 ( .A(n7), .B(a[1]), .Y(n60) );
  NOR2X4M U162 ( .A(n12), .B(b[4]), .Y(n109) );
  CLKBUFX6M U163 ( .A(n16), .Y(n7) );
  NAND2BX2M U164 ( .AN(a[3]), .B(b[0]), .Y(n104) );
  NAND2BX2M U165 ( .AN(a[2]), .B(b[0]), .Y(n83) );
  INVX4M U166 ( .A(n13), .Y(n9) );
  INVX4M U167 ( .A(n121), .Y(n15) );
  OAI2B2X4M U168 ( .A1N(n73), .A0(n71), .B0(n147), .B1(n94), .Y(n68) );
  NOR2BX2M U169 ( .AN(n71), .B(n73), .Y(n94) );
  INVX2M U170 ( .A(n132), .Y(quotient[5]) );
  XNOR2X4M U171 ( .A(n90), .B(n91), .Y(n66) );
  NAND2X2M U172 ( .A(n92), .B(quotient[3]), .Y(n90) );
  XNOR2X2M U173 ( .A(n147), .B(n93), .Y(n92) );
  INVX4M U174 ( .A(n148), .Y(n147) );
  BUFX2M U175 ( .A(n14), .Y(n13) );
  INVX2M U176 ( .A(b[2]), .Y(n121) );
  NAND2X2M U177 ( .A(n137), .B(n132), .Y(n125) );
  NOR2X2M U178 ( .A(n125), .B(quotient[4]), .Y(n107) );
  OAI2B2X4M U179 ( .A1N(n42), .A0(n40), .B0(n147), .B1(n74), .Y(n35) );
  NOR2BX2M U180 ( .AN(n40), .B(n42), .Y(n74) );
  OAI22X4M U181 ( .A0(n6), .A1(n96), .B0(n15), .B1(n117), .Y(n93) );
  AND2X2M U182 ( .A(n96), .B(n6), .Y(n117) );
  INVX2M U183 ( .A(n98), .Y(n6) );
  XNOR2X4M U184 ( .A(n95), .B(n96), .Y(n71) );
  NAND2X2M U185 ( .A(n97), .B(quotient[3]), .Y(n95) );
  XNOR2X2M U186 ( .A(n15), .B(n98), .Y(n97) );
  OAI21X4M U187 ( .A0(n3), .A1(n76), .B0(n99), .Y(n73) );
  OAI2BB1X2M U188 ( .A0N(n76), .A1N(n3), .B0(n121), .Y(n99) );
  INVX2M U189 ( .A(n78), .Y(n3) );
  OAI21X4M U190 ( .A0(n1), .A1(n47), .B0(n79), .Y(n42) );
  OAI2BB1X2M U191 ( .A0N(n47), .A1N(n1), .B0(n121), .Y(n79) );
  INVX2M U192 ( .A(n49), .Y(n1) );
  XNOR2X4M U193 ( .A(n113), .B(n114), .Y(n91) );
  NAND2X2M U194 ( .A(quotient[4]), .B(n115), .Y(n113) );
  XNOR2X2M U195 ( .A(n15), .B(n116), .Y(n115) );
  AO21XLM U196 ( .A0(n141), .A1(n138), .B0(n139), .Y(n140) );
  OAI21X4M U197 ( .A0(n134), .A1(n130), .B0(n142), .Y(n138) );
  OAI2BB1X2M U198 ( .A0N(n130), .A1N(n134), .B0(n13), .Y(n142) );
  OAI2BB1X2M U199 ( .A0N(n54), .A1N(n11), .B0(n84), .Y(n49) );
  OAI21X2M U200 ( .A0(n11), .A1(n54), .B0(n14), .Y(n84) );
  NOR2X2M U201 ( .A(n114), .B(n116), .Y(n129) );
  OA21X2M U202 ( .A0(n43), .A1(n44), .B0(n45), .Y(n36) );
  OAI2BB1X2M U203 ( .A0N(n44), .A1N(n43), .B0(n148), .Y(n45) );
  XNOR2X4M U204 ( .A(n46), .B(n47), .Y(n44) );
  OA22X2M U205 ( .A0(n50), .A1(n51), .B0(n15), .B1(n52), .Y(n43) );
  AND2X2M U206 ( .A(n51), .B(n50), .Y(n52) );
  AND2X2M U207 ( .A(n37), .B(n36), .Y(n38) );
  NOR2X1M U208 ( .A(n132), .B(n133), .Y(n131) );
  XNOR2X2M U209 ( .A(n134), .B(n9), .Y(n133) );
  INVX2M U210 ( .A(n143), .Y(quotient[6]) );
  INVX2M U211 ( .A(b[1]), .Y(n14) );
  NAND2X1M U212 ( .A(n107), .B(n4), .Y(n86) );
  INVX2M U213 ( .A(n124), .Y(n10) );
  INVX2M U214 ( .A(n60), .Y(n11) );
  INVX2M U215 ( .A(n17), .Y(quotient[7]) );
  AO21XLM U216 ( .A0(n111), .A1(n108), .B0(n109), .Y(n110) );
  OAI2BB1X2M U217 ( .A0N(n93), .A1N(n91), .B0(n112), .Y(n108) );
  OAI21X2M U218 ( .A0(n91), .A1(n93), .B0(n148), .Y(n112) );
  AND2X2M U219 ( .A(n119), .B(n124), .Y(n135) );
  CLKXOR2X2M U220 ( .A(n100), .B(n101), .Y(n76) );
  NAND2X2M U221 ( .A(n102), .B(quotient[3]), .Y(n100) );
  XNOR2X2M U222 ( .A(n9), .B(n104), .Y(n102) );
  XNOR2X4M U223 ( .A(n118), .B(n119), .Y(n96) );
  NAND2X2M U224 ( .A(quotient[4]), .B(n120), .Y(n118) );
  XNOR2X2M U225 ( .A(n9), .B(n10), .Y(n120) );
  OAI21X4M U226 ( .A0(n10), .A1(n122), .B0(n123), .Y(n101) );
  OAI21X2M U227 ( .A0(n7), .A1(n122), .B0(a[4]), .Y(n123) );
  OAI21X4M U228 ( .A0(n4), .A1(n104), .B0(n106), .Y(n81) );
  OAI21X1M U229 ( .A0(n4), .A1(n7), .B0(a[3]), .Y(n106) );
  OAI21X4M U230 ( .A0(n2), .A1(n83), .B0(n85), .Y(n54) );
  OAI21X2M U231 ( .A0(n2), .A1(n7), .B0(a[2]), .Y(n85) );
  CLKINVX1M U232 ( .A(quotient[2]), .Y(n2) );
  OAI21X4M U233 ( .A0(n7), .A1(n143), .B0(a[6]), .Y(n130) );
  OAI211X4M U234 ( .A0(a[7]), .A1(n7), .B0(n13), .C0(n139), .Y(n17) );
  AO2B2X2M U235 ( .B0(n101), .B1(n104), .A0(n5), .A1N(n9), .Y(n98) );
  OR2X2M U236 ( .A(n104), .B(n101), .Y(n5) );
  OAI2BB1X2M U237 ( .A0N(n81), .A1N(n83), .B0(n105), .Y(n78) );
  OAI21X2M U238 ( .A0(n83), .A1(n81), .B0(n14), .Y(n105) );
  NAND2X2M U239 ( .A(n109), .B(n126), .Y(n122) );
  OAI21X2M U240 ( .A0(n127), .A1(n125), .B0(n128), .Y(n126) );
  OAI2BB1X2M U241 ( .A0N(n125), .A1N(n127), .B0(n148), .Y(n128) );
  AOI2BB2X2M U242 ( .B0(n116), .B1(n114), .A0N(n15), .A1N(n129), .Y(n127) );
  NAND2X2M U243 ( .A(n139), .B(n145), .Y(n143) );
  OAI22X1M U244 ( .A0(n146), .A1(n144), .B0(n9), .B1(n146), .Y(n145) );
  NOR2X2M U245 ( .A(n7), .B(a[6]), .Y(n146) );
  NAND2X2M U246 ( .A(a[7]), .B(n17), .Y(n144) );
  NOR2X2M U247 ( .A(n23), .B(n22), .Y(n24) );
  OA21X2M U248 ( .A0(n56), .A1(n57), .B0(n58), .Y(n50) );
  OAI2BB1X2M U249 ( .A0N(n57), .A1N(n56), .B0(n14), .Y(n58) );
  AOI22X2M U250 ( .A0(a[1]), .A1(n59), .B0(n60), .B1(quotient[1]), .Y(n56) );
  CLKXOR2X2M U251 ( .A(n80), .B(n81), .Y(n47) );
  NAND2XLM U252 ( .A(n82), .B(quotient[2]), .Y(n80) );
  XNOR2X2M U253 ( .A(n9), .B(n83), .Y(n82) );
  XNOR2X4M U254 ( .A(n75), .B(n76), .Y(n40) );
  NAND2XLM U255 ( .A(n77), .B(quotient[2]), .Y(n75) );
  XNOR2X2M U256 ( .A(n15), .B(n78), .Y(n77) );
  CLKXOR2X2M U257 ( .A(n53), .B(n54), .Y(n51) );
  NAND2X2M U258 ( .A(quotient[1]), .B(n55), .Y(n53) );
  XNOR2X2M U259 ( .A(n9), .B(n11), .Y(n55) );
  NAND2X2M U260 ( .A(quotient[1]), .B(n48), .Y(n46) );
  XNOR2X2M U261 ( .A(n15), .B(n49), .Y(n48) );
  INVX2M U262 ( .A(b[3]), .Y(n148) );
  XNOR2X4M U263 ( .A(n70), .B(n71), .Y(n33) );
  NAND2XLM U264 ( .A(n72), .B(quotient[2]), .Y(n70) );
  XNOR2X2M U265 ( .A(n147), .B(n73), .Y(n72) );
  XNOR2X4M U266 ( .A(n39), .B(n40), .Y(n37) );
  NAND2X2M U267 ( .A(quotient[1]), .B(n41), .Y(n39) );
  XNOR2X2M U268 ( .A(n147), .B(n42), .Y(n41) );
  NOR2X3M U269 ( .A(n86), .B(quotient[2]), .Y(n21) );
  NOR2X4M U270 ( .A(n7), .B(a[4]), .Y(n124) );
  NOR2X2M U271 ( .A(a[0]), .B(n7), .Y(n57) );
  OAI31X2M U272 ( .A0(b[6]), .A1(b[7]), .A2(n88), .B0(n12), .Y(n87) );
  AOI2BB2X4M U273 ( .B0(n68), .B1(n66), .A0N(b[4]), .A1N(n89), .Y(n88) );
  NOR2X2M U274 ( .A(n66), .B(n68), .Y(n89) );
  NAND2XLM U275 ( .A(quotient[5]), .B(b[0]), .Y(n136) );
  OAI2B2X4M U276 ( .A1N(n35), .A0(n33), .B0(b[4]), .B1(n69), .Y(n28) );
  NOR2BX2M U277 ( .AN(n33), .B(n35), .Y(n69) );
  OAI22X4M U278 ( .A0(n29), .A1(n30), .B0(b[5]), .B1(n31), .Y(n22) );
  AND2X2M U279 ( .A(n30), .B(n29), .Y(n31) );
  OA22X1M U280 ( .A0(n36), .A1(n37), .B0(b[4]), .B1(n38), .Y(n29) );
  XNOR2X4M U281 ( .A(n32), .B(n33), .Y(n30) );
  NOR3X4M U282 ( .A(b[6]), .B(b[7]), .C(b[5]), .Y(n111) );
  OAI2BB1X2M U283 ( .A0N(n28), .A1N(n26), .B0(n64), .Y(n63) );
  OAI21BX1M U284 ( .A0(n26), .A1(n28), .B0N(b[5]), .Y(n64) );
  NAND2XLM U285 ( .A(b[0]), .B(quotient[1]), .Y(n59) );
  CLKBUFX6M U286 ( .A(n149), .Y(quotient[1]) );
  NOR2BX2M U287 ( .AN(n61), .B(b[7]), .Y(n149) );
  OAI2BB2X1M U288 ( .B0(b[6]), .B1(n62), .A0N(n63), .A1N(n21), .Y(n61) );
  NOR2X2M U289 ( .A(n21), .B(n63), .Y(n62) );
  OAI21X2M U290 ( .A0(n18), .A1(n19), .B0(n20), .Y(quotient[0]) );
  AO21XLM U291 ( .A0(n19), .A1(n18), .B0(b[7]), .Y(n20) );
  AOI2BB2X2M U292 ( .B0(n22), .B1(n23), .A0N(b[6]), .A1N(n24), .Y(n18) );
  NAND2BX2M U293 ( .AN(quotient[1]), .B(n21), .Y(n19) );
  INVXLM U294 ( .A(b[0]), .Y(n16) );
  NAND2X2M U295 ( .A(quotient[1]), .B(n34), .Y(n32) );
  XNOR2X1M U296 ( .A(b[4]), .B(n35), .Y(n34) );
  XNOR2X4M U297 ( .A(n65), .B(n66), .Y(n26) );
  NAND2XLM U298 ( .A(n67), .B(quotient[2]), .Y(n65) );
  XNOR2X1M U299 ( .A(b[4]), .B(n68), .Y(n67) );
  XNOR2X4M U300 ( .A(n25), .B(n26), .Y(n23) );
  NAND2X2M U301 ( .A(quotient[1]), .B(n27), .Y(n25) );
  XNOR2X2M U302 ( .A(b[5]), .B(n28), .Y(n27) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n10, n12, n13, n14, n16, n7, n9, n11, n15,
         n17;

  AO2B2X2M U25 ( .B0(n12), .B1(A[3]), .A0(n7), .A1N(n17), .Y(n10) );
  OR2X2M U26 ( .A(A[3]), .B(n12), .Y(n7) );
  OAI21X4M U27 ( .A0(n2), .A1(n1), .B0(n13), .Y(n12) );
  AO21XLM U28 ( .A0(n1), .A1(n2), .B0(B[2]), .Y(n13) );
  INVX2M U29 ( .A(n14), .Y(n2) );
  INVX2M U30 ( .A(A[2]), .Y(n1) );
  INVX2M U31 ( .A(A[0]), .Y(n3) );
  XNOR3X2M U32 ( .A(n17), .B(A[3]), .C(n12), .Y(DIFF[3]) );
  XOR3XLM U33 ( .A(B[2]), .B(n1), .C(n14), .Y(DIFF[2]) );
  AO2B2X2M U34 ( .B0(n16), .B1(A[1]), .A0(n9), .A1N(B[1]), .Y(n14) );
  OR2X2M U35 ( .A(A[1]), .B(n16), .Y(n9) );
  BUFX2M U36 ( .A(B[3]), .Y(n17) );
  XNOR3XLM U37 ( .A(B[1]), .B(A[1]), .C(n16), .Y(DIFF[1]) );
  NAND2X2M U38 ( .A(B[0]), .B(n3), .Y(n16) );
  AO2B2X2M U39 ( .B0(n8), .B1(A[5]), .A0(n11), .A1N(B[5]), .Y(n5) );
  OR2X2M U40 ( .A(A[5]), .B(n8), .Y(n11) );
  XNOR3XLM U41 ( .A(B[6]), .B(A[6]), .C(n5), .Y(DIFF[6]) );
  XOR3XLM U42 ( .A(B[7]), .B(A[7]), .C(n4), .Y(DIFF[7]) );
  AOI21X2M U43 ( .A0(A[6]), .A1(n5), .B0(n6), .Y(n4) );
  AOI2BB1X1M U44 ( .A0N(n5), .A1N(A[6]), .B0(B[6]), .Y(n6) );
  AO2B2X2M U45 ( .B0(n10), .B1(A[4]), .A0(n15), .A1N(B[4]), .Y(n8) );
  OR2X2M U46 ( .A(A[4]), .B(n10), .Y(n15) );
  XNOR3XLM U47 ( .A(B[4]), .B(A[4]), .C(n10), .Y(DIFF[4]) );
  XNOR3XLM U48 ( .A(B[5]), .B(A[5]), .C(n8), .Y(DIFF[5]) );
  OAI21X1M U49 ( .A0(B[0]), .A1(n3), .B0(n16), .Y(DIFF[0]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  AO22X2M U22 ( .A0(n6), .A1(A[4]), .B0(n7), .B1(B[4]), .Y(n4) );
  AND2X2M U23 ( .A(B[0]), .B(A[0]), .Y(n12) );
  XOR2X1M U24 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  OAI2BB1X2M U25 ( .A0N(n10), .A1N(A[2]), .B0(n11), .Y(n8) );
  OAI21X2M U26 ( .A0(A[2]), .A1(n10), .B0(B[2]), .Y(n11) );
  AO22X2M U27 ( .A0(n8), .A1(A[3]), .B0(n9), .B1(n14), .Y(n6) );
  OR2X2M U28 ( .A(A[3]), .B(n8), .Y(n9) );
  BUFX2M U29 ( .A(A[1]), .Y(n15) );
  XOR3XLM U30 ( .A(n14), .B(A[3]), .C(n8), .Y(SUM[3]) );
  XOR3XLM U31 ( .A(B[2]), .B(A[2]), .C(n10), .Y(SUM[2]) );
  OAI2BB1X2M U32 ( .A0N(n12), .A1N(n15), .B0(n13), .Y(n10) );
  OAI21X2M U33 ( .A0(n12), .A1(n15), .B0(B[1]), .Y(n13) );
  BUFX2M U34 ( .A(B[3]), .Y(n14) );
  XOR3XLM U35 ( .A(B[1]), .B(n15), .C(n12), .Y(SUM[1]) );
  OAI2BB1X2M U36 ( .A0N(n4), .A1N(A[5]), .B0(n5), .Y(n2) );
  OAI21X1M U37 ( .A0(A[5]), .A1(n4), .B0(B[5]), .Y(n5) );
  OR2X2M U38 ( .A(A[4]), .B(n6), .Y(n7) );
  XOR3XLM U39 ( .A(B[6]), .B(A[6]), .C(n2), .Y(SUM[6]) );
  XOR3XLM U40 ( .A(B[7]), .B(A[7]), .C(n1), .Y(SUM[7]) );
  AO2B2XLM U41 ( .B0(n2), .B1(A[6]), .A0(B[6]), .A1N(n3), .Y(n1) );
  NOR2X2M U42 ( .A(A[6]), .B(n2), .Y(n3) );
  XOR3XLM U43 ( .A(B[4]), .B(A[4]), .C(n6), .Y(SUM[4]) );
  XOR3XLM U44 ( .A(B[5]), .B(A[5]), .C(n4), .Y(SUM[5]) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n104, n105, n8, n74, n103, n106, n107, n108, n109, n110,
         n111, n112, n113;

  AOI22X4M U91 ( .A0(n99), .A1(n100), .B0(n101), .B1(n102), .Y(n95) );
  BUFX2M U114 ( .A(n84), .Y(n8) );
  OA21X1M U115 ( .A0(n83), .A1(n8), .B0(n85), .Y(n70) );
  OAI2BB1XLM U116 ( .A0N(n8), .A1N(n83), .B0(n86), .Y(n85) );
  AND3X2M U117 ( .A(B[4]), .B(n112), .C(n55), .Y(n38) );
  CLKNAND2X2M U118 ( .A(A[6]), .B(B[0]), .Y(n50) );
  INVX2M U119 ( .A(B[0]), .Y(n11) );
  NAND2X1M U120 ( .A(A[4]), .B(B[0]), .Y(n84) );
  AND2X1M U121 ( .A(B[4]), .B(n112), .Y(n103) );
  AOI2BB2X2M U122 ( .B0(n61), .B1(n62), .A0N(n63), .A1N(n64), .Y(n22) );
  INVX4M U123 ( .A(n107), .Y(n106) );
  NOR2BX2M U124 ( .AN(n110), .B(n9), .Y(n87) );
  AOI2BB2X2M U125 ( .B0(n69), .B1(n1), .A0N(n70), .A1N(n71), .Y(n51) );
  NOR2X2M U126 ( .A(n113), .B(n11), .Y(n104) );
  NOR2BX2M U127 ( .AN(B[4]), .B(n9), .Y(n73) );
  INVX2M U128 ( .A(n93), .Y(n3) );
  XNOR3X2M U129 ( .A(n20), .B(n22), .C(n19), .Y(n25) );
  OAI2B2X4M U130 ( .A1N(n79), .A0(n80), .B0(n81), .B1(n82), .Y(n68) );
  NOR2BX2M U131 ( .AN(n82), .B(n2), .Y(n80) );
  XOR3X2M U132 ( .A(n26), .B(n23), .C(n25), .Y(n49) );
  OA21X2M U133 ( .A0(n65), .A1(n66), .B0(n67), .Y(n23) );
  OAI2BB1X2M U134 ( .A0N(n65), .A1N(n66), .B0(n68), .Y(n67) );
  INVX2M U135 ( .A(n81), .Y(n2) );
  CLKXOR2X2M U136 ( .A(n98), .B(n87), .Y(n89) );
  NAND2X2M U137 ( .A(n112), .B(n108), .Y(n98) );
  XOR3X2M U138 ( .A(n65), .B(n68), .C(n66), .Y(n69) );
  OAI22X4M U139 ( .A0(n89), .A1(n90), .B0(n91), .B1(n92), .Y(n79) );
  NOR2BX2M U140 ( .AN(n90), .B(n7), .Y(n91) );
  INVX2M U141 ( .A(n89), .Y(n7) );
  XOR3X2M U142 ( .A(n79), .B(n82), .C(n2), .Y(n83) );
  NOR2BX2M U143 ( .AN(n108), .B(n9), .Y(n97) );
  CLKXOR2X2M U144 ( .A(n17), .B(n18), .Y(n16) );
  AOI2BB1X2M U145 ( .A0N(n19), .A1N(n20), .B0(n21), .Y(n18) );
  OAI2BB2X1M U146 ( .B0(n23), .B1(n24), .A0N(n25), .A1N(n26), .Y(n17) );
  AOI21X2M U147 ( .A0(n19), .A1(n20), .B0(n22), .Y(n21) );
  NAND3X2M U148 ( .A(n112), .B(n106), .C(n97), .Y(n90) );
  INVX6M U149 ( .A(n113), .Y(n112) );
  NAND3X2M U150 ( .A(n112), .B(n108), .C(n87), .Y(n76) );
  NOR2X2M U151 ( .A(n26), .B(n25), .Y(n24) );
  INVX4M U152 ( .A(n109), .Y(n108) );
  INVX2M U153 ( .A(B[2]), .Y(n109) );
  CLKXOR2X2M U154 ( .A(n74), .B(n97), .Y(n99) );
  AND2X2M U155 ( .A(n112), .B(n106), .Y(n74) );
  XOR3X2M U156 ( .A(n92), .B(n89), .C(n90), .Y(n93) );
  XOR3X2M U157 ( .A(n30), .B(n33), .C(n32), .Y(n19) );
  XOR3X2M U158 ( .A(n63), .B(n62), .C(n61), .Y(n66) );
  NOR2X2M U159 ( .A(n62), .B(n61), .Y(n64) );
  XOR3X2M U160 ( .A(n78), .B(n75), .C(n76), .Y(n81) );
  OA22X2M U161 ( .A0(n75), .A1(n76), .B0(n77), .B1(n78), .Y(n63) );
  NOR2BX2M U162 ( .AN(n76), .B(n6), .Y(n77) );
  INVX2M U163 ( .A(n75), .Y(n6) );
  OR2X2M U164 ( .A(n100), .B(n99), .Y(n101) );
  INVX4M U165 ( .A(A[0]), .Y(n9) );
  AND3X2M U166 ( .A(n104), .B(n106), .C(A[0]), .Y(n100) );
  INVX2M U167 ( .A(A[2]), .Y(n4) );
  NAND2X2M U168 ( .A(A[2]), .B(n108), .Y(n78) );
  NAND2X2M U169 ( .A(n110), .B(A[2]), .Y(n59) );
  INVX2M U170 ( .A(A[1]), .Y(n113) );
  NAND2X2M U171 ( .A(A[3]), .B(n106), .Y(n82) );
  NAND2X2M U172 ( .A(A[4]), .B(n108), .Y(n20) );
  NOR2X2M U173 ( .A(n33), .B(n32), .Y(n31) );
  INVX2M U174 ( .A(B[1]), .Y(n107) );
  AND2X2M U175 ( .A(A[3]), .B(n108), .Y(n62) );
  NAND2X2M U176 ( .A(A[2]), .B(n106), .Y(n92) );
  AND2X2M U177 ( .A(n110), .B(A[3]), .Y(n33) );
  XOR3XLM U178 ( .A(n102), .B(n100), .C(n99), .Y(PRODUCT[2]) );
  NAND2X2M U179 ( .A(A[4]), .B(n106), .Y(n65) );
  AND2X2M U180 ( .A(A[5]), .B(n106), .Y(n26) );
  XNOR2X2M U181 ( .A(n104), .B(n105), .Y(PRODUCT[1]) );
  NAND2X2M U182 ( .A(A[0]), .B(n106), .Y(n105) );
  AND2X2M U183 ( .A(A[5]), .B(n108), .Y(n46) );
  CLKXOR2X2M U184 ( .A(n88), .B(n73), .Y(n75) );
  NAND2X2M U185 ( .A(n110), .B(n112), .Y(n88) );
  XOR3X2M U186 ( .A(n59), .B(n57), .C(n60), .Y(n61) );
  AOI2BB2X2M U187 ( .B0(n57), .B1(n5), .A0N(n58), .A1N(n59), .Y(n30) );
  NOR2X2M U188 ( .A(n5), .B(n57), .Y(n58) );
  INVX2M U189 ( .A(n60), .Y(n5) );
  OAI22X1M U190 ( .A0(n49), .A1(n50), .B0(n51), .B1(n52), .Y(n48) );
  AND2X2M U191 ( .A(n50), .B(n49), .Y(n52) );
  CLKXOR2X2M U192 ( .A(n12), .B(n13), .Y(PRODUCT[7]) );
  XOR3XLM U193 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  XOR3XLM U194 ( .A(n46), .B(n47), .C(n48), .Y(n12) );
  XOR3XLM U195 ( .A(n40), .B(n41), .C(n42), .Y(n14) );
  NOR2X2M U196 ( .A(n10), .B(n9), .Y(n55) );
  XOR3X2M U197 ( .A(n36), .B(n39), .C(n38), .Y(n32) );
  OAI22X4M U198 ( .A0(n93), .A1(n94), .B0(n95), .B1(n96), .Y(n86) );
  NOR2BX2M U199 ( .AN(n94), .B(n3), .Y(n96) );
  NOR2X2M U200 ( .A(n1), .B(n69), .Y(n71) );
  INVX2M U201 ( .A(n72), .Y(n1) );
  NOR2X2M U202 ( .A(n4), .B(n11), .Y(n102) );
  XNOR3X2M U203 ( .A(n51), .B(n50), .C(n49), .Y(PRODUCT[6]) );
  XOR3XLM U204 ( .A(n72), .B(n70), .C(n69), .Y(PRODUCT[5]) );
  NAND3X2M U205 ( .A(n110), .B(n112), .C(n73), .Y(n60) );
  INVX4M U206 ( .A(n111), .Y(n110) );
  INVX2M U207 ( .A(B[3]), .Y(n111) );
  XOR3XLM U208 ( .A(n27), .B(n28), .C(n29), .Y(n15) );
  CLKXOR2X2M U209 ( .A(n34), .B(n35), .Y(n28) );
  AOI22X1M U210 ( .A0(n36), .A1(n37), .B0(n38), .B1(n39), .Y(n27) );
  OAI2BB2X1M U211 ( .B0(n30), .B1(n31), .A0N(n32), .A1N(n33), .Y(n29) );
  XOR3XLM U212 ( .A(n95), .B(n94), .C(n3), .Y(PRODUCT[3]) );
  XOR3XLM U213 ( .A(n8), .B(n86), .C(n83), .Y(PRODUCT[4]) );
  OR2X2M U214 ( .A(n39), .B(n38), .Y(n37) );
  NOR3X2M U215 ( .A(n45), .B(n113), .C(n10), .Y(n41) );
  NOR2X2M U216 ( .A(n4), .B(n10), .Y(n40) );
  NOR2X2M U217 ( .A(n11), .B(n9), .Y(PRODUCT[0]) );
  CLKXOR2X2M U218 ( .A(n103), .B(n55), .Y(n57) );
  INVX2M U219 ( .A(B[5]), .Y(n10) );
  CLKXOR2X2M U220 ( .A(n56), .B(n45), .Y(n39) );
  NAND2XLM U221 ( .A(B[5]), .B(n112), .Y(n56) );
  CLKNAND2X2M U222 ( .A(B[6]), .B(A[0]), .Y(n45) );
  NOR2BX2M U223 ( .AN(B[4]), .B(n4), .Y(n36) );
  NAND2X2M U224 ( .A(A[3]), .B(B[0]), .Y(n94) );
  NAND2X1M U225 ( .A(A[5]), .B(B[0]), .Y(n72) );
  CLKXOR2X2M U226 ( .A(n43), .B(n44), .Y(n42) );
  NAND2X2M U227 ( .A(A[4]), .B(n110), .Y(n43) );
  NAND2XLM U228 ( .A(B[4]), .B(A[3]), .Y(n44) );
  CLKXOR2X2M U229 ( .A(n53), .B(n54), .Y(n47) );
  NAND2X2M U230 ( .A(n106), .B(A[6]), .Y(n54) );
  NAND2XLM U231 ( .A(B[0]), .B(A[7]), .Y(n53) );
  NAND2XLM U232 ( .A(B[6]), .B(n112), .Y(n34) );
  NAND2X2M U233 ( .A(B[7]), .B(A[0]), .Y(n35) );
endmodule


module ALU ( A, B, ALU_FUN, CLK, RST, Enable, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [7:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, n1, n2, n4, n5, n6,
         n7, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n3, n10,
         n17, n18, n42, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157;
  wire   [7:0] ALU_OUT_Comb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  ALU_DW_div_uns_0 div_51 ( .a({n144, n143, n139, n137, n134, n131, n155, n128}), .b({B[7:4], n153, n151, n149, B[0]}), .quotient({N122, N121, N120, N119, 
        N118, N117, N116, N115}) );
  ALU_DW01_sub_0 sub_45 ( .A({n144, n143, n139, n136, n133, n131, n155, n128}), 
        .B({B[7:4], n153, n151, n149, B[0]}), .CI(1'b0), .DIFF({N106, N105, 
        N104, N103, N102, N101, N100, N99}) );
  ALU_DW01_add_0 add_42 ( .A({n144, n142, n140, n137, n134, n130, n155, n42}), 
        .B({B[7:4], n153, n151, n149, B[0]}), .CI(1'b0), .SUM({N98, N97, N96, 
        N95, N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_48 ( .A({n144, n142, n139, n136, n133, n130, n155, n42}), .B({B[7:4], n153, n151, n149, B[0]}), .TC(1'b0), .PRODUCT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, N114, N113, N112, 
        N111, N110, N109, N108, N107}) );
  NOR4X8M U51 ( .A(n25), .B(n26), .C(n24), .D(ALU_FUN[0]), .Y(n32) );
  DFFRQX2M OUT_VALID_reg ( .D(Enable), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  OAI32X2M U136 ( .A0(n122), .A1(ALU_FUN[1]), .A2(n25), .B0(n123), .B1(n27), 
        .Y(n41) );
  OAI32X2M U137 ( .A0(n25), .A1(n126), .A2(n26), .B0(n123), .B1(n27), .Y(n43)
         );
  NAND2X2M U138 ( .A(n124), .B(n24), .Y(n3) );
  CLKINVX4M U139 ( .A(n141), .Y(n142) );
  BUFX4M U140 ( .A(n41), .Y(n10) );
  AOI221X2M U141 ( .A0(n147), .A1(n4), .B0(n140), .B1(n10), .C0(n146), .Y(n61)
         );
  AOI221X2M U142 ( .A0(n147), .A1(n12), .B0(n128), .B1(n10), .C0(n146), .Y(
        n121) );
  AOI221X2M U143 ( .A0(n147), .A1(n156), .B0(n155), .B1(n10), .C0(n145), .Y(
        n92) );
  BUFX4M U144 ( .A(n43), .Y(n17) );
  AOI221X2M U145 ( .A0(n12), .A1(n17), .B0(n147), .B1(n128), .C0(n148), .Y(
        n125) );
  AOI221X2M U146 ( .A0(n134), .A1(n147), .B0(n17), .B1(n7), .C0(n148), .Y(n76)
         );
  AOI221X2M U147 ( .A0(n155), .A1(n147), .B0(n17), .B1(n156), .C0(n148), .Y(
        n91) );
  AOI221X2M U148 ( .A0(n140), .A1(n147), .B0(n17), .B1(n4), .C0(n148), .Y(n62)
         );
  CLKINVX2M U149 ( .A(B[0]), .Y(n19) );
  INVX4M U150 ( .A(n152), .Y(n151) );
  INVXLM U151 ( .A(n125), .Y(n11) );
  AOI21X2M U152 ( .A0(n152), .A1(n131), .B0(n117), .Y(n85) );
  NOR2X2M U153 ( .A(n152), .B(n130), .Y(n117) );
  INVX4M U154 ( .A(n150), .Y(n149) );
  INVX4M U155 ( .A(n141), .Y(n143) );
  INVX4M U156 ( .A(n138), .Y(n139) );
  INVX4M U157 ( .A(n129), .Y(n131) );
  INVX4M U158 ( .A(n18), .Y(n128) );
  INVX4M U159 ( .A(n129), .Y(n130) );
  INVX4M U160 ( .A(n132), .Y(n133) );
  INVX4M U161 ( .A(n138), .Y(n140) );
  INVX4M U162 ( .A(n154), .Y(n153) );
  CLKBUFX6M U163 ( .A(A[7]), .Y(n144) );
  INVX4M U164 ( .A(n148), .Y(n22) );
  INVX4M U165 ( .A(n3), .Y(n145) );
  INVX4M U166 ( .A(n3), .Y(n146) );
  INVX2M U167 ( .A(n85), .Y(n9) );
  NAND2X4M U168 ( .A(n24), .B(n27), .Y(n122) );
  OAI22X1M U169 ( .A0(n83), .A1(n152), .B0(n151), .B1(n84), .Y(n82) );
  AOI21X1M U170 ( .A0(n17), .A1(n8), .B0(n148), .Y(n84) );
  AOI21X1M U171 ( .A0(n131), .A1(n10), .B0(n145), .Y(n83) );
  OAI222X1M U172 ( .A0(n5), .A1(n21), .B0(n4), .B1(n56), .C0(n137), .C1(n22), 
        .Y(n66) );
  OAI222X1M U173 ( .A0(n85), .A1(n21), .B0(n56), .B1(n7), .C0(n131), .C1(n22), 
        .Y(n81) );
  OAI222X1M U174 ( .A0(n21), .A1(n77), .B0(n56), .B1(n6), .C0(n134), .C1(n22), 
        .Y(n73) );
  OAI22X1M U175 ( .A0(n56), .A1(n8), .B0(n23), .B1(n12), .Y(n90) );
  INVX2M U176 ( .A(n32), .Y(n23) );
  BUFX6M U177 ( .A(n33), .Y(n148) );
  NOR3X2M U178 ( .A(n26), .B(n25), .C(n122), .Y(n33) );
  INVX2M U179 ( .A(n147), .Y(n21) );
  NOR2BX8M U180 ( .AN(n127), .B(n122), .Y(n46) );
  NOR2BX8M U181 ( .AN(n127), .B(n126), .Y(n47) );
  NOR2X8M U182 ( .A(n99), .B(n122), .Y(n44) );
  NOR2X8M U183 ( .A(n99), .B(n126), .Y(n45) );
  INVX2M U184 ( .A(n56), .Y(n20) );
  INVX4M U185 ( .A(n128), .Y(n12) );
  INVX4M U186 ( .A(n134), .Y(n7) );
  INVX4M U187 ( .A(n137), .Y(n6) );
  INVX2M U188 ( .A(n131), .Y(n8) );
  INVX4M U189 ( .A(n140), .Y(n4) );
  AOI31X2M U190 ( .A0(n94), .A1(n95), .A2(n96), .B0(n28), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U191 ( .A0(N91), .A1(n46), .B0(N99), .B1(n47), .Y(n94) );
  AOI211X2M U192 ( .A0(n11), .A1(n19), .B0(n97), .C0(n98), .Y(n96) );
  AOI222X2M U193 ( .A0(N107), .A1(n44), .B0(N115), .B1(n45), .C0(n128), .C1(
        n145), .Y(n95) );
  OAI222X1M U194 ( .A0(n56), .A1(n157), .B0(n121), .B1(n19), .C0(n128), .C1(
        n22), .Y(n97) );
  OAI221X1M U195 ( .A0(n149), .A1(n91), .B0(n92), .B1(n150), .C0(n93), .Y(n89)
         );
  OAI2B2X1M U196 ( .A1N(n153), .A0(n75), .B0(n153), .B1(n76), .Y(n74) );
  AOI21X1M U197 ( .A0(n134), .A1(n10), .B0(n146), .Y(n75) );
  INVX4M U198 ( .A(ALU_FUN[2]), .Y(n25) );
  AOI31X2M U199 ( .A0(n86), .A1(n87), .A2(n88), .B0(n28), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U200 ( .A0(N92), .A1(n46), .B0(N100), .B1(n47), .Y(n86) );
  AOI222X2M U201 ( .A0(N108), .A1(n44), .B0(N116), .B1(n45), .C0(n155), .C1(
        n146), .Y(n87) );
  AOI211X2M U202 ( .A0(n148), .A1(n157), .B0(n89), .C0(n90), .Y(n88) );
  AOI31X2M U203 ( .A0(n70), .A1(n71), .A2(n72), .B0(n28), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U204 ( .A0(N94), .A1(n46), .B0(N102), .B1(n47), .Y(n70) );
  AOI222X2M U205 ( .A0(N110), .A1(n44), .B0(N118), .B1(n45), .C0(n134), .C1(
        n146), .Y(n71) );
  AOI211X2M U206 ( .A0(n131), .A1(n32), .B0(n73), .C0(n74), .Y(n72) );
  AOI31X2M U207 ( .A0(n57), .A1(n58), .A2(n59), .B0(n28), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U208 ( .A0(N96), .A1(n46), .B0(N104), .B1(n47), .Y(n57) );
  AOI222X2M U209 ( .A0(N112), .A1(n44), .B0(N120), .B1(n45), .C0(n140), .C1(
        n146), .Y(n58) );
  AOI221X2M U210 ( .A0(n20), .A1(n143), .B0(n148), .B1(n4), .C0(n60), .Y(n59)
         );
  AOI31X2M U211 ( .A0(n29), .A1(n30), .A2(n31), .B0(n28), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U212 ( .A0(N98), .A1(n46), .B0(N106), .B1(n47), .Y(n29) );
  AOI222X2M U213 ( .A0(N114), .A1(n44), .B0(N122), .B1(n45), .C0(n145), .C1(
        n144), .Y(n30) );
  AOI221X2M U214 ( .A0(n143), .A1(n32), .B0(n148), .B1(n1), .C0(n34), .Y(n31)
         );
  INVX4M U215 ( .A(ALU_FUN[3]), .Y(n24) );
  INVX4M U216 ( .A(ALU_FUN[0]), .Y(n27) );
  NAND2X2M U217 ( .A(ALU_FUN[0]), .B(n24), .Y(n126) );
  INVX2M U218 ( .A(ALU_FUN[1]), .Y(n26) );
  NOR2X4M U219 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .Y(n127) );
  AOI31X2M U220 ( .A0(n78), .A1(n79), .A2(n80), .B0(n28), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U221 ( .A0(N93), .A1(n46), .B0(N101), .B1(n47), .Y(n78) );
  AOI222X2M U222 ( .A0(N109), .A1(n44), .B0(N117), .B1(n45), .C0(n131), .C1(
        n145), .Y(n79) );
  AOI211X2M U223 ( .A0(n155), .A1(n32), .B0(n81), .C0(n82), .Y(n80) );
  AOI31X2M U224 ( .A0(n63), .A1(n64), .A2(n65), .B0(n28), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U225 ( .A0(N95), .A1(n46), .B0(N103), .B1(n47), .Y(n63) );
  AOI222X2M U226 ( .A0(N111), .A1(n44), .B0(N119), .B1(n45), .C0(n137), .C1(
        n145), .Y(n64) );
  AOI211X2M U227 ( .A0(n134), .A1(n32), .B0(n66), .C0(n67), .Y(n65) );
  AOI31X2M U228 ( .A0(n48), .A1(n49), .A2(n50), .B0(n28), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U229 ( .A0(N97), .A1(n46), .B0(N105), .B1(n47), .Y(n48) );
  AOI222X2M U230 ( .A0(N113), .A1(n44), .B0(N121), .B1(n45), .C0(n146), .C1(
        n142), .Y(n49) );
  AOI211X2M U231 ( .A0(n140), .A1(n32), .B0(n51), .C0(n52), .Y(n50) );
  NAND2X2M U232 ( .A(ALU_FUN[3]), .B(n127), .Y(n123) );
  OAI222X1M U233 ( .A0(n55), .A1(n21), .B0(n1), .B1(n56), .C0(n143), .C1(n22), 
        .Y(n51) );
  NOR3X4M U234 ( .A(n27), .B(ALU_FUN[1]), .C(n25), .Y(n124) );
  NAND2X4M U235 ( .A(n124), .B(ALU_FUN[3]), .Y(n56) );
  CLKBUFX6M U236 ( .A(n40), .Y(n147) );
  NOR2X2M U237 ( .A(n123), .B(ALU_FUN[0]), .Y(n40) );
  OAI31X2M U238 ( .A0(n99), .A1(n100), .A2(n24), .B0(n93), .Y(n98) );
  AOI32X1M U239 ( .A0(n101), .A1(n27), .A2(n2), .B0(ALU_FUN[0]), .B1(n103), 
        .Y(n100) );
  INVX2M U240 ( .A(n103), .Y(n2) );
  OAI21X2M U241 ( .A0(n104), .A1(n39), .B0(n38), .Y(n103) );
  NAND4BX2M U242 ( .AN(n101), .B(ALU_FUN[2]), .C(ALU_FUN[3]), .D(n102), .Y(n93) );
  NOR2X2M U243 ( .A(ALU_FUN[1]), .B(ALU_FUN[0]), .Y(n102) );
  NAND2X2M U244 ( .A(ALU_FUN[1]), .B(n25), .Y(n99) );
  INVX6M U245 ( .A(n135), .Y(n137) );
  INVX6M U246 ( .A(n132), .Y(n134) );
  INVX6M U247 ( .A(n156), .Y(n155) );
  BUFX2M U248 ( .A(n157), .Y(n156) );
  OAI32X2M U249 ( .A0(n9), .A1(n112), .A2(n113), .B0(n151), .B1(n8), .Y(n110)
         );
  AOI21X2M U250 ( .A0(n128), .A1(n19), .B0(n155), .Y(n113) );
  AOI31X2M U251 ( .A0(n155), .A1(n19), .A2(n128), .B0(n150), .Y(n112) );
  INVX4M U252 ( .A(n18), .Y(n42) );
  INVX2M U253 ( .A(n111), .Y(n5) );
  NAND2X2M U254 ( .A(n153), .B(n7), .Y(n77) );
  NOR2X2M U255 ( .A(n153), .B(n7), .Y(n109) );
  NAND2X2M U256 ( .A(n139), .B(n15), .Y(n108) );
  INVX4M U257 ( .A(n135), .Y(n136) );
  NOR2X4M U258 ( .A(n13), .B(n144), .Y(n39) );
  NAND2X2M U259 ( .A(n144), .B(n13), .Y(n38) );
  INVX2M U260 ( .A(n144), .Y(n1) );
  OAI222X1M U261 ( .A0(n61), .A1(n15), .B0(B[5]), .B1(n62), .C0(n23), .C1(n6), 
        .Y(n60) );
  OAI221X1M U262 ( .A0(B[7]), .A1(n35), .B0(n36), .B1(n13), .C0(n37), .Y(n34)
         );
  OAI2B1X2M U263 ( .A1N(n38), .A0(n39), .B0(n147), .Y(n37) );
  AOI21X1M U264 ( .A0(n17), .A1(n1), .B0(n148), .Y(n35) );
  AOI21X1M U265 ( .A0(n144), .A1(n10), .B0(n145), .Y(n36) );
  INVX2M U266 ( .A(B[3]), .Y(n154) );
  INVX2M U267 ( .A(B[1]), .Y(n150) );
  INVX2M U268 ( .A(B[2]), .Y(n152) );
  OAI22X1M U269 ( .A0(n68), .A1(n16), .B0(B[4]), .B1(n69), .Y(n67) );
  AOI21X1M U270 ( .A0(n17), .A1(n6), .B0(n148), .Y(n69) );
  AOI21X1M U271 ( .A0(n137), .A1(n10), .B0(n145), .Y(n68) );
  OAI22X1M U272 ( .A0(n53), .A1(n14), .B0(B[6]), .B1(n54), .Y(n52) );
  AOI21X1M U273 ( .A0(n17), .A1(n141), .B0(n148), .Y(n54) );
  AOI21X1M U274 ( .A0(n143), .A1(n10), .B0(n146), .Y(n53) );
  INVX2M U275 ( .A(A[6]), .Y(n141) );
  INVX2M U276 ( .A(A[5]), .Y(n138) );
  INVX4M U277 ( .A(Enable), .Y(n28) );
  INVX2M U278 ( .A(A[4]), .Y(n135) );
  INVX2M U279 ( .A(A[3]), .Y(n132) );
  INVX2M U280 ( .A(A[2]), .Y(n129) );
  INVX2M U281 ( .A(A[1]), .Y(n157) );
  AOI32X1M U282 ( .A0(n105), .A1(n106), .A2(n55), .B0(n142), .B1(n14), .Y(n104) );
  NAND2XLM U283 ( .A(B[5]), .B(n4), .Y(n105) );
  OAI211X1M U284 ( .A0(B[4]), .A1(n6), .B0(n107), .C0(n108), .Y(n106) );
  OAI211X2M U285 ( .A0(n109), .A1(n110), .B0(n77), .C0(n5), .Y(n107) );
  INVX2M U286 ( .A(A[0]), .Y(n18) );
  OAI31X2M U287 ( .A0(n9), .A1(n119), .A2(n120), .B0(n77), .Y(n118) );
  AOI21X1M U288 ( .A0(B[0]), .A1(n12), .B0(n156), .Y(n120) );
  AOI31X1M U289 ( .A0(n12), .A1(n157), .A2(B[0]), .B0(n149), .Y(n119) );
  XNOR2X4M U290 ( .A(B[4]), .B(n6), .Y(n111) );
  AOI2B1X2M U291 ( .A1N(n114), .A0(n38), .B0(n39), .Y(n101) );
  AOI32X1M U292 ( .A0(n108), .A1(n115), .A2(n55), .B0(B[6]), .B1(n141), .Y(
        n114) );
  OAI222X1M U293 ( .A0(n137), .A1(n16), .B0(n111), .B1(n116), .C0(n140), .C1(
        n15), .Y(n115) );
  OAI22X1M U294 ( .A0(n153), .A1(n7), .B0(n117), .B1(n118), .Y(n116) );
  XNOR2X4M U295 ( .A(B[6]), .B(n142), .Y(n55) );
  CLKINVX1M U296 ( .A(B[4]), .Y(n16) );
  CLKINVX2M U297 ( .A(B[5]), .Y(n15) );
  CLKINVX1M U298 ( .A(B[6]), .Y(n14) );
  INVX2M U299 ( .A(B[7]), .Y(n13) );
endmodule


module ClkDiv_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;
  wire   n1, n3, n4, n5, n6, n7;

  NOR3BX4M U4 ( .AN(A[4]), .B(n1), .C(n5), .Y(n4) );
  NAND3X2M U14 ( .A(A[1]), .B(A[0]), .C(A[2]), .Y(n5) );
  XNOR2X2M U15 ( .A(A[1]), .B(SUM[0]), .Y(SUM[1]) );
  XNOR2X2M U16 ( .A(A[3]), .B(n5), .Y(SUM[3]) );
  CLKXOR2X2M U17 ( .A(A[4]), .B(n6), .Y(SUM[4]) );
  NOR2X2M U18 ( .A(n5), .B(n1), .Y(n6) );
  XNOR2X2M U19 ( .A(A[2]), .B(n7), .Y(SUM[2]) );
  NAND2X2M U20 ( .A(A[1]), .B(A[0]), .Y(n7) );
  CLKXOR2X2M U21 ( .A(A[5]), .B(n4), .Y(SUM[5]) );
  CLKXOR2X2M U22 ( .A(A[6]), .B(n3), .Y(SUM[6]) );
  AND2X2M U23 ( .A(n4), .B(A[5]), .Y(n3) );
  INVX2M U24 ( .A(A[3]), .Y(n1) );
  INVX2M U25 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51;
  wire   [7:0] i_div_ratio_c;
  wire   [6:0] count;

  ClkDiv_DW01_inc_0 add_61 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  MX2X6M U27 ( .A(i_ref_clk), .B(div_clk), .S0(n3), .Y(o_div_clk) );
  OAI221X4M U14 ( .A0(odd_edge_tog), .A1(n16), .B0(n14), .B1(n1), .C0(
        i_div_ratio_c[0]), .Y(n12) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFRQX2M \i_div_ratio_c_reg[0]  ( .D(i_div_ratio[0]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[0]) );
  DFFRQX4M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX4M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \i_div_ratio_c_reg[7]  ( .D(i_div_ratio[7]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[7]) );
  DFFRQX2M \i_div_ratio_c_reg[5]  ( .D(i_div_ratio[5]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[5]) );
  DFFRQX2M \i_div_ratio_c_reg[4]  ( .D(i_div_ratio[4]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[4]) );
  DFFRQX2M \i_div_ratio_c_reg[6]  ( .D(i_div_ratio[6]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[6]) );
  DFFRQX2M \i_div_ratio_c_reg[3]  ( .D(i_div_ratio[3]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[3]) );
  DFFRQX2M \i_div_ratio_c_reg[1]  ( .D(i_div_ratio[1]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[1]) );
  DFFRQX2M \i_div_ratio_c_reg[2]  ( .D(i_div_ratio[2]), .CK(i_ref_clk), .RN(
        i_rst), .Q(i_div_ratio_c[2]) );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFSX1M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog), .QN(n1) );
  DFFRX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1]), 
        .QN(n8) );
  XNOR2X4M U52 ( .A(count[6]), .B(i_div_ratio_c[7]), .Y(n35) );
  BUFX4M U53 ( .A(n9), .Y(n51) );
  CLKINVX3M U54 ( .A(n51), .Y(n3) );
  OAI31X2M U55 ( .A0(n33), .A1(i_div_ratio_c[7]), .A2(i_div_ratio_c[6]), .B0(
        i_clk_en), .Y(n9) );
  AND3X4M U56 ( .A(n11), .B(n12), .C(n3), .Y(n10) );
  NAND2X2M U57 ( .A(n40), .B(n4), .Y(n33) );
  NAND2X2M U58 ( .A(n44), .B(n5), .Y(n42) );
  OAI21X2M U59 ( .A0(n40), .A1(n4), .B0(n33), .Y(n39) );
  OAI21X2M U60 ( .A0(n44), .A1(n5), .B0(n42), .Y(n45) );
  NAND2X2M U61 ( .A(n35), .B(n36), .Y(n34) );
  INVX2M U62 ( .A(n35), .Y(n2) );
  OAI2BB2X1M U63 ( .B0(n3), .B1(n8), .A0N(N17), .A1N(n10), .Y(n24) );
  OAI2BB2X1M U64 ( .B0(n3), .B1(n7), .A0N(N19), .A1N(n10), .Y(n22) );
  OAI2BB2X1M U65 ( .B0(n3), .B1(n6), .A0N(N20), .A1N(n10), .Y(n21) );
  AO22XLM U66 ( .A0(n51), .A1(count[2]), .B0(N18), .B1(n10), .Y(n23) );
  AO22XLM U67 ( .A0(n51), .A1(count[5]), .B0(N21), .B1(n10), .Y(n20) );
  AO22XLM U68 ( .A0(n51), .A1(count[0]), .B0(N16), .B1(n10), .Y(n25) );
  AO22XLM U69 ( .A0(n51), .A1(count[6]), .B0(N22), .B1(n10), .Y(n19) );
  CLKXOR2X2M U70 ( .A(div_clk), .B(n13), .Y(n18) );
  AOI21X1M U71 ( .A0(n12), .A1(n11), .B0(n51), .Y(n13) );
  CLKXOR2X2M U72 ( .A(odd_edge_tog), .B(n15), .Y(n17) );
  NOR2X1M U73 ( .A(n51), .B(n12), .Y(n15) );
  NOR2X4M U74 ( .A(i_div_ratio_c[2]), .B(i_div_ratio_c[1]), .Y(n44) );
  NOR2X4M U75 ( .A(n42), .B(i_div_ratio_c[4]), .Y(n40) );
  INVX2M U76 ( .A(i_div_ratio_c[3]), .Y(n5) );
  INVX2M U77 ( .A(i_div_ratio_c[5]), .Y(n4) );
  NOR4BX2M U78 ( .AN(n31), .B(n46), .C(n47), .D(n34), .Y(n16) );
  CLKXOR2X2M U79 ( .A(i_div_ratio_c[4]), .B(count[3]), .Y(n47) );
  AND4X2M U80 ( .A(n26), .B(n27), .C(n28), .D(n29), .Y(n14) );
  CLKXOR2X2M U81 ( .A(count[1]), .B(n43), .Y(n27) );
  XNOR2X2M U82 ( .A(count[2]), .B(n45), .Y(n26) );
  AOI211X2M U83 ( .A0(i_div_ratio_c[6]), .A1(n2), .B0(n30), .C0(n31), .Y(n29)
         );
  NOR2X2M U84 ( .A(n37), .B(n38), .Y(n28) );
  CLKXOR2X2M U85 ( .A(n7), .B(n41), .Y(n37) );
  CLKXOR2X2M U86 ( .A(n39), .B(count[4]), .Y(n38) );
  AOI21X2M U87 ( .A0(i_div_ratio_c[4]), .A1(n42), .B0(n40), .Y(n41) );
  XNOR2X4M U88 ( .A(count[5]), .B(i_div_ratio_c[6]), .Y(n36) );
  OAI2BB2X1M U89 ( .B0(n32), .B1(n33), .A0N(n33), .A1N(n34), .Y(n30) );
  AOI2B1X1M U90 ( .A1N(i_div_ratio_c[6]), .A0(n35), .B0(n36), .Y(n32) );
  NAND2BX2M U91 ( .AN(i_div_ratio_c[0]), .B(n14), .Y(n11) );
  XNOR2X4M U92 ( .A(count[0]), .B(i_div_ratio_c[1]), .Y(n31) );
  AOI21X2M U93 ( .A0(i_div_ratio_c[2]), .A1(i_div_ratio_c[1]), .B0(n44), .Y(
        n43) );
  INVX2M U94 ( .A(count[3]), .Y(n7) );
  INVX2M U95 ( .A(count[4]), .Y(n6) );
  NAND3X2M U96 ( .A(n48), .B(n49), .C(n50), .Y(n46) );
  CLKXOR2X2M U97 ( .A(count[2]), .B(n5), .Y(n49) );
  CLKXOR2X2M U98 ( .A(n6), .B(i_div_ratio_c[5]), .Y(n48) );
  CLKXOR2X2M U99 ( .A(n8), .B(i_div_ratio_c[2]), .Y(n50) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX4M U0_TLATNCAX4M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module System_Top ( CLKDIV_EN, CLKG_EN, CLK, RST, ALU_FUN, ALU_Enable, WrEn, 
        RdEn, Address, WrData, RdData, ALU_VLD, ALU_OUT );
  input [3:0] ALU_FUN;
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] ALU_OUT;
  input CLKDIV_EN, CLKG_EN, CLK, RST, ALU_Enable, WrEn, RdEn;
  output ALU_VLD;
  wire   n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, REG_CLK, ALU_CLK, n1, n3, n5, n7, n9, n11, n13, n15,
         n17, n19, n21, n23, n25, n27, n29, n31, n33, n35, n36, n37, n38, n39;
  wire   [7:0] ALU_A;
  wire   [7:0] ALU_B;
  wire   [7:0] CLKDIV_Config;

  RegFile U0_RegFile ( .CLK(REG_CLK), .RST(RST), .WrEn(WrEn), .RdEn(RdEn), 
        .Address(Address), .WrData(WrData), .RdData({n40, n41, n42, n43, n44, 
        n45, n46, n47}), .REG0(ALU_A), .REG1(ALU_B), .REG2(CLKDIV_Config) );
  ALU U0_ALU ( .A({ALU_A[7:2], n39, ALU_A[0]}), .B({ALU_B[7:3], n38, n37, 
        ALU_B[0]}), .ALU_FUN({ALU_FUN[3:2], n36, n35}), .CLK(ALU_CLK), .RST(
        RST), .Enable(ALU_Enable), .ALU_OUT({n49, n50, n51, n52, n53, n54, n55, 
        n56}), .OUT_VALID(n48) );
  ClkDiv U0_ClkDiv ( .i_ref_clk(CLK), .i_rst(RST), .i_clk_en(CLKDIV_EN), 
        .i_div_ratio(CLKDIV_Config), .o_div_clk(REG_CLK) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(CLK), .GATED_CLK(ALU_CLK) );
  BUFX4M U1 ( .A(ALU_FUN[0]), .Y(n35) );
  BUFX4M U2 ( .A(ALU_FUN[1]), .Y(n36) );
  BUFX2M U3 ( .A(ALU_B[1]), .Y(n37) );
  BUFX2M U4 ( .A(ALU_B[2]), .Y(n38) );
  BUFX2M U5 ( .A(ALU_A[1]), .Y(n39) );
  CLKINVX1M U6 ( .A(n47), .Y(n1) );
  CLKINVX40M U7 ( .A(n1), .Y(RdData[0]) );
  CLKINVX1M U8 ( .A(n46), .Y(n3) );
  CLKINVX40M U9 ( .A(n3), .Y(RdData[1]) );
  CLKINVX1M U10 ( .A(n45), .Y(n5) );
  CLKINVX40M U11 ( .A(n5), .Y(RdData[2]) );
  CLKINVX1M U12 ( .A(n44), .Y(n7) );
  CLKINVX40M U13 ( .A(n7), .Y(RdData[3]) );
  CLKINVX1M U14 ( .A(n43), .Y(n9) );
  CLKINVX40M U15 ( .A(n9), .Y(RdData[4]) );
  CLKINVX1M U16 ( .A(n42), .Y(n11) );
  CLKINVX40M U17 ( .A(n11), .Y(RdData[5]) );
  CLKINVX1M U18 ( .A(n41), .Y(n13) );
  CLKINVX40M U19 ( .A(n13), .Y(RdData[6]) );
  CLKINVX1M U20 ( .A(n40), .Y(n15) );
  CLKINVX40M U21 ( .A(n15), .Y(RdData[7]) );
  CLKINVX1M U22 ( .A(n56), .Y(n17) );
  CLKINVX40M U23 ( .A(n17), .Y(ALU_OUT[0]) );
  CLKINVX1M U24 ( .A(n55), .Y(n19) );
  CLKINVX40M U25 ( .A(n19), .Y(ALU_OUT[1]) );
  CLKINVX1M U26 ( .A(n54), .Y(n21) );
  CLKINVX40M U27 ( .A(n21), .Y(ALU_OUT[2]) );
  CLKINVX1M U28 ( .A(n53), .Y(n23) );
  CLKINVX40M U29 ( .A(n23), .Y(ALU_OUT[3]) );
  CLKINVX1M U30 ( .A(n52), .Y(n25) );
  CLKINVX40M U31 ( .A(n25), .Y(ALU_OUT[4]) );
  CLKINVX1M U32 ( .A(n51), .Y(n27) );
  CLKINVX40M U33 ( .A(n27), .Y(ALU_OUT[5]) );
  CLKINVX1M U34 ( .A(n50), .Y(n29) );
  CLKINVX40M U35 ( .A(n29), .Y(ALU_OUT[6]) );
  CLKINVX1M U36 ( .A(n49), .Y(n31) );
  CLKINVX40M U37 ( .A(n31), .Y(ALU_OUT[7]) );
  CLKINVX1M U38 ( .A(n48), .Y(n33) );
  CLKINVX40M U39 ( .A(n33), .Y(ALU_VLD) );
endmodule

