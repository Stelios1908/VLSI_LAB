/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 14:04:30 2023
/////////////////////////////////////////////////////////////


module shift_reg_width4_0 ( clk, rst, pl, enable, si, pi, so );
  input [3:0] pi;
  input clk, rst, pl, enable, si;
  output so;
  wire   n14, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [3:1] ff;

  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[1]  ( .D(n13), .CLK(clk), .RESET(n10), 
        .SET(n1), .QN(ff[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[2]  ( .D(n12), .CLK(clk), .RESET(n10), 
        .SET(n1), .QN(ff[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[3]  ( .D(n11), .CLK(clk), .RESET(n10), 
        .SET(n1), .QN(ff[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[0]  ( .D(n14), .CLK(clk), .RESET(n10), 
        .SET(n1), .QN(so) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  INVx1_ASAP7_75t_R U4 ( .A(enable), .Y(n9) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(pl), .B(n9), .Y(n4) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(pl), .B(n9), .Y(n2) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(pl), .B(n9), .Y(n3) );
  NOR2xp33_ASAP7_75t_R U8 ( .A(pl), .B(n4), .Y(n7) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(pl), .B(n4), .Y(n8) );
  INVx1_ASAP7_75t_R U10 ( .A(rst), .Y(n10) );
  INVxp33_ASAP7_75t_R U11 ( .A(so), .Y(n5) );
  INVx1_ASAP7_75t_R U12 ( .A(n5), .Y(n6) );
  AOI222xp33_ASAP7_75t_R U13 ( .A1(pi[3]), .A2(pl), .B1(ff[3]), .B2(n8), .C1(
        si), .C2(n3), .Y(n11) );
  AOI222xp33_ASAP7_75t_R U14 ( .A1(pi[2]), .A2(pl), .B1(ff[2]), .B2(n7), .C1(
        ff[3]), .C2(n3), .Y(n12) );
  AOI222xp33_ASAP7_75t_R U15 ( .A1(n8), .A2(ff[1]), .B1(pi[1]), .B2(pl), .C1(
        ff[2]), .C2(n2), .Y(n13) );
  AOI222xp33_ASAP7_75t_R U16 ( .A1(ff[1]), .A2(n2), .B1(pi[0]), .B2(pl), .C1(
        n6), .C2(n7), .Y(n14) );
endmodule


module shift_reg_width4_4 ( clk, rst, pl, enable, si, pi, so );
  input [3:0] pi;
  input clk, rst, pl, enable, si;
  output so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [3:1] ff;

  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[1]  ( .D(n11), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[2]  ( .D(n10), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[3]  ( .D(n9), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[0]  ( .D(n12), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(so) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  NOR2xp33_ASAP7_75t_R U4 ( .A(pl), .B(n6), .Y(n2) );
  NOR2x1_ASAP7_75t_R U5 ( .A(pl), .B(n7), .Y(n6) );
  NOR2xp33_ASAP7_75t_R U6 ( .A(pl), .B(n6), .Y(n3) );
  INVx1_ASAP7_75t_R U7 ( .A(enable), .Y(n7) );
  INVx1_ASAP7_75t_R U8 ( .A(rst), .Y(n8) );
  INVxp33_ASAP7_75t_R U9 ( .A(so), .Y(n4) );
  INVx1_ASAP7_75t_R U10 ( .A(n4), .Y(n5) );
  AOI222xp33_ASAP7_75t_R U11 ( .A1(pi[3]), .A2(pl), .B1(ff[3]), .B2(n2), .C1(
        si), .C2(n6), .Y(n9) );
  AOI222xp33_ASAP7_75t_R U12 ( .A1(pi[2]), .A2(pl), .B1(ff[2]), .B2(n3), .C1(
        ff[3]), .C2(n6), .Y(n10) );
  AOI222xp33_ASAP7_75t_R U13 ( .A1(n2), .A2(ff[1]), .B1(pi[1]), .B2(pl), .C1(
        ff[2]), .C2(n6), .Y(n11) );
  AOI222xp33_ASAP7_75t_R U14 ( .A1(ff[1]), .A2(n6), .B1(pi[0]), .B2(pl), .C1(
        n5), .C2(n3), .Y(n12) );
endmodule


module shift_reg_width4_3 ( clk, rst, pl, enable, si, pi, so );
  input [3:0] pi;
  input clk, rst, pl, enable, si;
  output so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16;
  wire   [3:1] ff;

  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[3]  ( .D(n12), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[2]  ( .D(n13), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[0]  ( .D(n16), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(so) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[1]  ( .D(n15), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[1]) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  NOR2x1_ASAP7_75t_R U4 ( .A(pl), .B(n9), .Y(n4) );
  INVx1_ASAP7_75t_R U5 ( .A(enable), .Y(n9) );
  INVxp33_ASAP7_75t_R U6 ( .A(so), .Y(n2) );
  INVx1_ASAP7_75t_R U7 ( .A(n2), .Y(n3) );
  INVx2_ASAP7_75t_R U8 ( .A(n7), .Y(n8) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n8), .B(n4), .Y(n6) );
  INVx1_ASAP7_75t_R U10 ( .A(rst), .Y(n11) );
  NOR2x1_ASAP7_75t_R U11 ( .A(n8), .B(n4), .Y(n5) );
  INVxp67_ASAP7_75t_R U12 ( .A(pl), .Y(n7) );
  AND2x2_ASAP7_75t_R U13 ( .A(pi[0]), .B(n8), .Y(n10) );
  AOI221xp5_ASAP7_75t_R U14 ( .A1(ff[1]), .A2(n4), .B1(n3), .B2(n6), .C(n10), 
        .Y(n16) );
  AOI222xp33_ASAP7_75t_R U15 ( .A1(pi[3]), .A2(n8), .B1(ff[3]), .B2(n5), .C1(
        si), .C2(n4), .Y(n12) );
  AOI222xp33_ASAP7_75t_R U16 ( .A1(pi[2]), .A2(n8), .B1(ff[2]), .B2(n5), .C1(
        ff[3]), .C2(n4), .Y(n13) );
  AOI222xp33_ASAP7_75t_R U17 ( .A1(n6), .A2(ff[1]), .B1(pi[1]), .B2(n8), .C1(
        ff[2]), .C2(n4), .Y(n15) );
endmodule


module shift_reg_width4_2 ( clk, rst, pl, enable, si, pi, so );
  input [3:0] pi;
  input clk, rst, pl, enable, si;
  output so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [3:1] ff;

  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[0]  ( .D(n12), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(so) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[1]  ( .D(n11), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[3]  ( .D(n9), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[2]  ( .D(n10), .CLK(clk), .RESET(n8), .SET(
        n1), .QN(ff[2]) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  INVx1_ASAP7_75t_R U4 ( .A(enable), .Y(n6) );
  NOR2x1_ASAP7_75t_R U5 ( .A(pl), .B(n3), .Y(n2) );
  NOR2x1_ASAP7_75t_R U6 ( .A(pl), .B(n6), .Y(n3) );
  INVx1_ASAP7_75t_R U7 ( .A(rst), .Y(n8) );
  INVxp33_ASAP7_75t_R U8 ( .A(pl), .Y(n4) );
  INVx1_ASAP7_75t_R U9 ( .A(n4), .Y(n5) );
  AND2x2_ASAP7_75t_R U10 ( .A(pi[0]), .B(n5), .Y(n7) );
  AOI221xp5_ASAP7_75t_R U11 ( .A1(ff[1]), .A2(n3), .B1(so), .B2(n2), .C(n7), 
        .Y(n12) );
  AOI222xp33_ASAP7_75t_R U12 ( .A1(pi[3]), .A2(n5), .B1(ff[3]), .B2(n2), .C1(
        si), .C2(n3), .Y(n9) );
  AOI222xp33_ASAP7_75t_R U13 ( .A1(pi[2]), .A2(n5), .B1(ff[2]), .B2(n2), .C1(
        ff[3]), .C2(n3), .Y(n10) );
  AOI222xp33_ASAP7_75t_R U14 ( .A1(n2), .A2(ff[1]), .B1(pi[1]), .B2(n5), .C1(
        ff[2]), .C2(n3), .Y(n11) );
endmodule


module shift_reg_width4_1 ( clk, rst, pl, enable, si, pi, so );
  input [3:0] pi;
  input clk, rst, pl, enable, si;
  output so;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16;
  wire   [3:1] ff;

  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[3]  ( .D(n12), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[2]  ( .D(n13), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[1]  ( .D(n15), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(ff[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \ff_reg[0]  ( .D(n16), .CLK(clk), .RESET(n11), 
        .SET(n1), .QN(so) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  NOR2x1_ASAP7_75t_R U4 ( .A(pl), .B(n9), .Y(n6) );
  INVx1_ASAP7_75t_R U5 ( .A(enable), .Y(n9) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(n5), .B(ff[1]), .Y(n2) );
  NAND2xp33_ASAP7_75t_R U7 ( .A(pi[1]), .B(n8), .Y(n3) );
  NAND2xp33_ASAP7_75t_R U8 ( .A(ff[2]), .B(n6), .Y(n4) );
  AND3x1_ASAP7_75t_R U9 ( .A(n2), .B(n3), .C(n4), .Y(n15) );
  NOR2xp67_ASAP7_75t_R U10 ( .A(pl), .B(n6), .Y(n5) );
  INVxp67_ASAP7_75t_R U11 ( .A(n7), .Y(n8) );
  INVx1_ASAP7_75t_R U12 ( .A(rst), .Y(n11) );
  INVxp33_ASAP7_75t_R U13 ( .A(pl), .Y(n7) );
  AND2x2_ASAP7_75t_R U14 ( .A(pi[0]), .B(n8), .Y(n10) );
  AOI221xp5_ASAP7_75t_R U15 ( .A1(ff[1]), .A2(n6), .B1(so), .B2(n5), .C(n10), 
        .Y(n16) );
  AOI222xp33_ASAP7_75t_R U16 ( .A1(pi[3]), .A2(n8), .B1(ff[3]), .B2(n5), .C1(
        si), .C2(n6), .Y(n12) );
  AOI222xp33_ASAP7_75t_R U17 ( .A1(pi[2]), .A2(n8), .B1(ff[2]), .B2(n5), .C1(
        ff[3]), .C2(n6), .Y(n13) );
endmodule


module accumulator_DW01_add_1 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;

  INVx2_ASAP7_75t_R U2 ( .A(B[4]), .Y(n30) );
  NOR2xp67_ASAP7_75t_R U3 ( .A(n32), .B(n7), .Y(n9) );
  NAND2x1_ASAP7_75t_R U4 ( .A(n39), .B(n40), .Y(n18) );
  INVx2_ASAP7_75t_R U5 ( .A(B[3]), .Y(n38) );
  NAND2x1p5_ASAP7_75t_R U6 ( .A(n38), .B(n37), .Y(n29) );
  INVxp33_ASAP7_75t_R U7 ( .A(n28), .Y(n43) );
  NAND2xp5_ASAP7_75t_R U8 ( .A(n37), .B(n38), .Y(n23) );
  NAND2xp5_ASAP7_75t_R U9 ( .A(n49), .B(n50), .Y(n28) );
  INVx1_ASAP7_75t_R U10 ( .A(A[3]), .Y(n37) );
  INVx1_ASAP7_75t_R U11 ( .A(A[6]), .Y(n8) );
  XOR2xp5_ASAP7_75t_R U12 ( .A(n2), .B(A[4]), .Y(n34) );
  AND3x1_ASAP7_75t_R U13 ( .A(n23), .B(n22), .C(A[5]), .Y(n17) );
  INVxp33_ASAP7_75t_R U14 ( .A(n29), .Y(n42) );
  INVxp67_ASAP7_75t_R U15 ( .A(n20), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U16 ( .A(B[2]), .B(A[2]), .Y(n40) );
  INVx1_ASAP7_75t_R U17 ( .A(B[2]), .Y(n49) );
  INVx1_ASAP7_75t_R U18 ( .A(A[2]), .Y(n50) );
  NOR2xp33_ASAP7_75t_R U19 ( .A(n32), .B(n7), .Y(n1) );
  INVx1_ASAP7_75t_R U20 ( .A(n30), .Y(n2) );
  INVxp33_ASAP7_75t_R U21 ( .A(n47), .Y(n3) );
  INVxp33_ASAP7_75t_R U22 ( .A(n46), .Y(n4) );
  INVxp67_ASAP7_75t_R U23 ( .A(n24), .Y(n5) );
  INVx1_ASAP7_75t_R U24 ( .A(n5), .Y(n6) );
  NAND2x1p5_ASAP7_75t_R U25 ( .A(n31), .B(n30), .Y(n22) );
  OAI21xp5_ASAP7_75t_R U26 ( .A1(n1), .A2(n15), .B(n16), .Y(n14) );
  NAND2xp33_ASAP7_75t_R U27 ( .A(B[4]), .B(A[4]), .Y(n20) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(B[3]), .B(A[3]), .Y(n39) );
  AOI21xp5_ASAP7_75t_R U29 ( .A1(n17), .A2(n18), .B(n19), .Y(n16) );
  AOI31xp33_ASAP7_75t_R U30 ( .A1(n23), .A2(n22), .A3(n18), .B(n27), .Y(n26)
         );
  AND2x2_ASAP7_75t_R U31 ( .A(n45), .B(n44), .Y(n7) );
  NOR2xp67_ASAP7_75t_R U32 ( .A(n47), .B(n46), .Y(n44) );
  XNOR2xp5_ASAP7_75t_R U33 ( .A(n8), .B(n14), .Y(SUM[6]) );
  OAI21xp33_ASAP7_75t_R U34 ( .A1(n43), .A2(n9), .B(n40), .Y(n11) );
  NOR2xp33_ASAP7_75t_R U35 ( .A(n32), .B(n7), .Y(n10) );
  OAI21xp33_ASAP7_75t_R U36 ( .A1(n9), .A2(n35), .B(n36), .Y(n33) );
  NOR2xp33_ASAP7_75t_R U37 ( .A(n41), .B(n42), .Y(n12) );
  XOR2xp5_ASAP7_75t_R U38 ( .A(n11), .B(n12), .Y(SUM[3]) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(n21), .B(n20), .Y(n19) );
  XNOR2xp5_ASAP7_75t_R U40 ( .A(n13), .B(n10), .Y(SUM[2]) );
  INVx1_ASAP7_75t_R U41 ( .A(A[0]), .Y(n47) );
  NAND2xp5_ASAP7_75t_R U42 ( .A(n54), .B(n55), .Y(n45) );
  NAND2xp33_ASAP7_75t_R U43 ( .A(n18), .B(n23), .Y(n36) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n51), .B(n52), .Y(SUM[1]) );
  XOR2xp5_ASAP7_75t_R U45 ( .A(n33), .B(n34), .Y(SUM[4]) );
  AND2x2_ASAP7_75t_R U46 ( .A(n28), .B(n40), .Y(n13) );
  NAND2xp33_ASAP7_75t_R U47 ( .A(n28), .B(n29), .Y(n35) );
  INVx1_ASAP7_75t_R U48 ( .A(n56), .Y(SUM[0]) );
  INVx1_ASAP7_75t_R U49 ( .A(A[5]), .Y(n21) );
  INVx1_ASAP7_75t_R U50 ( .A(B[0]), .Y(n46) );
  INVxp67_ASAP7_75t_R U51 ( .A(B[1]), .Y(n54) );
  NAND2xp33_ASAP7_75t_R U52 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2xp33_ASAP7_75t_R U53 ( .A(B[0]), .B(n3), .Y(n53) );
  INVx1_ASAP7_75t_R U54 ( .A(n48), .Y(n32) );
  INVx1_ASAP7_75t_R U55 ( .A(n39), .Y(n41) );
  INVx1_ASAP7_75t_R U56 ( .A(n53), .Y(n52) );
  OR2x2_ASAP7_75t_R U57 ( .A(n24), .B(n21), .Y(n15) );
  INVxp67_ASAP7_75t_R U58 ( .A(A[1]), .Y(n55) );
  NAND2xp33_ASAP7_75t_R U59 ( .A(n45), .B(n48), .Y(n51) );
  OAI21xp33_ASAP7_75t_R U60 ( .A1(A[0]), .A2(n4), .B(n53), .Y(n56) );
  XOR2xp5_ASAP7_75t_R U61 ( .A(A[5]), .B(n25), .Y(SUM[5]) );
  OAI21xp5_ASAP7_75t_R U62 ( .A1(n1), .A2(n6), .B(n26), .Y(n25) );
  INVx2_ASAP7_75t_R U63 ( .A(A[4]), .Y(n31) );
  NAND3x1_ASAP7_75t_R U64 ( .A(n28), .B(n29), .C(n22), .Y(n24) );
endmodule


module accumulator ( clk, rstn, pl, enable, din, ready, sum );
  input [19:0] din;
  output [6:0] sum;
  input clk, rstn, pl, enable;
  output ready;
  wire   n1, N25, N26, N27, N28, N29, N30, N31, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;
  wire   [2:0] reg_cnt;
  wire   [4:0] out_of_reg;

  shift_reg_width4_0 \genShiftReg[0].sr  ( .clk(clk), .rst(rstn), .pl(n38), 
        .enable(enable), .si(n1), .pi(din[3:0]), .so(out_of_reg[0]) );
  shift_reg_width4_4 \genShiftReg[1].sr  ( .clk(clk), .rst(rstn), .pl(n38), 
        .enable(enable), .si(n1), .pi(din[7:4]), .so(out_of_reg[1]) );
  shift_reg_width4_3 \genShiftReg[2].sr  ( .clk(clk), .rst(rstn), .pl(n38), 
        .enable(enable), .si(n1), .pi(din[11:8]), .so(out_of_reg[2]) );
  shift_reg_width4_2 \genShiftReg[3].sr  ( .clk(clk), .rst(rstn), .pl(n38), 
        .enable(enable), .si(n1), .pi(din[15:12]), .so(out_of_reg[3]) );
  shift_reg_width4_1 \genShiftReg[4].sr  ( .clk(clk), .rst(rstn), .pl(n38), 
        .enable(enable), .si(n1), .pi(din[19:16]), .so(out_of_reg[4]) );
  accumulator_DW01_add_1 add_68 ( .A(sum), .B({n1, n1, out_of_reg}), .CI(n1), 
        .SUM({N31, N30, N29, N28, N27, N26, N25}) );
  ASYNC_DFFHx1_ASAP7_75t_R ready_reg ( .D(n54), .CLK(clk), .RESET(n1), .SET(
        n46), .QN(ready) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_cnt_reg[0]  ( .D(n57), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(reg_cnt[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_cnt_reg[2]  ( .D(n56), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(reg_cnt[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[2]  ( .D(n51), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_cnt_reg[1]  ( .D(n55), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(reg_cnt[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[1]  ( .D(n52), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[0]  ( .D(n53), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[4]  ( .D(n49), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[3]  ( .D(n50), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[6]  ( .D(n47), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[6]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum_reg[5]  ( .D(n48), .CLK(clk), .RESET(n46), 
        .SET(n1), .QN(sum[5]) );
  TIELOx1_ASAP7_75t_R U46 ( .L(n1) );
  INVxp67_ASAP7_75t_R U47 ( .A(n38), .Y(n45) );
  AND2x4_ASAP7_75t_R U48 ( .A(pl), .B(ready), .Y(n38) );
  NAND2xp5_ASAP7_75t_R U49 ( .A(N30), .B(n45), .Y(n48) );
  XNOR2xp5_ASAP7_75t_R U50 ( .A(reg_cnt[1]), .B(reg_cnt[0]), .Y(n40) );
  OR2x2_ASAP7_75t_R U51 ( .A(reg_cnt[2]), .B(reg_cnt[1]), .Y(n41) );
  INVx1_ASAP7_75t_R U52 ( .A(n41), .Y(n39) );
  NOR2xp33_ASAP7_75t_R U53 ( .A(pl), .B(n42), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U54 ( .A(reg_cnt[0]), .B(n41), .Y(n44) );
  INVx1_ASAP7_75t_R U55 ( .A(rstn), .Y(n46) );
  O2A1O1Ixp33_ASAP7_75t_R U56 ( .A1(reg_cnt[0]), .A2(reg_cnt[1]), .B(
        reg_cnt[2]), .C(n38), .Y(n56) );
  NOR2xp33_ASAP7_75t_R U57 ( .A(n44), .B(n43), .Y(n54) );
  NAND2xp5_ASAP7_75t_R U58 ( .A(N29), .B(n45), .Y(n49) );
  NAND2xp5_ASAP7_75t_R U59 ( .A(N28), .B(n45), .Y(n50) );
  NAND2xp5_ASAP7_75t_R U60 ( .A(N27), .B(n45), .Y(n51) );
  NAND2xp33_ASAP7_75t_R U61 ( .A(N26), .B(n45), .Y(n52) );
  NAND2xp33_ASAP7_75t_R U62 ( .A(N25), .B(n45), .Y(n53) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(N31), .B(n45), .Y(n47) );
  NAND3xp33_ASAP7_75t_R U64 ( .A(n41), .B(n45), .C(n40), .Y(n55) );
  INVxp33_ASAP7_75t_R U65 ( .A(ready), .Y(n42) );
  OA21x2_ASAP7_75t_R U66 ( .A1(reg_cnt[0]), .A2(n39), .B(n45), .Y(n57) );
endmodule

