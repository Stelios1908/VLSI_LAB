/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 14:02:26 2023
/////////////////////////////////////////////////////////////


module accumulator ( clk, rstn, pl, enable, din, ready, sum );
  input [19:0] din;
  output [6:0] sum;
  input clk, rstn, pl, enable;
  output ready;
  wire   \add_x_4/n13 , \add_x_4/n12 , n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n109, n110, n111, n112,
         n113, n114, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127;

  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG14_S3 ( .D(sum[5]), .CLK(clk), .RESET(n126), .SET(n90), .QN(n127) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG13_S3 ( .D(sum[6]), .CLK(clk), .RESET(n126), .SET(n90), .QN(n125) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG15_S3 ( .D(\add_x_4/n13 ), .CLK(clk), 
        .RESET(n126), .SET(n90), .QN(n124) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG11_S3 ( .D(\add_x_4/n12 ), .CLK(clk), 
        .RESET(n126), .SET(n90), .QN(n123) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG29_S1 ( .D(n89), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n122) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG30_S1 ( .D(n88), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n121) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG32_S1 ( .D(n87), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n120) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG33_S1 ( .D(n86), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n119) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG35_S1 ( .D(n85), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n118) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG20_S1 ( .D(n84), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(sum[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG21_S1 ( .D(n83), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(sum[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG19_S1 ( .D(n82), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(sum[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG0_S1 ( .D(n80), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n114) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG9_S2 ( .D(n81), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n113) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG12_S3 ( .D(n60), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n112) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG5_S1 ( .D(n80), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n111) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG1_S1 ( .D(n61), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n110) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG3_S1 ( .D(n59), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n109) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG2_S2 ( .D(n79), .CLK(clk), .RESET(n90), 
        .SET(n126), .QN(ready) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG10_S2 ( .D(n78), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n107) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG4_S2 ( .D(n77), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n106) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG27_S1 ( .D(n76), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n105) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG28_S1 ( .D(n75), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n104) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG18_S1 ( .D(n74), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n103) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG31_S1 ( .D(n73), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n102) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG16_S1 ( .D(n72), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n101) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG17_S1 ( .D(n71), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n100) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG6_S1 ( .D(n70), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n99) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG7_S1 ( .D(n69), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n98) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG8_S1 ( .D(n68), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n97) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG34_S1 ( .D(n67), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n96) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG25_S1 ( .D(n66), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n95) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG26_S1 ( .D(n65), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n94) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG22_S1 ( .D(n64), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n93) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG23_S1 ( .D(n63), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n92) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG24_S1 ( .D(n62), .CLK(clk), .RESET(n126), 
        .SET(n90), .QN(n91) );
  INVx3_ASAP7_75t_R U46 ( .A(n40), .Y(n56) );
  INVx1_ASAP7_75t_R U47 ( .A(n10), .Y(n11) );
  INVxp33_ASAP7_75t_R U48 ( .A(enable), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U49 ( .A(n12), .B(n26), .Y(n41) );
  AND2x2_ASAP7_75t_R U50 ( .A(pl), .B(ready), .Y(n10) );
  OAI21xp33_ASAP7_75t_R U51 ( .A1(n42), .A2(n109), .B(n44), .Y(n43) );
  INVxp67_ASAP7_75t_R U52 ( .A(n41), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U53 ( .A(n100), .B(sum[4]), .Y(\add_x_4/n13 ) );
  INVxp67_ASAP7_75t_R U54 ( .A(n103), .Y(n14) );
  INVxp67_ASAP7_75t_R U55 ( .A(n118), .Y(n47) );
  AOI21xp5_ASAP7_75t_R U56 ( .A1(n107), .A2(n123), .B(n124), .Y(n28) );
  INVxp67_ASAP7_75t_R U57 ( .A(n120), .Y(n51) );
  INVx4_ASAP7_75t_R U58 ( .A(n39), .Y(n58) );
  AND2x4_ASAP7_75t_R U59 ( .A(n38), .B(n12), .Y(n39) );
  NOR2x1_ASAP7_75t_R U60 ( .A(n15), .B(n14), .Y(n36) );
  INVx3_ASAP7_75t_R U61 ( .A(n10), .Y(n12) );
  AOI21xp5_ASAP7_75t_R U62 ( .A1(n22), .A2(n21), .B(n20), .Y(n45) );
  NAND2xp33_ASAP7_75t_R U63 ( .A(n94), .B(sum[2]), .Y(n21) );
  INVxp33_ASAP7_75t_R U64 ( .A(sum[0]), .Y(n15) );
  AND2x2_ASAP7_75t_R U65 ( .A(sum[1]), .B(n91), .Y(n16) );
  INVxp33_ASAP7_75t_R U66 ( .A(n106), .Y(n44) );
  OAI21xp33_ASAP7_75t_R U67 ( .A1(n80), .A2(n27), .B(n41), .Y(n59) );
  INVxp33_ASAP7_75t_R U68 ( .A(n109), .Y(n27) );
  AO21x1_ASAP7_75t_R U69 ( .A1(sum[3]), .A2(n97), .B(n45), .Y(n46) );
  AOI21xp33_ASAP7_75t_R U70 ( .A1(ready), .A2(n12), .B(n26), .Y(n79) );
  INVxp33_ASAP7_75t_R U71 ( .A(n110), .Y(n31) );
  INVxp33_ASAP7_75t_R U72 ( .A(\add_x_4/n12 ), .Y(n30) );
  INVxp33_ASAP7_75t_R U73 ( .A(n33), .Y(n34) );
  INVxp33_ASAP7_75t_R U74 ( .A(n36), .Y(n35) );
  NAND2xp33_ASAP7_75t_R U75 ( .A(n12), .B(n19), .Y(n84) );
  INVxp33_ASAP7_75t_R U76 ( .A(n119), .Y(n49) );
  INVxp33_ASAP7_75t_R U77 ( .A(n121), .Y(n53) );
  INVxp33_ASAP7_75t_R U78 ( .A(n122), .Y(n55) );
  AND2x2_ASAP7_75t_R U79 ( .A(enable), .B(n12), .Y(n40) );
  OAI21xp5_ASAP7_75t_R U80 ( .A1(sum[3]), .A2(n97), .B(n46), .Y(n78) );
  TIELOx1_ASAP7_75t_R U81 ( .L(n90) );
  INVx1_ASAP7_75t_R U82 ( .A(rstn), .Y(n126) );
  INVx1_ASAP7_75t_R U83 ( .A(n11), .Y(n80) );
  XNOR2xp5_ASAP7_75t_R U84 ( .A(n107), .B(n112), .Y(n13) );
  AND2x2_ASAP7_75t_R U85 ( .A(n114), .B(n13), .Y(sum[4]) );
  NOR2xp33_ASAP7_75t_R U86 ( .A(n100), .B(sum[4]), .Y(\add_x_4/n12 ) );
  OR2x2_ASAP7_75t_R U87 ( .A(sum[1]), .B(n91), .Y(n17) );
  AOI21x1_ASAP7_75t_R U88 ( .A1(n17), .A2(n36), .B(n16), .Y(n22) );
  XNOR2xp5_ASAP7_75t_R U89 ( .A(n94), .B(sum[2]), .Y(n18) );
  XOR2xp5_ASAP7_75t_R U90 ( .A(n22), .B(n18), .Y(n19) );
  NOR3xp33_ASAP7_75t_R U91 ( .A(n110), .B(n109), .C(n106), .Y(n26) );
  AND2x2_ASAP7_75t_R U92 ( .A(n111), .B(n113), .Y(sum[3]) );
  XOR2xp5_ASAP7_75t_R U93 ( .A(sum[3]), .B(n97), .Y(n23) );
  NOR2xp33_ASAP7_75t_R U94 ( .A(n94), .B(sum[2]), .Y(n20) );
  XNOR2xp5_ASAP7_75t_R U95 ( .A(n23), .B(n45), .Y(n81) );
  NOR2xp33_ASAP7_75t_R U96 ( .A(n127), .B(n28), .Y(n24) );
  XNOR2xp5_ASAP7_75t_R U97 ( .A(n24), .B(n125), .Y(n25) );
  AND2x2_ASAP7_75t_R U98 ( .A(n111), .B(n25), .Y(sum[6]) );
  XOR2xp5_ASAP7_75t_R U99 ( .A(n127), .B(n28), .Y(n29) );
  AND2x2_ASAP7_75t_R U100 ( .A(n114), .B(n29), .Y(sum[5]) );
  AND2x2_ASAP7_75t_R U101 ( .A(\add_x_4/n13 ), .B(n30), .Y(n60) );
  NOR2xp33_ASAP7_75t_R U102 ( .A(n109), .B(n106), .Y(n32) );
  OA21x2_ASAP7_75t_R U103 ( .A1(n32), .A2(n31), .B(n11), .Y(n61) );
  NOR2xp33_ASAP7_75t_R U104 ( .A(n103), .B(sum[0]), .Y(n33) );
  NAND3xp33_ASAP7_75t_R U105 ( .A(n35), .B(n11), .C(n34), .Y(n82) );
  FAx1_ASAP7_75t_R U106 ( .A(sum[1]), .B(n91), .CI(n36), .SN(n37) );
  OR2x2_ASAP7_75t_R U107 ( .A(n37), .B(n80), .Y(n83) );
  OAI222xp33_ASAP7_75t_R U108 ( .A1(n11), .A2(din[4]), .B1(n58), .B2(n91), 
        .C1(n56), .C2(n92), .Y(n62) );
  OAI222xp33_ASAP7_75t_R U109 ( .A1(n56), .A2(n93), .B1(n58), .B2(n92), .C1(
        n11), .C2(din[5]), .Y(n63) );
  AOI222xp33_ASAP7_75t_R U110 ( .A1(n40), .A2(n118), .B1(n39), .B2(n93), .C1(
        n80), .C2(din[6]), .Y(n64) );
  OAI222xp33_ASAP7_75t_R U111 ( .A1(n11), .A2(din[8]), .B1(n58), .B2(n94), 
        .C1(n56), .C2(n95), .Y(n65) );
  AOI222xp33_ASAP7_75t_R U112 ( .A1(n40), .A2(n96), .B1(n39), .B2(n95), .C1(
        n80), .C2(din[9]), .Y(n66) );
  OAI222xp33_ASAP7_75t_R U113 ( .A1(n56), .A2(n119), .B1(n58), .B2(n96), .C1(
        n12), .C2(din[10]), .Y(n67) );
  AOI222xp33_ASAP7_75t_R U114 ( .A1(n97), .A2(n39), .B1(n40), .B2(n98), .C1(
        n80), .C2(din[12]), .Y(n68) );
  OAI222xp33_ASAP7_75t_R U115 ( .A1(n56), .A2(n99), .B1(n58), .B2(n98), .C1(
        n11), .C2(din[13]), .Y(n69) );
  AOI222xp33_ASAP7_75t_R U116 ( .A1(n40), .A2(n120), .B1(n39), .B2(n99), .C1(
        n80), .C2(din[14]), .Y(n70) );
  OAI222xp33_ASAP7_75t_R U117 ( .A1(n56), .A2(n101), .B1(n58), .B2(n100), .C1(
        n12), .C2(din[16]), .Y(n71) );
  AOI222xp33_ASAP7_75t_R U118 ( .A1(n40), .A2(n102), .B1(n39), .B2(n101), .C1(
        n80), .C2(din[17]), .Y(n72) );
  OAI222xp33_ASAP7_75t_R U119 ( .A1(n56), .A2(n121), .B1(n58), .B2(n102), .C1(
        n11), .C2(din[18]), .Y(n73) );
  AOI222xp33_ASAP7_75t_R U120 ( .A1(n103), .A2(n39), .B1(n40), .B2(n104), .C1(
        n80), .C2(din[0]), .Y(n74) );
  OAI222xp33_ASAP7_75t_R U121 ( .A1(n56), .A2(n105), .B1(n58), .B2(n104), .C1(
        n12), .C2(din[1]), .Y(n75) );
  OAI222xp33_ASAP7_75t_R U122 ( .A1(n56), .A2(n122), .B1(n58), .B2(n105), .C1(
        n12), .C2(din[2]), .Y(n76) );
  OAI211xp5_ASAP7_75t_R U123 ( .A1(n109), .A2(n44), .B(n43), .C(n12), .Y(n77)
         );
  NOR2xp33_ASAP7_75t_R U124 ( .A(n47), .B(n58), .Y(n48) );
  A2O1A1Ixp33_ASAP7_75t_R U125 ( .A1(din[7]), .A2(n58), .B(n48), .C(n56), .Y(
        n85) );
  NOR2xp33_ASAP7_75t_R U126 ( .A(n58), .B(n49), .Y(n50) );
  A2O1A1Ixp33_ASAP7_75t_R U127 ( .A1(din[11]), .A2(n58), .B(n50), .C(n56), .Y(
        n86) );
  NOR2xp33_ASAP7_75t_R U128 ( .A(n51), .B(n58), .Y(n52) );
  A2O1A1Ixp33_ASAP7_75t_R U129 ( .A1(din[15]), .A2(n58), .B(n52), .C(n56), .Y(
        n87) );
  NOR2xp33_ASAP7_75t_R U130 ( .A(n58), .B(n53), .Y(n54) );
  A2O1A1Ixp33_ASAP7_75t_R U131 ( .A1(din[19]), .A2(n58), .B(n54), .C(n56), .Y(
        n88) );
  NOR2xp33_ASAP7_75t_R U132 ( .A(n58), .B(n55), .Y(n57) );
  A2O1A1Ixp33_ASAP7_75t_R U133 ( .A1(din[3]), .A2(n58), .B(n57), .C(n56), .Y(
        n89) );
endmodule

