module neuron_tb();
 parameter m=4;//input activation and weigth
 parameter n=4;//length weigth  13
 parameter k=4;//length activation  20
 parameter b=10;//length bias
 
 integer i,j,error,success;
 
 reg signed[63:0]result;
 reg load_params;
 reg  [m*k-1:0]activation;
 reg  [m*n-1:0]weigth;
 reg  signed[b:0]bias;
 wire   [n+k+$clog2(m)+1:0] out;
 
 //function gia random bias 
 function [b:0] newBias (input a);
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
    if((n+k+$clog2(m)+1)>63) begin
       $display("================================================================ ");
       $display("THE RESULT OF THE REGISTER RESULT(63:0) IS SMALL, PLEASE INCREASE");
       $display("BECAUSE THE RESULT MAY NOT FIT !!!!!!!!!!!!!!!!!!!!!!!!!!! ");
       $display("================================================================="); 
    end
    if((n+k+$clog2(m))<b) begin
       $display("================================================================ ");
       $display("THE WIDTH OF THE OUTPUT IS SMALL, PLEASE DECREASE WIDTH OF BIAS ");
       $display("OR INCREASE THE WIDTH OF WEIGTH OR WIDTH OF ACTIVATIONS !!! ");
       $display("================================================================="); 
    end
    error=0;
    success=0;
    for(j=0;j<1500;j=j+1) begin
         result = 0;
         activation =newActiv(1'b0);
         weigth = newWeigth(1'b0);
         bias = newBias(1'b0);
         #10;
         load_params=1;
         #10;
         load_params=0;
         
         result=bias;
          
         for(i=0;i<m;i=i+1) begin
             result=$signed(result)+$signed(activation[i*k+:k])*$signed(weigth[i*n+:n]);
         end
         if(result <0) result =0;
         //$display("result  = %0d | out = %0d",$signed(result),$signed(out));
         if($signed(result) !== $signed(out)) begin
              error=error +1;
             // $display("Bias  = %d",$signed(bias));
             // $display("result  = %0d | out = %0d",$signed(result),$signed(out));
             // $display("result  = %b | out = %b",$signed(result),$signed(out));
        end
        else if(($signed(result) == $signed(out)))
             success=success+1;
        
    end    
    
     $display("==========================================================================");
     $display("THE  PROGRAM HAS BEEN EXECUTED WITH <%0d> ERRORS AND <%0d> SUCCESSFUL TRIES",error,success);
     $display("==========================================================================");
     $finish;
 end
 
endmodule
