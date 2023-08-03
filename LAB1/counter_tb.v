module counter_test();
  parameter c0_w=3;
  parameter c1_w=16;

  localparam modc0=7;
  localparam modc1=(1<<c1_w)-2;
  localparam period=10;

  reg clk,rst;
  wire [2:0]c0;
  wire [15:0]c1;
  integer cnt;
  integer error;

  counter #(c0_w,c1_w)DUT(
    .clk(clk),
    .rst(rst),
    .c0(c0),
    .c1(c1)
  );

  initial begin
    clk = 0;
    rst = 0;
    #20 rst = 1;   
  end

  always begin #(0.5*period); clk = ~clk; end
  always @(posedge clk or negedge rst)begin 
      if(!rst) begin cnt <= -1; error <=0; end
      else cnt <= cnt +1;
  end

  always @ (cnt) begin
    if((c0 != (1+cnt % modc0))  || (c1 != (2+(cnt/7) % modc1)))
    $display("E R R O R | TIME = %0t | c0 = %0d | c1 = %0d |testc0 = %0d | testc1 = %0d" ,$time,c0,c1,(1+cnt % modc0),(2+(cnt/7) % modc1));
    else
    $display(" O  K  | TIME = %0t | c0 = %0d | c1 = %0d |testc0 = %0d | testc1 = %0d" ,$time,c0,c1,(1+cnt % modc0),(2+(cnt/7) % modc1));
  end
  //always @(posedge clk)  $monitor("%0t, %0d %0d", $time, c0, c1);
  initial begin
    #(65555*7*period);
    $display(" E R R O R S : ",error);
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule