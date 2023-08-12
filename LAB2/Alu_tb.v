module Alu_tb#(parameter  DEBUG = 0)();
parameter n=18;


reg [n-1:0] A,B;
reg [3:0]opcode;
wire [4:0]status;
wire [n-1:0]y;
reg  signed [n-1:0]result;
reg [4:0]test_status;

integer error=0;
integer t;
integer test=2000;//pano apo 178 vgazwi eror
integer delay=1;

Alu #(.n(n)) DUT (
       .A(A),
       .B(B),
       .y(y),
       .opcode(opcode),
       .status(status)
);

always @(*) begin
   test_status[1]=~(|y);
   test_status[2]=y[n-1];
   test_status[3]=(opcode<5'd4)?((A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1])):1'b0;
   test_status[4]=^y;
end

initial begin
for(t=0;t<test;t=t+1) begin
    A=$random / (1<<n-1);
    B=$random / (1<<n-1);
    test_status=5'd0;

    opcode = 0;
    result = A-B;
    #(delay)
    if(result !=y | test_status != status) error=error+1; 
    if(DEBUG) begin
       $display("=============0 OPCODE (A-B)=====================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d | %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b |Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
   
    opcode= 1;
    result = A+B;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("================================================");
       $display("=============1 OPCODE (+)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
   
    opcode= 2;
    result = A-1;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("==================================================");
       $display("=============2 OPCODE (A-1)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end

   
    opcode= 3;
    result = A+1;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("==================================================");
       $display("=============3 OPCODE (A+1)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
    
    opcode= 4;
    result = (A[n-1])? (A != -2**(n-1)-1) ? -$signed(A) : result: $signed(A);
    #(delay)
    test_status[3]= (A[n-1])? (A == -2**(n-1)-1) ? 1'b1:1'b0:test_status[3];

    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("==================================================");
       $display("=============4 OPCODE (|A|)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
    
    opcode= 5;
    result=~A;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("==================================================");
       $display("=============5 OPCODE (not A)=====================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the result is %b  | %d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("the test_status is %b  ",test_status);
    end
   
    opcode= 6;
    result=A & B;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("=====================================================");
       $display("=============6 OPCODE (A & B)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end
    
    opcode= 7;
    result =A | B;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("=====================================================");
       $display("=============7 OPCODE (A || B)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
    
    opcode= 8;
    result = A ^ B;
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("====================================================");
       $display("=============8 OPCODE (A ^ B)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b  | %b ",$signed(y),result);
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
       $display("test_status %b ",test_status);
    end
    
    opcode= 9;
     begin
        if($signed(B)>n+1) begin 
            {test_status[0],result} = {1'b0,{n{1'b0}}};  
        end
        else if ($signed(B)<0) begin
            //DO NOTHING
        end
        else begin
            {test_status[0],result} =  A <<< B; 
        end
    end
    #(delay)
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("=====================================================");
       $display("=============9 OPCODE (A <<< B)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end

    opcode= 10;
    begin 
        if($signed(B)>n+1) begin 
           {test_status[0],result} = {{(n+1){A[n-1]}}};  
        end
        else if ($signed(B)<0) begin
           // DO NOTHING
        end
        else begin
           {test_status[0],result} =  $signed(A) >>> B; 
        end
    end
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("=============10 OPCODE (A >>> B)======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end
   
    opcode= 11;
    begin
        if($signed(B)<0) begin
          //DO NOTHING
        end
        else begin
          result =  A >> B; 
          test_status[0]=0;
        end
    end
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("=============11 OPCODE (A >> B)=======================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end
    
    opcode= 12;
    begin
        if($signed(B)<0) begin
                //DO NOTHING
        end
        else begin
           result =  (A>>B) | (A<<(n-B));
        end
    end
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("=========12 OPCODE (A Circual left sift  B)===========");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end

    
    opcode= 13;
    begin
        if($signed(B)<0) begin 
           //DO NOTHING
        end
        else begin
           result = (A<<B) | (A>>(n-B)); 
        end
    end 
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("=========13 OPCODE (A Circual rigth sift  B)==========");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end



    opcode= 14;
    result=0;
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("==========14 OPCODE (y=0)=============================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end


   
    opcode= 15;
    result=1;
    #1
    if(result!=y | test_status!=status) error=error+1;
    if(DEBUG) begin
       $display("======================================================");
       $display("==========15 OPCODE (y=1)=============================");
       $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
       $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
       $display("the result is %b   |  %0d ",$signed(y),$signed(y));
       $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    end

if(error!=0) begin 
    $display("error at test  %d",t);  
   #2000
   $finish;
end


end
   if(error==0)
     $display("no error!!!!!!!!!!!!!!!!! ");
   else 
    $display("error!!!!!!!!!!!!!!!!! ");

    
end

endmodule
