/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Sep  9 13:42:18 2023
/////////////////////////////////////////////////////////////


module myreg_0 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_13 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1;

  AO22x1_ASAP7_75t_R U1 ( .A1(b), .A2(a), .B1(n1), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(cin), .B(n1), .Y(s) );
endmodule


module myreg_12 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_11 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module fulladder_3 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n2) );
  AO22x1_ASAP7_75t_R U3 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
endmodule


module myreg_10 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_9 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_8 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module rca_width2_0 ( clk, rst, a_i, b_i, cin, sum_o );
  input [1:0] a_i;
  input [1:0] b_i;
  output [2:0] sum_o;
  input clk, rst, cin;

  wire   [2:1] temp_c;
  wire   [1:0] temp_a;
  wire   [1:0] temp_b;
  wire   [1:0] temp_sum;

  myreg_0 \regfa[0].reg_a  ( .rst(rst), .clk(clk), .D(a_i[0]), .Q(temp_a[0])
         );
  myreg_13 \regfa[0].reg_b  ( .rst(rst), .clk(clk), .D(b_i[0]), .Q(temp_b[0])
         );
  fulladder_0 \regfa[0].fa  ( .a(temp_a[0]), .b(temp_b[0]), .cin(cin), .s(
        temp_sum[0]), .cout(temp_c[1]) );
  myreg_12 \regfa[1].reg_a  ( .rst(rst), .clk(clk), .D(a_i[1]), .Q(temp_a[1])
         );
  myreg_11 \regfa[1].reg_b  ( .rst(rst), .clk(clk), .D(b_i[1]), .Q(temp_b[1])
         );
  fulladder_3 \regfa[1].fa  ( .a(temp_a[1]), .b(temp_b[1]), .cin(temp_c[1]), 
        .s(temp_sum[1]), .cout(temp_c[2]) );
  myreg_10 \reg_sum[0].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[0]), .Q(
        sum_o[0]) );
  myreg_9 \reg_sum[1].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[1]), .Q(
        sum_o[1]) );
  myreg_8 \reg_sum[2].reg_sum  ( .rst(rst), .clk(clk), .D(temp_c[2]), .Q(
        sum_o[2]) );
endmodule


module myreg_7 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_6 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module fulladder_2 ( a, b, cin, s, cout, rst, clk );
  input a, b, cin, rst, clk;
  output s, cout;
  wire   n2, n3, n4, n7;

  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG6_S1 ( .D(n2), .CLK(clk), .RESET(rst), 
        .SET(n3), .QN(n4) );
  AO22x1_ASAP7_75t_R U1 ( .A1(b), .A2(a), .B1(n7), .B2(n4), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(n4), .B(n7), .Y(s) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(a), .B(b), .Y(n7) );
  TIELOx1_ASAP7_75t_R U4 ( .L(n3) );
  INVx1_ASAP7_75t_R U5 ( .A(cin), .Y(n2) );
endmodule


module myreg_5 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_4 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  AO22x1_ASAP7_75t_R U2 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(a), .B(b), .Y(n2) );
endmodule


module myreg_3 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_2 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module myreg_1 ( rst, clk, D, Q );
  input rst, clk, D;
  output Q;
  wire   D;
  assign Q = D;

endmodule


module rca_width2_1 ( clk, rst, a_i, b_i, cin, sum_o );
  input [1:0] a_i;
  input [1:0] b_i;
  output [2:0] sum_o;
  input clk, rst, cin;

  wire   [2:1] temp_c;
  wire   [1:0] temp_a;
  wire   [1:0] temp_b;
  wire   [1:0] temp_sum;

  myreg_7 \regfa[0].reg_a  ( .rst(rst), .clk(clk), .D(a_i[0]), .Q(temp_a[0])
         );
  myreg_6 \regfa[0].reg_b  ( .rst(rst), .clk(clk), .D(b_i[0]), .Q(temp_b[0])
         );
  fulladder_2 \regfa[0].fa  ( .a(temp_a[0]), .b(temp_b[0]), .cin(cin), .s(
        temp_sum[0]), .cout(temp_c[1]), .rst(rst), .clk(clk) );
  myreg_5 \regfa[1].reg_a  ( .rst(rst), .clk(clk), .D(a_i[1]), .Q(temp_a[1])
         );
  myreg_4 \regfa[1].reg_b  ( .rst(rst), .clk(clk), .D(b_i[1]), .Q(temp_b[1])
         );
  fulladder_1 \regfa[1].fa  ( .a(temp_a[1]), .b(temp_b[1]), .cin(temp_c[1]), 
        .s(temp_sum[1]), .cout(temp_c[2]) );
  myreg_3 \reg_sum[0].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[0]), .Q(
        sum_o[0]) );
  myreg_2 \reg_sum[1].reg_sum  ( .rst(rst), .clk(clk), .D(temp_sum[1]), .Q(
        sum_o[1]) );
  myreg_1 \reg_sum[2].reg_sum  ( .rst(rst), .clk(clk), .D(temp_c[2]), .Q(
        sum_o[2]) );
endmodule


module pipline_rca ( clk, rst, a_ii, b_ii, sum_o );
  input [3:0] a_ii;
  input [3:0] b_ii;
  output [4:0] sum_o;
  input clk, rst;
  wire   net294, n21, n22, n23, n24, n25, coutFromFirstRca, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n12, n14, n16, n18, n20;

  rca_width2_0 in1 ( .clk(clk), .rst(rst), .a_i(a_ii[1:0]), .b_i(b_ii[1:0]), 
        .cin(net294), .sum_o({coutFromFirstRca, n24, n25}) );
  rca_width2_1 in2 ( .clk(clk), .rst(rst), .a_i(a_ii[3:2]), .b_i(b_ii[3:2]), 
        .cin(coutFromFirstRca), .sum_o({n21, n22, n23}) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG7_S1 ( .D(n10), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(n20) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG8_S2 ( .D(n9), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(sum_o[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG9_S1 ( .D(n8), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(n18) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG10_S2 ( .D(n7), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(sum_o[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG0_S1 ( .D(n6), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(n16) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG1_S2 ( .D(n5), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(sum_o[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG2_S1 ( .D(n4), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(n14) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG3_S2 ( .D(n3), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(sum_o[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG4_S1 ( .D(n2), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(n12) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG5_S2 ( .D(n1), .CLK(clk), .RESET(rst), 
        .SET(net294), .QN(sum_o[2]) );
  TIELOx1_ASAP7_75t_R U2 ( .L(net294) );
  INVx1_ASAP7_75t_R U3 ( .A(n12), .Y(n1) );
  INVx1_ASAP7_75t_R U4 ( .A(n23), .Y(n2) );
  INVx1_ASAP7_75t_R U5 ( .A(n14), .Y(n3) );
  INVx1_ASAP7_75t_R U6 ( .A(n22), .Y(n4) );
  INVx1_ASAP7_75t_R U7 ( .A(n16), .Y(n5) );
  INVx1_ASAP7_75t_R U8 ( .A(n21), .Y(n6) );
  INVx1_ASAP7_75t_R U9 ( .A(n18), .Y(n7) );
  INVx1_ASAP7_75t_R U10 ( .A(n25), .Y(n8) );
  INVx1_ASAP7_75t_R U11 ( .A(n20), .Y(n9) );
  INVx1_ASAP7_75t_R U12 ( .A(n24), .Y(n10) );
endmodule

