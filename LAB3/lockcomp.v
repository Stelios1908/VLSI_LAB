module lockcomp#(
   parameter size=16,
   parameter [size-1:0]factory_pass = {size{16'b0}}
)(
   input rst,prs,
   input  [size-1:0]incode,
   output reg equal
);


reg [size-1:0]code_for_cmp;

always @(incode or code_for_cmp or rst or prs)
 begin 
   if(rst) code_for_cmp = factory_pass; 
   else if(prs) code_for_cmp = incode;
   else begin
          if(incode == code_for_cmp) equal=1;
          else equal=0;
        end
end  

endmodule