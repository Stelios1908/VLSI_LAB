module gcd_tb();

integer i,j,error;
localparam size=4;
localparam period =4;


reg rst,clk;
reg [size-1:0]x_i,y_i;
wire [size-1:0]data_o;

gcd #(size) DUT (rst,clk,x_i,y_i,data_o);

always #(period*0.5) clk = ~clk;
initial begin
    error=0;
    clk=0;
    x_i=0;
    y_i=0;
    for(i=1;i<2**size;i=i+1) begin
       for(j=1;j<2**size;j=j+1) begin
           //clk=0;
           rst=1;
           #(period*3) 
           rst=0;
           x_i=i;
           y_i=j;
          
          //wait until data is valid to the output
           while(DUT.data_en!=1'b1) begin
              #(period);
           end

           //calculate gcd
           while (x_i!=y_i) begin
               if (x_i>y_i) x_i=x_i-y_i;
              else y_i=y_i-x_i;
            end
          
           if(x_i != data_o)begin
               error =  error + 1;
           end
           //result  by me/  and result by module
           //$display("the result of me     : %d",x_i);
          // $display("the result of module : %d",data_o);

          
        end
    end
    if(!error)
      $display("SUCCESFUL EXECUTION WITH    %d ERROR ",error);
    else
      $display("NO SUCCESFUL EXECUTION WITH    %d ERROR ",error);

    $finish(); 
end

  initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
  end
endmodule
