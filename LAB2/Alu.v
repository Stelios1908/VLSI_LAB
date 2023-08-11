module  Alu #(
    parameter n=8
)
(
    input   [n-1:0]A,B,
    input   [3:0]opcode,
    output  reg [n-1:0]y,
    output  [4:0]status
);

reg overf,Carry;
wire Neg,zero,par;
integer i;
assign status={par,overf,Neg,zero,Carry};
assign zero = (y == 0 )? 1'b1 : 1'b0;
assign par = ^y;
//edo prosoxi analoga to opper
assign Neg = y[n-1];

always @(*) begin
    case(opcode)
        0: begin  //A - B to carry den nomizo oti xreiazete
            {Carry,y} = {1'b0,$signed(A)-$signed(B)};
              overf   =(A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1]);
              
           end
           
        1: begin //A + B to carry den nomizo oti xreiazete
            {Carry,y} = {1'b0,$signed(A)+$signed(B)};
              overf   =(A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1]);

           end
        2: begin //A - 1 to carry panta 
           {Carry,y} = {1'b0, $signed(A)-1'b1};
           overf   =(A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1]);

           end
        3: // A+1;
          begin
             {Carry,y} = {1'b0, $signed(A)+1'b1};
              overf   =(A[n-1] & B[n-1] &~y[n-1]) | (~A[n-1] & ~B[n-1] & y[n-1]);
          end
        
        4:// |A|
          begin
             if(A[n-1]) begin //an einai o mikroteros arnitikos den mporoyme na paroyme thetiko
                if(A==-2**(n-1)-1)  begin
                   overf=1'b1;
                end
                else  begin
                  y=-$signed(A);
                  overf=1'b0;
                end
             end
             else begin
                y=$signed(A);
             end
          end
           
        5:  y =  ~A ;
        6:  y = A & B;
        7:  y = A | B;
        8:  y = A ^ B;
        9:  //numerical shift left
            begin
              if($signed(B)>n+1) begin 
                 {Carry,y} = {1'b0,{n{1'b0}}};  
              end
              else if ($signed(B)<0) begin
                 //DO NOTHING
              end
              else begin
                 {Carry,y} =  A <<< B; 
              end
            end
        10: //numerical shift rigth 
              begin 
              if($signed(B)>n+1) begin 
                 {Carry,y} = {{(n+1){A[n-1]}}};  
              end
              else if ($signed(B)<0) begin
                 // DO NOTHING
              end
              else begin
                 {Carry,y} =  $signed(A) >>> B; 
              end
            end
        11: //logic shift rigth
            begin
              if($signed(B)<0) begin
                //DO NOTHING
              end
              else begin
                y =  A >> B; 
                Carry=0;
              end
            end
          
        12:  // Circual left sift
            begin
              if($signed(B)<0) begin
                //DO NOTHING
              end
              else begin
                 y =  (A>>B) | (A<<(n-B));
              end
            end
        13: // Circual left sift
            begin
              if($signed(B)<0) begin 
                 //DO NOTHING
              end
              else begin
                 y = (A<<B) | (A>>(n-B)); 
              end
            end      
        14:  y = {n{1'b0}};
        15:  y = {{(n-1){1'b0}},1'b1};
    endcase
end


endmodule
/*
module alu #(
  parameter n = 4
)(
  input [n-1:0] A, B,
  input [3:0] opcode,
  output reg [n-1:0] Y,
  output [4:0] status
);

  reg Neg, Ov, c, V; 
  wire z, p;

  always@(*)
  begin
    c=1'b0;
    Y=0;
    Neg=0;
    V=0;
    case(opcode)
      4'd0: begin {c,Y}=$signed(A)-$signed(B); Neg=Y[n-1]; V=((~A[n-1])&(B[n-1])&(Y[n-1]))|((A[n-1])&(~B[n-1])&(~Y[n-1])); end
      4'd1: begin {c,Y}=$signed(A)+$signed(B); Neg=Y[n-1]; V=((~A[n-1])&(~B[n-1])&(Y[n-1]))|((A[n-1])&(B[n-1])&(~Y[n-1])); end
      4'd2: begin {c,Y}=$signed(A)-1; Neg=Y[n-1]; V=A[n-1]&(~Y[n-1]); Neg=Y[n-1]; end
      4'd3: begin {c,Y}=$signed(A)+1; Neg=Y[n-1]; V=(~A[n-1])&Y[n-1]; Neg=Y[n-1]; end
      4'd4: begin if (A[n-1]) Y=-$signed(A); else Y=A; end
      4'd5: Y= ~A;
      4'd6: Y= A & B;
      4'd7: Y= A | B;
      4'd8: Y= A ^ B;
      4'd9: begin Y = A <<< B; V=A[n-1]^Y[n-1]; Neg=Y[n-1]; end
      4'd10: begin Y= $signed(A) >>> B; Neg=Y[n-1]; end
      4'd11: begin Y = A >> B;  Neg=Y[n-1]; end
      4'd12: begin Y= A << B[$clog2(n)-1:0] | A >> (n-B[$clog2(n)-1:0]); Neg=Y[n-1]; end
      4'd13: begin Y=A >> B[$clog2(n)-1:0] | A << (n-B[$clog2(n)-1:0]); Neg=Y[n-1]; end
      4'd14: Y=0;
      4'd15: Y=1;
    endcase
  end
  assign z = (Y==0);
  assign p = ~^Y;
  assign status={p,V,Neg,z,c};

endmodule
*/