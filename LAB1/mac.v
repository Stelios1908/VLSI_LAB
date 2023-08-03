module mac #(
  parameter iwidth = 4,
  parameter swidth = 10
)(
  input clk, rstn,
  input  [iwidth-1:0] a_i,
  input  [iwidth-1:0] b_i,
  output [swidth-1:0] sum_o
);

  reg [swidth-1:0] sum_reg;
  wire [swidth-1:0] sum_w;

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) sum_reg <= {swidth{1'b0}};
    else #(0.01) sum_reg <= sum_w;
  end

  assign sum_w = a_i * b_i + sum_reg;
  assign sum_o = sum_reg;
endmodule