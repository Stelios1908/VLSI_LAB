module dloc_tb();

integer i;
localparam period = 4;

reg rstn,clk,sw1,sw2,sw3;
reg [3:0]sw16;
wire error,lock;
wire [2:0]count;



dlock DUT(
       .rstn(rstn),
       .clk(clk),
       .sw1(sw1),
       .sw2(sw2),
       .sw3(sw3),
       .sw16(sw16),
       .Error(error),
       .lock(lock),
       .count(count)
);
always #(period*0.5) clk = ~clk;

initial begin 
  clk=0;
  rstn=0;
  sw1=0;
  sw2=0;
  sw3=0;
  sw16=0'bzzzz;
  #(period);
  rstn=1;
  #(period);
  $display("========================AFTER RESET=================================");
  $display("state : %b | error : %b | lock : %b |",DUT.state,error,lock);
  
  /////////////////////////////////////////////////////////////////////////////////////
  // TRY UNLOCK WITH FALSE CODE (START)
  $display("=================TRY UNLOCK  WITH FALSE CODE========================");
  sw16 = 4'b0010;
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0111;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b1110;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b1100;
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
  #(period*1);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
 
 /////////////////////////////////////////////////////////////////////////////////////
 //NOW ERROR AND CODE ABBC TO EXIT FROM ERROR (START)
  $display("===========NOW ERROR AND CODE ABBC TO EXIT FROM ERROR================");

  sw16 = 4'b0010;//A
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0110;//B
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b0110;//B
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b0010;//A
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
  #(period*1);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
 
  /////////////////////////////////////////////////////////////////////////////////////
  // TRY TO UNLOCK WITH RIGTH CODE (START)
  $display("=================TRY TO UNLOCK WITH RIGTH CODER========================");
  sw16 = 4'b0010;
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0111;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b1110;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b1101;
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
  #(period*1);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 

/////////////////////////////////////////////////////////////////////////////////////
//NOW I AM TRYING TO CHANGE PASSWORD WITH (# * !# ENDER ) AND I WILL NOT GO TO CHANGE_PASS STATE
//BUT I STAY TO THE SAME STATE  
  $display("==I AM TO UNLOCK STATE AND I TRY TO CHANGE PASS WITH (# * 2 ENDER )===");
  #0;
  #(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0001;//*
  #0;
  #(period*2);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);


  sw16 = 4'b1110;//2
  #0;
  #(period*2);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);


 /////////////////////////////////////////////////////////////////////////////////////
 //NOW I AM TRYING TO CHANGE PASSWORD WITH (# * # ENDER )
  $display("==I AM TO UNLOCK STATE AND I TRY TO CHANGE PASS WITH (# * # ENDER )===");
  sw16 = 4'b1111;//#
  #0;
  #(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0001;//*
  #0;
  #(period*2);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);


  sw16 = 4'b1111;//#
  #0;
  #(period*2);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
 $finish;
 end
endmodule
