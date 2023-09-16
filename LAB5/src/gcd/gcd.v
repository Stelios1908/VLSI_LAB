module gcd #(
    parameter size = 8
)(
    input rst,clk,
    input [size-1:0] x_i,y_i,
    output [size-1:0] data_o
);

wire x_gt_y,x_lt_y,x_eq_y,x_sel,y_sel,x_id,y_id,x_sub,y_sub,data_en;

controlUnit #(size) ctr (rst,clk,x_gt_y,x_lt_y,x_eq_y,x_sel,y_sel,x_ld,y_ld,x_sub,y_sub,data_en);
dataPath    #(size) dat (rst,x_i,y_i,x_sel,y_sel,x_ld,y_ld,x_sub,y_sub,data_en,x_gt_y,x_lt_y,x_eq_y,data_o);
endmodule

/*
  input [size-1:0]x_i,
    input [size-1:0]y_i,
    input x_sel,y_sel,
    input x_id,y_id,
    input x_sub,y_sub,data_en,
    output x_gt_y,x_lt_y,x_eq_y,
    output [size-1:0]data_o


   input rst,clk,
    inout x_gt_y,x_lt_y,x_eq_y,
    output x_sel,y_sel,
    output y_id,x_id,x_sub,y_sub,
    output data_en
    */