module rca
#(
  parameter width = 4
)(
  input clk,rst,
  input  [width-1:0] a_i,
  input  [width-1:0] b_i,
  output [width:0] sum_o
);
  wire [width-1:0] temp_a;
  wire [width-1:0] temp_b;
  wire [width:0] temp_sum;
  wire [width:0] temp_c;
  
  
  assign temp_c[0] = 1'b0;
  
  always @(posedge clk) begin

  end
  genvar gi, ti;
  generate
         for (gi=0; gi<width; gi=gi+1) begin: rega_regb_fas
               myreg reg_a (
                         .clk(clk),
                         .rst(rst),
                         .D(a_i[gi]),
                         .Q(temp_a[gi])
                           );
               myreg reg_b (
                         .clk(clk),
                         .rst(rst),
                         .D(b_i[gi]),
                         .Q(temp_b[gi])
                           );
        
	             fulladder fa (
                         .a(temp_a[gi]),
                         .b(temp_b[gi]),
                         .cin(temp_c[gi]),
                         .s(temp_sum[gi]),
                         .cout(temp_c[gi+1])
                         );
	       end
         for(ti=0;ti<width+1;ti=ti+1) begin: reg_sum
               myreg reg_sum(
                         .clk(clk),
                         .rst(rst),
                         .D(temp_sum[ti]),
                         .Q(sum_o[ti])
                        );
         end
  endgenerate
  assign temp_sum[width]=temp_c[width];
endmodule
