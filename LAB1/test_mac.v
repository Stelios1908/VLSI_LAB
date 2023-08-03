module test_mac;

parameter n=4;
parameter s=10;
reg [n-1:0]a;
reg [n-1:0]b;
reg clk;
reg rstn;
reg [s-1:0]prev,sum;
wire [s-1:0]sum_o;
integer f;
parameter fileout= "file1.txt";

mac #(.iwidth(n),
         .swidth(s)
        )
     DUT(
        .a_i(a),
        .b_i(b),
        .clk(clk),
        .rstn(rstn),
        .sum_o(sum_o)
        );

initial begin
         clk=0;
         rstn=0;
    #100 rstn = 1;
end

 always begin #5 clk=~clk; end

initial begin
     a=0;
     b=0;
     prev=0;
     sum=0;
     #2;
     f= $fopen(fileout, "w");
   repeat(10) begin 
       repeat(10) begin
          #9;
          sum = a*b + prev;
          if(sum==sum_o)
           $display("CORECT");
          else
           $display("NOT CORECT");
          #1
          $write("a = %d | b = %d | sum = %d | prev = %d\n", a, b,sum,prev );
          $fwrite(f,"a = %d | b = %d | sum = %d | prev = %d\n", a, b,sum,prev );
          a=a+1;
         
          prev=sum;
        end
     b=b+1;
    end
    $finish;
end

initial begin
         $dumpfile("dump.vcd");   
         $dumpvars(0);
       end

endmodule