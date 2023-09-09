module shift_reg #(
    parameter width = 8
)(
    input clk,rst,pl,enable,
    input si,
    input [width-1:0] pi,
    output so
    
);

reg [width-1:0]ff;

assign so = ff[0];

always @(posedge clk or negedge rst) begin
  if(!rst)  ff<=0;
  else if(pl) ff <= pi;
  else if(enable) begin
      ff <= {si,ff[width-1:1]};
  end
end

endmodule