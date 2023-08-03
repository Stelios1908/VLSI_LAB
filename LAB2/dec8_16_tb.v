module dec8_tb();
parameter widthi=4;
parameter widtho=2**widthi;
localparam period=10;

reg clk,rst,enable;
reg [widthi-1:0]in;
reg [widtho-1:0] res;
wire [widtho-1:0]out;
integer error=0;


generate
if(widthi==3) dec_8 #(widthi) DUT(.clk(clk),.rst(rst),.enable(enable),.in(in), .regout(out));
if(widthi==4)dec_16 #(widthi) DUT(.clk(clk), .rst(rst),.enable(enable), .in(in),.out(out));

endgenerate


initial begin
     clk=0;
     rst=0;
     in=0;
     enable=1;
     #(period);
     rst=1;
     #(period*5);
     enable=0;
  
end

always begin #(0.5*period) clk=~clk; end
  
initial begin
    #7;
    repeat(40) begin
       #(period)
       res=2**in;

       if(out==res && enable==0)
       $display("CORRECT  in = %0b | res =  %0b  | out = %0b",in,res,out);
       else if(out!=res && enable==0) begin
       $display("NOT CORRECT  in = %0b | res =  %0b  | out = %0b | enable = %0b",in,res,out,enable);
       error = error + 1; end
       else if(out !=0 && enable==1)  
       error = error+1;
       else if(out==0 && enable==1)
       $display("NOT ENABLE AND RES IS ZERO");
       
       in=in+1;
       //$monitor("in = %0b | res =  %0b  | out = %0b",in,res,out);
    
    end 
    $display(" E R R O R S = %0d",error);
   $finish;
 end


initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
end
endmodule
