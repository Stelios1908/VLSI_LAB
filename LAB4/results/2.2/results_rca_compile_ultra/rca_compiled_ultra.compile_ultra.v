/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 13:35:12 2023
/////////////////////////////////////////////////////////////


module rca ( clk, rst, a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  input clk, rst;
  wire   \temp_c[4] , \rega_regb_fas[0].fa/N0 , n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32;
  wire   [3:0] temp_sum;

  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[0].reg_a/Q_reg  ( .D(a_i[0]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n22) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[3].reg_b/Q_reg  ( .D(b_i[3]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n21) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[3].reg_a/Q_reg  ( .D(a_i[3]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n20) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[2].reg_b/Q_reg  ( .D(b_i[2]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n19) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[2].reg_a/Q_reg  ( .D(a_i[2]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n18) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[1].reg_b/Q_reg  ( .D(b_i[1]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n17) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[1].reg_a/Q_reg  ( .D(a_i[1]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n16) );
  ASYNC_DFFHx1_ASAP7_75t_R \rega_regb_fas[0].reg_b/Q_reg  ( .D(b_i[0]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n15) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum[0].reg_sum/Q_reg  ( .D(
        \rega_regb_fas[0].fa/N0 ), .CLK(clk), .RESET(n10), .SET(rst), .QN(n14)
         );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum[4].reg_sum/Q_reg  ( .D(\temp_c[4] ), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n13) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum[3].reg_sum/Q_reg  ( .D(temp_sum[3]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n12) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum[2].reg_sum/Q_reg  ( .D(temp_sum[2]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n11) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_sum[1].reg_sum/Q_reg  ( .D(temp_sum[1]), .CLK(
        clk), .RESET(n10), .SET(rst), .QN(n9) );
  AOI21xp5_ASAP7_75t_R U21 ( .A1(n28), .A2(n24), .B(n23), .Y(n27) );
  NOR2xp33_ASAP7_75t_R U22 ( .A(n22), .B(n15), .Y(n28) );
  AOI21xp33_ASAP7_75t_R U23 ( .A1(n15), .A2(n22), .B(n28), .Y(
        \rega_regb_fas[0].fa/N0 ) );
  XOR2xp5_ASAP7_75t_R U24 ( .A(n30), .B(n20), .Y(n25) );
  XNOR2xp5_ASAP7_75t_R U25 ( .A(n25), .B(n32), .Y(temp_sum[3]) );
  TIELOx1_ASAP7_75t_R U26 ( .L(n10) );
  INVxp33_ASAP7_75t_R U27 ( .A(n21), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U28 ( .A(n17), .B(n16), .Y(n24) );
  NOR2xp33_ASAP7_75t_R U29 ( .A(n17), .B(n16), .Y(n23) );
  MAJIxp5_ASAP7_75t_R U30 ( .A(n27), .B(n19), .C(n18), .Y(n32) );
  INVxp33_ASAP7_75t_R U31 ( .A(n14), .Y(sum_o[0]) );
  INVxp33_ASAP7_75t_R U32 ( .A(n12), .Y(sum_o[3]) );
  INVxp33_ASAP7_75t_R U33 ( .A(n11), .Y(sum_o[2]) );
  INVxp33_ASAP7_75t_R U34 ( .A(n9), .Y(sum_o[1]) );
  INVxp33_ASAP7_75t_R U35 ( .A(n13), .Y(sum_o[4]) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n18), .B(n19), .Y(n26) );
  XOR2xp5_ASAP7_75t_R U37 ( .A(n27), .B(n26), .Y(temp_sum[2]) );
  INVxp33_ASAP7_75t_R U38 ( .A(n28), .Y(n29) );
  FAx1_ASAP7_75t_R U39 ( .A(n17), .B(n29), .CI(n16), .SN(temp_sum[1]) );
  INVxp33_ASAP7_75t_R U40 ( .A(n20), .Y(n31) );
  MAJx2_ASAP7_75t_R U41 ( .A(n32), .B(n31), .C(n30), .Y(\temp_c[4] ) );
endmodule

