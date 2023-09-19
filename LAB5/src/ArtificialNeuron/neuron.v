module neuron #(
    parameter m=1,//input activation
    parameter n=8,//length weigth
    parameter k=8,//length activation
    parameter b=8//length bias
)(
    input  load_params,
    input  signed [m*k-1:0]activation,
    input  wire[m*n-1:0]weigth,
    input  wire [b-1:0]bias,
    output  [n+k+$clog2(m):0] out
);

wire  [n+k+$clog2(m)-1:0] sums[m:0];


reg signed[m*n-1:0] weigth_reg;
reg signed[b-1:0]bias_reg;

//edo kanoyme ReLU an einai <0 perno exodo 0 alios to apotelesma
assign out = sums[m]+bias_reg;
assign sums[0] =0;
      
genvar gi;
generate
  for(gi=0; gi<m; gi=gi+1) begin
     mycell #(m,n,k)  mc (
                    .activation(activation[(gi)*k+:k]),
                    .weigth(weigth_reg[gi*n+:n]), 
                    .sum_in(sums[gi]), 
                    .sum_out(sums[gi+1])         
              );
  end

endgenerate

//ena latch gia na fortono toimes sta varoi kai bias
//den xreaizomai reset
always @(load_params ) begin
      if(load_params) begin
          weigth_reg <= weigth;
          bias_reg   <= bias;
      end
  end
endmodule

