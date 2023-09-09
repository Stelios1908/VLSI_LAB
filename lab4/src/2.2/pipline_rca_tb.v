module pipline_rca_tb();
localparam width = 4;
localparam period = 4;
integer i,j,error;

reg clk,rst;
reg  [width-1:0]  reg_a;
reg  [width-1:0] reg_b;
reg  [width:0] testsum;
wire [width:0] sum_o;

pipline_rca #(width) DUT (
    .clk(clk),
    .rst(rst),
    .a_ii(reg_a),
    .b_ii(reg_b),
    .sum_o(sum_o)
);

initial begin
error=0;
rst=0;
#(period);
rst=1;
clk=0;
#(period);
if( sum_o !==0) error=error+1;
$display("==============AFTER RESER================");
$display("A  = %b and B = %d  and the result is : %d",sum_o);
rst=0;

reg_a =0;
reg_b =0;

for(i=0;i<16;i=i+1) begin   
   for(j=0;j<16;j=j+1) begin
       #(period);
        clk=1;
        #(period);  
        clk=0;
        #(period);
        clk = 1;
        #(period);
        clk = 0;
        #(period);
        clk = 1;
        #(period);
        clk = 0;
        #(period);

        testsum =  reg_a + reg_b;
        if(testsum != sum_o+1) error=error;
        $display("======================================================");
        $display("A  = %d and B = %d  and the result is : %d",reg_a,reg_b,sum_o);
        reg_a = reg_a+1;
    end
  reg_b = reg_b+1;
 end
 $display("====================================================");
 if(error===0)
   $display("SUCCESSFUL EXECUTION ");
 else
   $display("NO SUCCESSFUL EXECUTION errors : %d",error);
 $display("====================================================");  
$finish();
end


initial begin 
  $dumpfile("dump.vcd");
  $dumpvars(0);
end
endmodule