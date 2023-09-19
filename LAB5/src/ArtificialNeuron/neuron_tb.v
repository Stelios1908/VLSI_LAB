module neuron_tb();
 parameter m=8;//input activation and weigth
 parameter n=4;//length weigth
 parameter k=4;//length activation
 parameter b=4;//length bias
 
 integer i,result,error;
 
 reg load_params;
 reg signed [m*k-1:0]activation;
 reg signed [m*n-1:0]weigth;
 reg signed [b-1:0]bias;
 wire   [n+k+$clog2(m):0] out;
 
 //function gia random bias 
 function [b-1:0] newBias (input a);
   begin: name2
       integer ii;
         for (ii=0; ii<(b/32)+1; ii=ii+1) begin
             newBias[ii*32+:32] = $random; 
         end
    end
 endfunction
 
 //function gia random weigth 
 function [m*n-1:0] newWeigth (input a);
   begin: name 
       integer ii;
       for (ii=0; ii<m; ii=ii+1) begin
           newWeigth[ii*n+:n] = $random; 
       end
    end
 endfunction
 
 //function gia random activation
 function [m*k-1:0] newActiv (input a);
   begin: name 
       integer ii;
       for (ii=0; ii<m; ii=ii+1) begin
           newActiv[ii*k+:k] = $random; 
       end
    end
 endfunction
 
 neuron #(m,n,k,b) DUT (load_params,activation,weigth,bias,out);
 initial  begin
    load_params=0;
    activation =newActiv(1'b0);
    weigth = newWeigth(1'b0);
    bias = newBias(1'b0);
    #10;
    load_params=1;
    #10;
    load_params=0;
 
    $display("activation = %b",activation);
    $display("weigth = %b",weigth);
    $display("Bias  = %b",bias);
    result=bias;
    for(i=0;i<m;i=i+1) begin
        result=result+activation[i*k+:k]*weigth[i*n+:n];
    end
    #100;
    $display("result  = %b | out = %b",result,out);
    $finish;
 end
 
endmodule