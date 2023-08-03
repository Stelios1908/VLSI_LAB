/*
se ayto to thema einai oti den exo enable kai oti
exo sima poy dixnei oti o counter (c0) èinai sto 7
kai prepei na midenisei
*/

module counter #(
   parameter c0_w=3,
   parameter c1_w=16
)(
  input clk,rst,
  output [c0_w-1:0]c0,
  output [c1_w-1:0]c1
);

reg [c0_w-1:0]c0;
reg [c1_w-1:0]c1;
wire c0_end,c1_end;

assign c1_end = (c1==16'hffff);

always @(posedge clk)  begin
 //$display("CO :  %0d  |  C1 : %0d ",c0,c1);
   if(!rst) begin
      c0 <=3'd0;
      c1 <=16'd2;
   end
   else begin
      if(c0 !=7) begin 
         c0<=c0+1;
      end
      else begin 
         c0<=1;
         if(!c1_end)  c1<=c1+1;
         else  c1<=2;
      end
   end
end
  
endmodule