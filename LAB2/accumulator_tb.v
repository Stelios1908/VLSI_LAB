module accumulator_tb();
parameter m=4;
parameter n=10;
parameter k=9;

localparam period=10;
localparam width = m+n;
localparam width_sum=width+$clog2(k);

integer i,j,f,l,t;
integer num_of_test=30;
integer error=0;

reg clk,rstn,pl,enable;
reg [width*k-1:0] din;
reg [width*k-1:0] new_din;
reg [width+$clog2(k)-1:0]mysum;
wire [width+$clog2(k)-1:0]sum;

integer file;
parameter fileout= "file1.txt";

accumulator #(m,n,k) DUT (
            .clk(clk),
            .rstn(rstn),
            .pl(pl),
            .enable(enable),
            .din(new_din),
            .ready(ready),
            .sum(sum)
        );
function [k*width-1:0] produceDin(input a);
  begin:myfunction
      integer i;
      for (i=0; i<k; i=i+1) begin
        produceDin[i*width+:width] = $random; 
      end
  end
  endfunction

 always #(period*0.5) clk=~clk;

 initial begin
 file= $fopen(fileout, "w");
 clk=1;
 pl=0;
 rstn=0;
 din=0;
 enable=1;

 #(period*0.3)
 rstn=1;
 #(period*0.7); 
 for(t=0;t<num_of_test;t=t+1) begin
 mysum=0;
 
 //edo ftiaxnoyme to din alla gia na to fortosoyme stoys kataxorites 
 //prepei na allaxei seira mesa sto array diladi an:
 //din = [1111,0000,1111] tote new_din =[101,101,101,101] kai
 //sto kataxoriti i tha fortothoyn  ola ta i-osta psifia ton k arithmon
    din = produceDin(0);//18'b001001000001100100;//
    //$display("before calibration : %0b",din);
    for(i=0;i<k;i=i+1) begin
       mysum = mysum + din[i*width+:width];
       //$display("to anamenomeno  atroisma  einai : %0b",mysum);
    end
     //$display("before calibration : %0b",din);
     f=0;
    for(i=0;i<width;i=i+1) begin
       for(j=0;j<(k-1)*width+1;j=j+width) begin
           new_din[f]=din[i+j];
           f=f+1;
       end
    end
    //$display("after calibration : %0b",new_din);
    
    pl=1;
    #(period*2)
    pl=0;
    while(ready !=1)  #(period);
      
    $display("===========================================");
    $display("to anamenomeno  atroisma  einai : %0d",mysum);
    $display("to ypologisthen athroisma einai : %0d",sum);
    //$write("to anamenomeno  atroisma  einai : %0d",mysum);
    $fwrite(file,"\n===========================================");
    $fwrite(file,"\nto anamenomeno  atroisma  einai : %0d",mysum);
    $fwrite(file,"\nto anamenomeno  atroisma  einai : %0d",mysum);
    if(mysum != sum) error=error+1;
    end
       
    $display("to test egine me  %0d error",error);
    $finish;
  end

  initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
  end

endmodule
