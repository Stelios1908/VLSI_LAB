/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 14:49:19 2023
/////////////////////////////////////////////////////////////


module VendingMachine ( clk, rst, c5, c10, NFC, beans, water, coffee, error );
  input [4:0] water;
  input clk, rst, c5, c10, NFC, beans;
  output coffee, error;
  wire   N29, N35, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [1:0] nextstate;
  assign coffee = N29;
  assign error = N35;

  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), 
        .RESET(n20), .SET(n22), .QN(n21) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), 
        .RESET(n22), .SET(n20), .QN(n19) );
  INVxp33_ASAP7_75t_R U19 ( .A(n19), .Y(n14) );
  OAI21xp33_ASAP7_75t_R U20 ( .A1(water[4]), .A2(n12), .B(beans), .Y(n17) );
  OAI22xp33_ASAP7_75t_R U21 ( .A1(n18), .A2(n15), .B1(n13), .B2(n17), .Y(
        nextstate[0]) );
  NAND2xp33_ASAP7_75t_R U22 ( .A(n14), .B(n21), .Y(n16) );
  INVxp33_ASAP7_75t_R U23 ( .A(n21), .Y(n11) );
  NAND2xp33_ASAP7_75t_R U24 ( .A(n11), .B(n19), .Y(n15) );
  NAND2xp33_ASAP7_75t_R U25 ( .A(n19), .B(n21), .Y(N35) );
  TIELOx1_ASAP7_75t_R U26 ( .L(n20) );
  INVxp33_ASAP7_75t_R U27 ( .A(rst), .Y(n22) );
  NOR3xp33_ASAP7_75t_R U28 ( .A(c5), .B(NFC), .C(c10), .Y(n18) );
  AO32x1_ASAP7_75t_R U29 ( .A1(n14), .A2(c5), .A3(n21), .B1(n19), .B2(n11), 
        .Y(n13) );
  OR3x1_ASAP7_75t_R U30 ( .A(water[3]), .B(water[2]), .C(water[1]), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U31 ( .A(n19), .B(n21), .Y(N29) );
  OAI31xp33_ASAP7_75t_R U32 ( .A1(n18), .A2(n17), .A3(n16), .B(n15), .Y(
        nextstate[1]) );
endmodule

