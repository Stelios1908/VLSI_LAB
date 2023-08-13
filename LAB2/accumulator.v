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
		    .pl(load),
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
 

