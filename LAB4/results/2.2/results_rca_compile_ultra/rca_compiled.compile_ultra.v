/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 13:36:34 2023
/////////////////////////////////////////////////////////////


module pipline_rca ( clk, rst, a_ii, b_ii, sum_o );
  input [3:0] a_ii;
  input [3:0] b_ii;
  output [4:0] sum_o;
  input clk, rst;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n29, n31, n33, n35, n37, n38;
  wire   [1:0] \in1/temp_b ;
  wire   [1:0] \in1/temp_a ;
  wire   [1:0] \in2/temp_b ;
  wire   [1:0] \in2/temp_a ;
  assign \in1/temp_b  [1] = b_ii[1];
  assign \in1/temp_b  [0] = b_ii[0];
  assign \in1/temp_a  [1] = a_ii[1];
  assign \in1/temp_a  [0] = a_ii[0];
  assign \in2/temp_b  [1] = b_ii[3];
  assign \in2/temp_b  [0] = b_ii[2];
  assign \in2/temp_a  [1] = a_ii[3];
  assign \in2/temp_a  [0] = a_ii[2];

  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG8_S1 ( .D(n17), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n38) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG2_S1 ( .D(n16), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n37) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG3_S2 ( .D(n26), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(sum_o[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG9_S1 ( .D(n18), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n35) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG10_S2 ( .D(n25), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(sum_o[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG6_S1 ( .D(n24), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n33) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG7_S2 ( .D(n23), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(sum_o[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG4_S1 ( .D(n22), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n31) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG5_S2 ( .D(n21), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(sum_o[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG0_S1 ( .D(n20), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(n29) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG1_S2 ( .D(n19), .CLK(clk), .RESET(rst), 
        .SET(n27), .QN(sum_o[3]) );
  OAI21xp33_ASAP7_75t_R U17 ( .A1(\in1/temp_a [0]), .A2(\in1/temp_b [0]), .B(
        n15), .Y(n18) );
  TIELOx1_ASAP7_75t_R U18 ( .L(n27) );
  INVxp33_ASAP7_75t_R U19 ( .A(n37), .Y(n26) );
  INVxp33_ASAP7_75t_R U20 ( .A(n35), .Y(n25) );
  INVxp33_ASAP7_75t_R U21 ( .A(n33), .Y(n23) );
  INVxp33_ASAP7_75t_R U22 ( .A(n31), .Y(n21) );
  INVxp33_ASAP7_75t_R U23 ( .A(n29), .Y(n19) );
  NAND2xp33_ASAP7_75t_R U24 ( .A(\in1/temp_a [0]), .B(\in1/temp_b [0]), .Y(n15) );
  FAx1_ASAP7_75t_R U25 ( .A(\in1/temp_a [1]), .B(\in1/temp_b [1]), .CI(n15), 
        .SN(n8) );
  INVxp33_ASAP7_75t_R U26 ( .A(n8), .Y(n24) );
  INVxp33_ASAP7_75t_R U27 ( .A(\in2/temp_a [0]), .Y(n9) );
  FAx1_ASAP7_75t_R U28 ( .A(n38), .B(\in2/temp_b [0]), .CI(n9), .SN(n10) );
  INVxp33_ASAP7_75t_R U29 ( .A(n10), .Y(n22) );
  MAJIxp5_ASAP7_75t_R U30 ( .A(n38), .B(\in2/temp_b [0]), .C(\in2/temp_a [0]), 
        .Y(n12) );
  FAx1_ASAP7_75t_R U31 ( .A(\in2/temp_a [1]), .B(\in2/temp_b [1]), .CI(n12), 
        .SN(n11) );
  INVxp33_ASAP7_75t_R U32 ( .A(n11), .Y(n20) );
  INVxp33_ASAP7_75t_R U33 ( .A(n12), .Y(n13) );
  MAJIxp5_ASAP7_75t_R U34 ( .A(n13), .B(\in2/temp_a [1]), .C(\in2/temp_b [1]), 
        .Y(n16) );
  INVxp33_ASAP7_75t_R U35 ( .A(n15), .Y(n14) );
  MAJIxp5_ASAP7_75t_R U36 ( .A(\in1/temp_a [1]), .B(\in1/temp_b [1]), .C(n14), 
        .Y(n17) );
endmodule

