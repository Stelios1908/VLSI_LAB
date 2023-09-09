module pipline_rca #(
    parameter width=4
)(
  input clk,rst,
  input  [width-1:0] a_ii,
  input  [width-1:0] b_ii,
  output [width:0] sum_o
);
wire coutFromFirstRca;


rca #(width/2) in1 (clk,rst,a_ii[width/2-1:0],b_ii[width/2-1:0],1'b0,{coutFromFirstRca,sum_o[1:0]});
rca #(width/2) in2 (clk,rst,a_ii[width-1:width/2],b_ii[width-1:width/2],coutFromFirstRca,sum_o[4:2]);


endmodule