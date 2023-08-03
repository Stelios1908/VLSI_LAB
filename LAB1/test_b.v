module test;
    parameter n=8;
    parameter delay = 10;

reg [n-1:0] a;
reg [n-1:0] b;
reg [n:0] sum;
reg check;
wire [n:0]out;
integer i=0;

rca # (.width(n)) DUT(
      .a_i(a),
      .b_i(b),
      .sum_o(out)
    );
initial  begin
   a=0;
   b=0;
   repeat(256) begin
        repeat(256) begin
           4#(delay);
            sum = a + b;
             if(sum==out)
              $display("correct");
             else 
              $display("not correct");
             $display("a = %0d | b = %0d | sum = %d | out = ",a,b,sum,out);
            b=b+1;
        end
     a=a+1;
    end
end

/*
  repeat(10) begin
       a = $random % (2<<n);
       b = $random % (2<<n);
       #(delay) sum = a+b;
       if(out==sum) check = 1'b1;
       else check = 1'bX;
       i = i+1;
      $display("%0t iteration %0d done",$time,i);
      $display(" The b is %0d",a);
      $display(" The a is %0d",b);
      $display(" The out is %0d",check);
      end
  
*/

  initial 
       begin
         $dumpfile("dump.vcd");   
         $dumpvars(0);
       end



endmodule

