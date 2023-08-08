module accumulator #(
    parameter m=3,
    parameter n=2,
    parameter k=4
    
)(
    input  clk,rstn,pl,enable,
    input  [width*k-1:0] din,
    output  ready,
    output [width_sum-1:0]sum
);

integer i,j;
localparam width = m+n;
localparam width_sum=width+$clog2(k);

reg [width_sum-1:0]reg_sum;
reg [$clog2(k):0]reg_cnt;
reg okToLoad,ready;
wire [width-1:0]out_of_reg;
wire [width_sum-1:0]sum;
wire end_cnt;
wire load;


//an to ready einai 0 ginonte ypologismoi kai den
//mporo na fortoso kainoyrgia dedomena
assign load = pl && ready;
assign  end_cnt = (reg_cnt==0);
   
//ftiaxno m+n kataxorites apo tin proigoymenh askhsh  
//kathe enas exei to i-osto bit  apo kathe aritmo
genvar gi;
generate
    for (gi=0; gi<width; gi=gi+1) begin: genShiftReg
	    shift_reg #(.width(k)) sr (
            .clk(clk),
            .rst(rstn),
            .enable(enable),
            .pl(pl),
            .pi(din[(gi+1)*k-k+:k]),
            .si(1'b0),
            .so(out_of_reg[gi])    
      );
	  end
endgenerate



//Gia counter

 always @(posedge clk or negedge rstn) begin
      if(!rstn) begin 
        reg_cnt <= k+1;
      end
      else  begin
        if(load) reg_cnt <= k+1;
        else if(reg_cnt!=0) reg_cnt = reg_cnt -1;
      end
  end
  

//Gia endiameso kataxorhth athroismatos
assign sum =  reg_sum;
always @(posedge clk or negedge rstn)  begin
      if(!rstn) reg_sum <= {width_sum{1'b0}};
      else if(load) reg_sum <={width_sum{1'b0}};
      else reg_sum <= reg_sum+out_of_reg;
end

//gia sima ready otan fortono finete o kai tha 
//xanaginei 1 otan midenisei counter
always @(posedge clk or negedge rstn)  begin
      if(!rstn)  begin
        ready <=1'b1;
      end
      else begin
          if(end_cnt) ready <=1'b1;
          else if(load) ready <= 1'b0  ;
      end
end

endmodule
 


///////lisi
/*
module accumulator #(
  parameter m = 4,
  parameter n = 4,
  parameter k = 4

)(
  input clk, rstn,
  input pl,
  input [k*width-1:0] din,
  output [swidth-1:0] sum,
  output ready
);
  localparam width = m+n;
  localparam swidth = $clog2(k*(2**(m+n)-1));
  localparam cwidth = $clog2(k);


  reg ready_reg;
  reg [swidth-1:0] sum_reg;
  reg [cwidth-1:0] counter_reg;
  wire [swidth-1:0] newsum;
  wire [width-1:0] addend;
  wire mypl;

  sreg #(k-1, width) summands (.clk(clk), .rstn(rstn), .pl(mypl), .en(1'b1), .si({width{1'b0}}), .din(din[k*width-1:width]), .so(addend));


  assign mypl = pl & ready_reg;
  assign done = (counter_reg == 1);
  
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      ready_reg <= 1'b1;
    end
    else begin
      if (done) ready_reg <= 1'b1;
      else if (mypl) ready_reg <= 1'b0;
    end
  end

 //sum_reg mexri  stin arxi fortonete me to proto datain
 //molis staatisei i fortosi xekeinaei h prosthesi
 //se reset mpenei 0
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      sum_reg <= {swidth{1'b0}};
    end
    else begin
      if (mypl) begin
        //sum_reg <= {swidth{1'b0}};
        sum_reg <=din[width-1:0];
      end
      else begin
        sum_reg <= newsum;
      end
    end
  end

//edo enas counter meionete kata ena otan pleon to 
//mypl einai 0 kai exei atamathsei h fortosi
  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      counter_reg <= k;
    end
    else begin
      if (mypl) begin
        //counter_reg <= {swidth{1'b0}};
        counter_reg <=k;
      end
      else begin
        if (counter_reg != 0) counter_reg <= counter_reg-1;
      end
    end
  end

  assign newsum = addend + sum_reg;
  assign sum = sum_reg;
  assign ready = ready_reg;

endmodule
//===================================
module sreg #(
  parameter n = 4,
  parameter width = 1
)(
  input clk, rstn,
  input pl, en,
  input [width-1:0] si,
  input [n*width-1:0] din,
  output reg [width-1:0] so
);

  reg [width-1:0] ff [n-1:0];
  wire [width-1:0] shift [n-1:0];

  genvar i;
  generate
    for (i=0; i<n-1; i=i+1) begin:shiftval
        assign shift[i] = ff[i+1];
    end
    assign shift[n-1] = si; 
    for (i=0; i<n; i=i+1) begin: genff
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
              ff[i] <= {width{1'b0}};
            end
            else begin
                if (pl) ff[i] <= din[(i+1)*width-1:i*width];
                else
                  if (en) ff[i] <= shift[i];
            end
        end
    end
  endgenerate

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      so <= {width{1'b0}};
    end
    else begin
      if (en) so <= ff[0];
    end
  end
endmodule

//test bench
module accumulator_tb();
  parameter m = 8;
  parameter n = 8;
  parameter k = 100;
  parameter tests = 100;
  localparam width = m+n;
  localparam swidth = $clog2(k*(2**(m+n)-1));
  localparam cwidth = $clog2(k);

  localparam period = 2;

  function [k*width-1:0] newdin(input a);
  begin: name
      integer ii;
      for (ii=0; ii<k; ii=ii+1) begin
        newdin[ii*width+:width] = $random; 
      end
  end
  endfunction

  reg clk=1;
  reg rstn;

  reg pl;
  reg [k*width-1:0] din;
  wire [swidth-1:0] sum;
  wire ready;
  reg [swidth-1:0] expected;

  integer i,j, errors=0;


  accumulator #(.m(m), .n(n), .k(k)) DUT (.clk(clk), .rstn(rstn), .pl(pl), .din(din), .ready(ready), .sum(sum));

  always #(0.5*period) clk=~clk;

  initial begin
      rstn=0;
      din=0;
      pl=1'b0;
      #(0.5*period);
      rstn=1;
      #(1.5*period);

      for (i=0; i<tests; i=i+1) begin
        $display("%0t, test: %0d", $time, i+1);
        din=newdin(1'b0);
        expected=0;
        pl=1'b1;
        //$display("%0t, pl: %0b  din:%b", $time, pl, din);
        for (j=0;j<k;j=j+1) begin //compute expected sum
          expected = expected + din[j*width+:width];
        end
        #(period);
        while (ready != 1)  #(period) din=newdin(1'b0); //keep changing din untill done
        if (sum !== expected) begin
          $display("%0t, Expected: %0d got %0d", $time, expected, sum);
          errors=errors+1;
        end
        pl=1'b0;
        #( 3*period );        
      end
      $display("Finished with %0d errors", errors);
      $finish;
  end

endmodule
  */