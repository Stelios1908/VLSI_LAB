/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 14:42:51 2023
/////////////////////////////////////////////////////////////


module VendingMachine ( clk, rst, c5, c10, NFC, beans, water, coffee, error );
  input [4:0] water;
  input clk, rst, c5, c10, NFC, beans;
  output coffee, error;
  wire   N29, N35, n1, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [1:0] state;
  wire   [1:0] nextstate;
  assign coffee = N29;
  assign error = N35;

  INVx1_ASAP7_75t_R U3 ( .A(nextstate[1]), .Y(n1) );
  INVx1_ASAP7_75t_R U5 ( .A(nextstate[0]), .Y(n3) );
  OAI32xp33_ASAP7_75t_R U19 ( .A1(n10), .A2(n11), .A3(n7), .B1(state[0]), .B2(
        n6), .Y(nextstate[1]) );
  OAI32xp33_ASAP7_75t_R U20 ( .A1(n6), .A2(state[0]), .A3(n12), .B1(n13), .B2(
        n11), .Y(nextstate[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(n1), .CLK(clk), .RESET(n8), 
        .SET(n15), .QN(state[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(n3), .CLK(clk), .RESET(n15), 
        .SET(n8), .QN(state[0]) );
  TIELOx1_ASAP7_75t_R U21 ( .L(n15) );
  NAND2xp5_ASAP7_75t_R U22 ( .A(n6), .B(n7), .Y(N35) );
  AOI221xp5_ASAP7_75t_R U23 ( .A1(c5), .A2(state[1]), .B1(state[0]), .B2(n9), 
        .C(n5), .Y(n13) );
  INVx1_ASAP7_75t_R U24 ( .A(N35), .Y(n5) );
  INVx1_ASAP7_75t_R U25 ( .A(c5), .Y(n9) );
  OAI31xp33_ASAP7_75t_R U26 ( .A1(n14), .A2(water[2]), .A3(water[1]), .B(beans), .Y(n11) );
  OR2x2_ASAP7_75t_R U27 ( .A(water[4]), .B(water[3]), .Y(n14) );
  NOR3xp33_ASAP7_75t_R U28 ( .A(c5), .B(c10), .C(NFC), .Y(n12) );
  INVx1_ASAP7_75t_R U29 ( .A(rst), .Y(n8) );
  INVxp67_ASAP7_75t_R U30 ( .A(state[1]), .Y(n6) );
  NOR2xp33_ASAP7_75t_R U31 ( .A(n7), .B(n6), .Y(N29) );
  INVx1_ASAP7_75t_R U32 ( .A(state[0]), .Y(n7) );
  OR2x2_ASAP7_75t_R U33 ( .A(n12), .B(state[1]), .Y(n10) );
endmodule

