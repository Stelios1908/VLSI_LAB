/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue Sep  5 22:29:30 2023
/////////////////////////////////////////////////////////////


module myreg_0 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n1, n2;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n1), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n1) );
endmodule


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3;

  INVx1_ASAP7_75t_R U1 ( .A(cin), .Y(n2) );
  XNOR2xp5_ASAP7_75t_R U2 ( .A(b), .B(a), .Y(n3) );
  XNOR2xp5_ASAP7_75t_R U3 ( .A(cin), .B(n3), .Y(s) );
  NAND2xp5_ASAP7_75t_R U4 ( .A(b), .B(a), .Y(n1) );
  OAI21x1_ASAP7_75t_R U5 ( .A1(n3), .A2(n2), .B(n1), .Y(cout) );
endmodule


module myreg_1 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n3) );
endmodule


module myreg_2 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n3) );
endmodule


module myreg_3 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_4 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_5 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_6 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_7 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_8 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_9 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  INVx1_ASAP7_75t_R U3 ( .A(D), .Y(n3) );
  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n2) );
endmodule


module myreg_10 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n3) );
endmodule


module myreg_11 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n3) );
endmodule


module myreg_12 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   n2, n3;

  ASYNC_DFFHx1_ASAP7_75t_R Q_reg ( .D(n3), .CLK(clk), .RESET(rst), .SET(n2), 
        .QN(Q) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n2) );
  INVx1_ASAP7_75t_R U4 ( .A(D), .Y(n3) );
endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3;

  AOI22xp5_ASAP7_75t_R U1 ( .A1(n1), .A2(n2), .B1(n3), .B2(n2), .Y(cout) );
  NAND2xp5_ASAP7_75t_R U2 ( .A(b), .B(a), .Y(n2) );
  XNOR2xp5_ASAP7_75t_R U3 ( .A(b), .B(a), .Y(n3) );
  XNOR2xp5_ASAP7_75t_R U4 ( .A(n3), .B(cin), .Y(s) );
  INVx1_ASAP7_75t_R U5 ( .A(cin), .Y(n1) );
endmodule


module fulladder_2 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2, n3, n4, n5, n7;

  XOR2xp5_ASAP7_75t_R U1 ( .A(n2), .B(n7), .Y(s) );
  INVx1_ASAP7_75t_R U2 ( .A(n4), .Y(n2) );
  NAND2xp5_ASAP7_75t_R U3 ( .A(b), .B(a), .Y(n5) );
  INVx1_ASAP7_75t_R U4 ( .A(n3), .Y(n7) );
  XNOR2xp5_ASAP7_75t_R U5 ( .A(b), .B(a), .Y(n3) );
  INVx2_ASAP7_75t_R U6 ( .A(cin), .Y(n4) );
  AOI22x1_ASAP7_75t_R U7 ( .A1(n5), .A2(n4), .B1(n3), .B2(n5), .Y(cout) );
endmodule


module fulladder_3 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3, n4;

  INVx1_ASAP7_75t_R U1 ( .A(n3), .Y(n4) );
  XNOR2xp5_ASAP7_75t_R U2 ( .A(b), .B(a), .Y(n3) );
  NAND2xp5_ASAP7_75t_R U3 ( .A(b), .B(a), .Y(n2) );
  INVx2_ASAP7_75t_R U4 ( .A(cin), .Y(n1) );
  AOI22x1_ASAP7_75t_R U5 ( .A1(n2), .A2(n1), .B1(n3), .B2(n2), .Y(cout) );
  XOR2x2_ASAP7_75t_R U6 ( .A(cin), .B(n4), .Y(s) );
endmodule


module rca_fresh ( clk, rst, a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  input clk, rst;
  wire   \*Logic0* ;
  wire   [4:1] temp_c;
  wire   [3:0] temp_a;
  wire   [3:0] temp_b;
  wire   [3:0] temp_sum;

  myreg_0 \rega_regb_fas[0].reg_a  ( .rst(rst), .clk(clk), .D(a_i[0]), .Q(
        temp_a[0]) );
  myreg_12 \rega_regb_fas[0].reg_b  ( .rst(rst), .clk(clk), .D(b_i[0]), .Q(
        temp_b[0]) );
  fulladder_0 \rega_regb_fas[0].fa  ( .a(temp_a[0]), .b(temp_b[0]), .cin(
        \*Logic0* ), .s(temp_sum[0]), .cout(temp_c[1]) );
  myreg_11 \rega_regb_fas[1].reg_a  ( .rst(rst), .clk(clk), .D(a_i[1]), .Q(
        temp_a[1]) );
  myreg_10 \rega_regb_fas[1].reg_b  ( .rst(rst), .clk(clk), .D(b_i[1]), .Q(
        temp_b[1]) );
  fulladder_3 \rega_regb_fas[1].fa  ( .a(temp_a[1]), .b(temp_b[1]), .cin(
        temp_c[1]), .s(temp_sum[1]), .cout(temp_c[2]) );
  myreg_9 \rega_regb_fas[2].reg_a  ( .rst(rst), .clk(clk), .D(a_i[2]), .Q(
        temp_a[2]) );
  myreg_8 \rega_regb_fas[2].reg_b  ( .rst(rst), .clk(clk), .D(b_i[2]), .Q(
        temp_b[2]) );
  fulladder_2 \rega_regb_fas[2].fa  ( .a(temp_a[2]), .b(temp_b[2]), .cin(
        temp_c[2]), .s(temp_sum[2]), .cout(temp_c[3]) );
  myreg_7 \rega_regb_fas[3].reg_a  ( .rst(rst), .clk(clk), .D(a_i[3]), .Q(
        temp_a[3]) );
  myreg_6 \rega_regb_fas[3].reg_b  ( .rst(rst), .clk(clk), .D(b_i[3]), .Q(
        temp_b[3]) );
  fulladder_1 \rega_regb_fas[3].fa  ( .a(temp_a[3]), .b(temp_b[3]), .cin(
        temp_c[3]), .s(temp_sum[3]), .cout(temp_c[4]) );
  myreg_5 \reg_sum[0].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[0]), .Q(
        sum_o[0]) );
  myreg_4 \reg_sum[1].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[1]), .Q(
        sum_o[1]) );
  myreg_3 \reg_sum[2].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[2]), .Q(
        sum_o[2]) );
  myreg_2 \reg_sum[3].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[3]), .Q(
        sum_o[3]) );
  myreg_1 \reg_sum[4].reg_sum  ( .rst(rst), .clk(clk), .D(temp_c[4]), .Q(
        sum_o[4]) );
  TIELOx1_ASAP7_75t_R U2 ( .L(\*Logic0* ) );
endmodule

