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
 reg [2:0]state,next_state;
 //lock state or not show i know after state LOCK_UNLOCK 
 //where i will go 
 reg stateLockOrUnlock=1;
 //current password
 reg [15:0]password =16'b1101111001110010;
 //this is the ABBC to get me out of the error state.
 reg [15:0]passToExitFromError = 16'b0010011001100010;
 //this is the #*# to tranfert me at the change password mode
 reg [15:0]passToGoChangeMode= 16'b0000111100011111;

 lockcomp #(.size(16),.factory_pass(0011001100110011/*9999*/)) lockcmp (
        .rst(rstn),
        .prs(prs),
        .incode(/*(stateLockOrUnlock==1)?password:
                (!stateLockOrUnlock & state!=CHANGE_PASS)?passToGoChangeMode:
                (state!=ERROR)?passToExitFromError:
                16'b0000000000000000*/ password),
        .equal(equal)
   ) ;
 parameter  [2:0] LOCK=3'b000,
                  CHANGE_PASS=3'b001,
                  CODING=3'b011,
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

always @(state , sw16,posedge sw1,posedge sw2,posedge sw3)begin
  case(state)
        LOCK: begin
                    if(sw2) begin
                        current_key=sw16;
                        next_state = CODING;
                        count =0;
                    end
              end
            
      CODING: begin
                    //if the system is locked and  that means we are going  to unlock
                    //and not to change the password 
                    if(stateLockOrUnlock==1) begin 
                       if(count !=0) begin
                           if(current_key !== 4'bzzzz) 
                                next_state = ERROR;
                           else if(current_key == 4'bzzzz)
                              current_key=sw16;
                       end
                       if(sw2 || count==0 ) begin  
                           if(current_key!==4'bzzzz) begin
                              insert_pass[count+:4]=current_key;
                              current_key=4'bzzzz;
                              count=count+1;
                          end
                       end
                       if(count==4 && !Error) begin
                           if(insert_pass==password)
                              next_state = LOCK_UNLOCK;
                           else  
                              next_state = ERROR;
                       end
                       if(count==4 && Error) begin
                           if(insert_pass===passToExitFromError)
                              next_state = LOCK_UNLOCK;
                           else  
                              next_state = ERROR;
                       end
                     end   //END stateLockOrUnlock==1

                     if(stateLockOrUnlock==0) begin
                       if(sw1 && !sw3) begin
                           next_state = LOCK_UNLOCK;
                       end
                       else if(count ==0 ) begin
                           insert_pass[count+:4]=current_key;
                           count = count+1;
                       end
                       else if (count>0 & count <3) begin
                           if(sw16 !== 4'bzzzz) begin
                              insert_pass[count+:4]=sw16;
                              count = count+1;
                           end
                           else if(sw2) begin
                              next_state =UNLOCK;
                           end
                        end
                      else if(count ==3) begin
                           if(sw2) begin  
                              if(insert_pass[11:00]===passToGoChangeMode[11:0]) begin
                                 count=0;
                                 next_state  = CHANGE_PASS;
                              end
                              else  begin
                                 next_state  = UNLOCK;
                              end
                           end
                            else if(sw16 !== 4'bzzzz) begin
                               next_state = UNLOCK;
                           end
                        end
                    end//END stateLockOrUnlock==0
                 end
    
      CHANGE_PASS:begin
                      if(sw2)   begin
                         current_key=sw16;
                         if( current_key == 4'b0001 ||
                             current_key == 4'b0001 ||
                             current_key == 4'b0001 ||
                             current_key == 4'b0001 ) begin
                             next_state = Error;
                         end
                         else  if(current_key == 4'bzzzz) begin
                             insert_pass[count+:4]=current_key;
                             current_key=4'bzzzz;
                             count = count +1;
                          end
                         else if(current_key !==4'bzzzz ) begin
                              next_state = Error;
                         end
                      end
                      if(count ==4) begin
                           password = insert_pass;
                      end
                  end
      
    
      LOCK_UNLOCK:begin
                     
                     if( stateLockOrUnlock)
                        next_state =    UNLOCK;
                     //to go state LOCK is nessecary the door is closed
                     else if(!stateLockOrUnlock)
                        next_state = LOCK;
                     stateLockOrUnlock= ~stateLockOrUnlock;
                  end
      UNLOCK:begin 
                  if(!sw3 & sw1)  begin
                      next_state = LOCK_UNLOCK;
                  end
                  else if(sw16 !==4'bzzzz) begin
                      current_key=sw16;
                      next_state = CODING;
                      count =0;
                  end
                     
              end
      ERROR:begin
                   if(sw2)begin
                        current_key=sw16;
                        next_state = CODING;
                        count =0;
                   end
            end
  endcase

end

endmodule
