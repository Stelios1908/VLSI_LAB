module myreg (
    input rst,clk,D,
   output Q
);

reg Q;

always @(posedge clk or posedge rst) begin
      if(rst) Q<=0;
      else Q<=D;
end 

endmodule