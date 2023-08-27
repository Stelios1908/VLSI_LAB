module lockcomp#(
   parameter size=16,
   parameter [size-1:0]factory_pass = {size{16'b0}}
)(
   input rstn,prs,
   input  [size-1:0]incode,
   output reg equal
);


reg [size-1:0]code_for_cmp;

always @(incode or code_for_cmp or rstn or prs)
 begin 
   if(!rstn) code_for_cmp = factory_pass; 
   else if(prs) code_for_cmp = incode;
   else begin
          if(incode == code_for_cmp) begin
             equal =1;
             end
          else begin
              equal =0;
          end
        end
  end  

endmodule
