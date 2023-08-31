module dloc_tb();

integer i;
reg err=0;
localparam period = 8;
localparam size=16;

reg rstn,clk,sw1,sw2,sw3;
reg [3:0]sw16;
wire error,lock;
wire [2:0]count;



dlock #(size,16'b1101111001110010)DUT(
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
  $display("========================BEFORE RESET===================================");
  $display("state : %b | error : %b | lock : %b | PASSWORD : %b ",DUT.state,error,lock,DUT.password);
  clk=0;
  rstn=0;
  sw1=0;
  sw2=0;
  sw3=0;
  sw16=0'bzzzz;
  #(period);
  rstn=1;
  #(period);
  $display("========================AFTER RESET===================================");
  $display("state : %b | error : %b | lock : %b | PASSWORD : %b ",DUT.state,error,lock,DUT.password);
  if(DUT.password != 16'b0011001100110011) err = err +1;
  #(period);
  /////////////////////////////////////////////////////////////////////////////////////
  // TRY UNLOCK WITH FALSE CODE (START)
  $display("=================TRY UNLOCK  WITH FALSE CODE==========================");
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
  #(period);
  if(DUT.state!= 3'b110 || error !=1 || lock !=0) err = err +1;
 
 
 /////////////////////////////////////////////////////////////////////////////////////
 //NOW ERROR AND CODE ABBC TO EXIT FROM ERROR 
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
  #(period);

 
  if(DUT.state!= 3'b000 || error !=0 || lock !=0) err = err +1;
  /////////////////////////////////////////////////////////////////////////////////////
  // TRY TO UNLOCK WITH RIGTH CODE 
  $display("=================TRY TO UNLOCK WITH RIGTH CODER========================");
  sw16 = 4'b0011;
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0011;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b0011;
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b0011;
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw16=4'bz;
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
 if(DUT.state!= 3'b100 || error !=0 || lock !=1) err = err +1;
  #(period*1);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 if(DUT.state!= 3'b101 || error !=0 || lock !=0) err = err +1;
  #(period);
 
/////////////////////////////////////////////////////////////////////////////////////
//NOW I AM TRYING TO GO CHANGE_PASS STATE WITH (# * !# ENDER ) AND I WILL NOT GO TO CHANGE_PASS STATE
//BUT I STAY TO THE SAME STATE  
  $display("==I AM TO UNLOCK STATE AND I TRY TO CHANGE PASS WITH (# * 2 ENDER )===");
  sw16=4'b1111;
  #0;
  #(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b0001;//*
  #0;
  #(period*4);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);


  sw16 = 4'b1110;//2
  #0;
  #(period*2);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  
  sw2 = 1 ; 
  #0;
  #(period*0.3);
  sw16 = 4'bz;
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  if(DUT.state!= 3'b101 || error !=0 || lock !=0) err = err +1;
  #(period);
 
 /////////////////////////////////////////////////////////////////////////////////////
 //NOW I AM TRYING TO GO CHANGE_PASS STATE  WITH (# * # ENDER )
  $display("==I AM TO UNLOCK STATE AND I TRY TO GO CHANGE_PASS STATE WITH (# * # ENDER )===");
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
  if(DUT.state!= 3'b010 || error !=0 || lock !=0) err = err +1;
  #(period);

 ////////////////////////////////////////////////////////////////////////////////////
 //NOW I AM CHANGE_PASS STATE AND I TRYING CHANGE PASSWORD  BUT THE LAST DIGIT IS LETTER
 //AND I HAVE ERROR
 $display("============CHANGE PASSWORD LAST DIGIT LETTER===========================");
  sw16 = 4'b1011;//1
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  #(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b1011;//1
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b1011;//1
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b0010;//A
  sw2 = 1 ; 
  #0;
  sw16=4'bz;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  if(DUT.state!= 3'b110 || error !=1 || lock !=0) err = err +1;
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
 
  #(period*1);
  
 
/////////////////////////////////////////////////////////////////////////////////////
 //NOW ERROR AND CODE ABBC TO EXIT FROM ERROR 
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
  sw16=4'bz;
  sw2 = 0; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  if(DUT.state!= 3'b101 || error !=0 || lock !=0) err = err +1;
  #(period);

  /////////////////////////////////////////////////////////////////////////////////////
 //NOW I AM TRYING TO GO CHANGE_PASS STATE  WITH (# * # ENDER )
  $display("==I AM TO UNLOCK STATE AND I TRY TO GO CHANGE_PASS STATE WITH (# * # ENDER )===");
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
  if(DUT.state!= 3'b010 || error !=0 || lock !=0) err = err +1;
  #(period);

 ////////////////////////////////////////////////////////////////////////////////////
 //NOW I AM CHANGE_PASS STATE AND I TRYING CHANGE PASSWORD .
 //VALID PASSWORD
 
 $display("====================CHANGE PASSWORD ( 1 1 2 2)==========================");
  sw16 = 4'b1101;//1
  sw2 = 1 ; 
  #0;
  #(period);
  sw2 = 0 ; 
  #(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
  sw16 = 4'b1101;//1
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

  sw16 = 4'b1110;//2
  sw2 = 1 ; 
  #0;
  #(period*2);
  sw2 = 0 ; 
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  
 
   
  sw16 = 4'b1110;//2
  sw2 = 1 ; 
  #0;
  sw16=4'bz;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  if(DUT.state!= 3'b101 || error !=0 || lock !=0) err = err +1;
  #(period*1);
  


////////////////////////////////////////////////////////////////////////////////////
 //NOW I  TRY LOCK THE DOOR  BUT DOOR IS OPEN AND I CANT.
 $display("========NOW I  TRY LOCK THE DOOR  BUT DOOR IS OPEN AND I CAN'T.======");
  sw1=1 ; 
  sw3=1; //DOOR OPEN 
  #0;
  #(period);
  sw1=1; 
  sw3=1;
  sw2 = 0 ; 
  //#(period);
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  #(period);

 ///////////////////////////////////////////////////////////////////////////////////
 //NOW I  TRY LOCK THE DOOR  WITH  DOOR IS CLOSE  AND I CAN!!!!!
 $display("======NOW I  TRY LOCK THE DOOR  BUT DOOR IS CLOSE AND I CAN!!!!.====");
  sw1=1 ; 
  sw3=0; //DOOR OPEN 
  #0;
  #(period*0.3);
  sw2 = 0 ; 
  #(period*0.7);
  if(DUT.state!= 3'b100 || error !=0 || lock !=1) err = err +1;
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);
  #(period*0.7);
  if(DUT.state!= 3'b000 || error !=0 || lock !=0) err = err +1;
  $display("state : %b | error : %b | lock : %b | cnt : %b | ck : %b",DUT.state,error,lock,count,DUT.insert_pass);

 if(!err)
   $display("SUCCESS NO ERRORS !!!! |");
 else 
   $display("NO SUCCESS WITH %d ERRORS !!!! |",err);
 $finish;
 end
endmodule
