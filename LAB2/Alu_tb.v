module Alu_tb();
parameter n=8;

reg [n-1:0] A,B;
reg [3:0]opcode;
wire [4:0]status;
wire [n-1:0]y;
reg  signed [n-1:0]result;
reg [4:0]test_status;

integer error=0;
integer t;
integer test=100;//pano apo 165 vgazwi eror

Alu #(.n(n)) DUT (
       .A(A),
       .B(B),
       .y(y),
       .opcode(opcode),
       .status(status)
);

always @(y) begin
   test_status[1]=~(|y);
   test_status[2]=y[n-1];
   test_status[3]=(A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1]);
   test_status[4]=^y;
end

initial begin
for(t=0;t<test;t=t+1) begin
    A=$random / (1<<n-1);
    B=$random / (1<<n-1);
    test_status=5'd0;


    //$display("=============0 OPCODE (A-B)=====================");
    opcode = 0;
    result = A-B;
    #1
    if(result!=y | test_status!=status) 
         error=error+1;
       
    //$display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    //$display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    //$display("the result is %b   |  %0d | %0d | %b",$signed(y),$signed(y),result,result);
    //$display("{Parity: %b | Overflow:%b | Negative:%b |Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    //$display("test atatus : %b",status);
   
    //$display("================================================");
    //$display("=============1 OPCODE (+)=======================");
    opcode= 1;
    result = A+B;
    #1
    if(result!=y | test_status!=status) error=error+1;
    //$display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    //$display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    //$display("the result is %b   |  %0d ",$signed(y),$signed(y));
    //$display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    
    //$display("==================================================");
    //$display("=============2 OPCODE (A-1)=======================");
    opcode= 2;
    #1
    result = A-1;
    //if(result!=y | test_status!=status) error=error+1;
    //$display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    //$display("the result is %b   |  %0d ",$signed(y),$signed(y));
    //$display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    //$display("==================================================");
    //$display("=============3 OPCODE (A+1)=======================");
    opcode= 3;
    #1
    result = A+1;
    if(result!=y | test_status!=status) error=error+1;
    //$display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    //$display("the result is %b   |  %0d ",$signed(y),$signed(y));
    //$display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
    

    //$display("==================================================");
    //$display("=============4 OPCODE (|A|)=======================");
    opcode= 4;
    #1
    result = (A[n-1])? (A != -2**(n-1)-1) ? -$signed(A) : result: $signed(A);
    test_status[3]= (A[n-1])? (A == -2**(n-1)-1) ? 1'b1:1'b0:test_status[3];

    if(result!=y | test_status!=status) error=error+1;
    //$display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    //$display("the result is %b   |  %0d ",$signed(y),$signed(y));
    //$display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);
/*
    $display("==================================================");
    $display("=============5 OPCODE (not A)=======================");
    opcode= 5;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("=====================================================");
    $display("=============6 OPCODE (A && B)=======================");
    opcode= 6;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("=====================================================");
    $display("=============7 OPCODE (A || B)=======================");
    opcode= 7;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("====================================================");
    $display("=============8 OPCODE (A ^ B)=======================");
    opcode= 8;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("=====================================================");
    $display("=============9 OPCODE (A <<< B)=======================");
    opcode= 9;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("======================================================");
    $display("=============10 OPCODE (A >>> B)======================");
    opcode= 10;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);


    $display("======================================================");
    $display("=============11 OPCODE (A >> B)=======================");
    opcode= 11;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);


    $display("======================================================");
    $display("=========12 OPCODE (A Circual left sift  B)===========");
    opcode= 12;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("======================================================");
    $display("=========13 OPCODE (A Circual rigth sift  B)==========");
    opcode= 13;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("======================================================");
    $display("==========14 OPCODE (y=0)=============================");
    opcode= 14;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

    $display("======================================================");
    $display("==========15 OPCODE (y=1)=============================");
    opcode= 15;
    #1
    $display("the A      is %b   |  %0d ",$signed(A),$signed(A));
    $display("the B      is %b   |  %0d ",$signed(B),$signed(B));
    $display("the result is %b   |  %0d ",$signed(y),$signed(y));
    $display("{Parity: %b | Overflow:%b | Negative:%b | Zero:%b | Carry-out:%b",status[4],status[3],status[2],status[1],status[0]);

*/
end
   if(error==0)
     $display("no error!!!!!!!!!!!!!!!!! ");
   else 
    $display("error!!!!!!!!!!!!!!!!! ");

    
end

endmodule