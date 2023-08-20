module dlock (
    input [3:0]sw16, //keyboard
    input sw1, //for locking lock 
    input sw2, // ender
    input sw3,  //door open if sw3=1 and close  if sw3=0
    input rstn, //facory reset password  = 9999
    input clk,
    output lock,
    output Error,
    output reg [1:0]count
);
 //when we want to store new password to storage to the lockcomp
 reg prs;
 wire equal;
 reg [3:0]current_key;
 reg [16:0]insert_pass;
 reg stateLockOrUnlock;
 reg [2:0]state,next_state;
 //current password
 reg [15:0]password =16'b1101111001110010;
 //this is the ABBC to get me out of the error state.
 reg passToExitFromError = 16'b0010011001100010;
 //this is the #*# to tranfert me at the change password mode
 reg passToGoChangeMode= 16'b0000111100011111;

 lockcomp #(.size(16),.factory_pass(0011001100110011/*9999*/)) lockcmp (
        .rst(rstn),
        .prs(prs),
        .incode((stateLockOrUnlock==1)?password:
                (!stateLockOrUnlock & state!=CHANGE_PASS)?passToGoChangeMode:
                (state!=ERROR)?passToExitFromError:
                16'b0000000000000000),
        .equal(equal)
   ) ;
 parameter  [2:0] LOCK=3'b000,
                  CHANGE_PASS=3'b001,
                  CHECK_PASS=3'b010,
                  INSERT_KEY=3'b011,
                  LOCK_UNLOCK=3'b100,
                  UNLOCK=3'b101,
                  ERROR=3'b110;


//for next state
always @(posedge clk or negedge rstn) begin
  if(!rstn) begin
     state <= UNLOCK;
     count <=0;
  end
  else 
    state <= next_state;
end

always @(state , sw16,posedge sw2, sw3)begin
  case(state)
      LOCK: next_state = INSERT_KEY;
      INSERT_KEY:begin
                    //if the system is locked and  that means we are going  to unlock
                    //and not to change the password 
                    if(stateLockOrUnlock==1) begin 
                       if(current_key == sw16) 
                           next_state = ERROR;
                       if(current_key == 4'bzzzz)
                              current_key=sw16;
                       //if press ender
                       if(sw2) begin  
                         if(current_key!=4'bzzzz) begin
                            insert_pass[(count*1)+:4]=current_key;
                            count=count+1;
                            current_key=4'bzzzz;
                         end
                       end
                       if(count ==3  | count==4)
                            next_state  = CHECK_PASS;
                    end
                 end
      CHECK_PASS:begin 
                    //if the system is locked 
                     if(stateLockOrUnlock) begin
                         if(equal)
                             next_state = LOCK_UNLOCK;
                         else 
                             next_state = ERROR;
                     end
                     else if (!stateLockOrUnlock) begin
                         if(count==3)
                            if(equal)
                               next_state =  CHANGE_PASS;
                            else 
                               next_state = ERROR;
                         else if(count==4)
                            if(equal) begin
                               password = insert_pass ;
                               next_state = INSERT_KEY;
                            end
                            else begin
                               next_state = ERROR;
                            end
                      end
                      count=0;
                 end
      CHANGE_PASS:;
      
    
      LOCK_UNLOCK:begin
                     
                     if( stateLockOrUnlock)
                        next_state =    UNLOCK;
                     //to go state LOCK is nessecary the door is closed
                     else if(!stateLockOrUnlock & !sw3)
                        next_state = LOCK;
                     stateLockOrUnloc= ~stateLockOrUnlock;
                  end
      UNLOCK:;
      ERROR:;
  endcase

end

endmodule