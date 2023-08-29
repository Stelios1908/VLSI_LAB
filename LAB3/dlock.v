module dlock (
    input [3:0]sw16, //keyboard
    input sw1, //for locking lock 
    input sw2, // ender
    input sw3,  //door open if sw3=1 and close  if sw3=0
    input rstn, //facory reset password  = 9999
    input clk,
    output lock,
    output reg Error,
    output reg [2:0]count
);
 //when we want to store new password to storage to the lockcomp
 reg prs;
 wire equal;
 reg [3:0]current_key;
 reg [15:0]insert_pass;
 reg [2:0]state,next_state;
 //lock state or not show i know after state LOCK_UNLOCK 
 //where i will go 
 reg stateLockOrUnlock=1;
 //current password
 reg [15:0]password =16'b1101111001110010;
 //this is the ABBC to get me out of the error state.
 reg [15:0]passToExitFromError = 16'b0010011001100010;
 //this is the #*# to tranfert me at the change password mode
 reg [11:0]passToGoChangeMode= 12'b111100011111;

 lockcomp #(.size(16),.factory_pass(0011001100110011/*9999*/)) lockcmp (
        .rstn(rstn),
        .prs(prs),
        .incode((stateLockOrUnlock==1 && !prs)?insert_pass:
                (stateLockOrUnlock==0 && !prs && !Error)?{4'b1111,insert_pass[11:0]}:
                (stateLockOrUnlock==0 && !prs &&  Error)?insert_pass:
                (stateLockOrUnlock==1 && prs && !Error)?password:
                (stateLockOrUnlock==1 && prs &&  Error )?passToExitFromError:
                (stateLockOrUnlock==0 && prs && !Error )?{4'b1111,passToGoChangeMode}:
                (stateLockOrUnlock==0 && prs &&  Error )?passToExitFromError:
                16'b0000000000000000),
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
     next_state<= LOCK;
     count <=0;
     Error<=0;
     password<=16'b0011001100110011;
  end
  else 
    state <= next_state;
end

always @(state , sw16,posedge sw1,posedge sw2,posedge sw3,negedge sw3)begin
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
                    if(stateLockOrUnlock==1 ) begin 
                       if(count !=0) begin
                           if(current_key !== 4'bz)  
                                next_state = ERROR;
                          else if(current_key === 4'bz) 
                              current_key=sw16;
                       end
                       if(sw2 || count==0 ) begin  
                           if(current_key!==4'bz) begin
                              insert_pass[(count*4)+:4]=current_key;
                              current_key=4'bz;
                              count=count+1;
                          end
                       end
                      if(count==4 && !Error) begin
                           prs=1;
                           #1;
                           prs=0;
                           #1;
                           if(equal/*insert_pass===password*/)
                              next_state = LOCK_UNLOCK;
                           else  
                              next_state = ERROR;
                           insert_pass=16'bx;
                       end
                       if(count==4 && Error) begin
                           prs=1;
                           #1;
                           prs=0;
                           #1;
                           if(equal/*insert_pass===passToExitFromError*/) begin
                              next_state = LOCK;
                              Error=0;
                           end
                           else  
                              next_state = ERROR;
                          insert_pass=16'bx;
                       end
                     end   //END stateLockOrUnlock==1

                     if(stateLockOrUnlock==0 && !Error ) begin
                       if(sw1 && !sw3) begin
                           next_state = LOCK_UNLOCK;
                       end
                       else if(count ==0 ) begin
                           insert_pass[(count*4)+:4]=current_key;
                           count = count+1;
                       end
                       else if (count>0 & count <3) begin
                           if(sw16 !== 4'bzzzz) begin
                              insert_pass[(count*4)+:4]=sw16;
                              count = count+1;
                           end
                           else if( sw2) begin
                              next_state =UNLOCK;
                           end
                        end
                      else if(count ==3) begin
                           if(sw2) begin  
                              prs=1;
                              #1;
                              prs=0;
                              #1;
                           if(equal/*insert_pass[11:0]==passToGoChangeMode[11:0]*/) begin
                                 count=0;
                                 next_state  = CHANGE_PASS;
                                 current_key=4'bzzzz;
                                 insert_pass=16'bx; 
                              end
                              else  begin
                                 count=0;
                                 next_state  = UNLOCK;
                                 current_key=4'bzzzz;
                                 insert_pass=16'bx;
                              end
                           end
                            else if(sw16 !== 4'bzzzz) begin
                                 count=0;
                                 next_state  = UNLOCK;
                                 current_key=4'bzzzz;
                                 insert_pass=16'bx;
                                 next_state = UNLOCK;
                           end
                        end
                    end//END stateLockOrUnlock==0 && NOT ERROR
                    
                    if(stateLockOrUnlock==0 && Error ) begin
                         if(count !=0) begin
                           if(current_key !== 4'bz)  
                                next_state = ERROR;
                           else if(current_key === 4'bz) 
                                current_key=sw16;
                       end
                       if(sw2 || count==0 ) begin  
                           if(current_key!==4'bz) begin
                              insert_pass[(count*4)+:4]=current_key;
                              current_key=4'bz;
                              count=count+1;
                          end
                       end
                      if(count==4) begin
                           prs=1;
                           #1;
                           prs=0;
                           #1;
                           if(equal/*insert_pass===passToExitFromError*/) begin
                               next_state = UNLOCK;
                               Error=0;
                               current_key=4'bz;
                               insert_pass=16'bx;
                           end
                           else  begin
                              next_state = ERROR;
                              insert_pass=16'bx;
                           end
                       end
                     end//END stateLockOrUnlock==0 &&  ERROR

                 end
    
      CHANGE_PASS:begin
                       if(sw2 && count==0) begin  
                              current_key=sw16;
                              if(current_key == 4'b0001 ||
                                 current_key == 4'b0010 ||
                                 current_key == 4'b0100 ||
                                 current_key == 4'b0101 ||
                                 current_key == 4'b0110 ||
                                 current_key == 4'b1111 ) begin
                                     next_state = ERROR;
                                     insert_pass=16'bx;
                              end
                              else begin
                                 insert_pass[(count*4)+:4]=current_key;
                                 current_key=4'bz;
                                 count=count+1;
                              end
                       end
                       else if(sw2) begin
                          if(current_key !== 4'bz)  
                              next_state = ERROR;
                          else  if(current_key === 4'bz) begin
                              current_key=sw16;
                              if(current_key == 4'b0001 ||
                                 current_key == 4'b0010 ||
                                 current_key == 4'b0100 ||
                                 current_key == 4'b0101 ||
                                 current_key == 4'b0110 ||
                                 current_key == 4'b1111 ) begin
                                     next_state = ERROR;
                                     insert_pass=16'bx;
                                     
                              end
                              else begin
                               insert_pass[(count*4)+:4]=current_key;
                               current_key=4'bz;
                               count=count+1;
                               end
                           end
                       end
                       
                      if(count ==4) begin
                           password = insert_pass;
                           next_state = UNLOCK;
                           count=0;
                           insert_pass=16'bx;
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
                  if(!sw3 && sw1)  begin
                      next_state = LOCK_UNLOCK;
                  end
                  else if(sw16 !==4'bz && !sw2) begin
                      current_key=sw16;
                      next_state = CODING;
                      count =0;
                  end
                     
              end
      ERROR:begin
                   Error=1;
                   if(sw2)begin
                        current_key=sw16;
                        next_state = CODING;
                        count =0;
                   end
            end
      default: next_state = LOCK;
  endcase

end

//assign Error =  (state == ERROR)? 1:Error;
assign lock  =  (state == LOCK_UNLOCK) ?1:0;

endmodule
