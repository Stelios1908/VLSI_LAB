module controlUnit #(
    parameter size=8
)(
    input rst,clk,
    inout x_gt_y,x_lt_y,x_eq_y,
    output x_sel,y_sel,
    output y_ld,x_ld,x_sub,y_sub,
    output data_en
);

reg [2:0] state,nextstate;
localparam [2:0] START  =3'b000,
                 CMP    =3'b001,
                 X_GT   =3'b010,
                 Y_GT   =3'b011,
                 END    =3'b100;

always @(posedge clk or posedge rst) begin
    if(rst) state <=START;
    else state <= nextstate;
end


always @(state,x_gt_y,x_lt_y,x_eq_y) begin
  case(state)
     START:   nextstate = CMP;
       CMP:   nextstate = (x_gt_y)? X_GT:
                          (x_lt_y)? Y_GT:
                                    END;
      X_GT:   nextstate = CMP;
      Y_GT:   nextstate = CMP;
       END:   nextstate = END;

     default: nextstate = START;
  endcase
end

//load data only WHEN  sTate = START
assign {x_sel,y_sel} = (state==START)? 4'b11:4'b0;

//if x<y x stays the same and not loaded back into the register 
assign x_ld = (state ==CMP )? 1:0;

//if x>y y stays the same and not loaded back into the register
assign y_ld = (state ==CMP )? 1:0;

//if x<y sabtrack  x from  y
assign x_sub = (state == Y_GT)? 1:0;

//if x>y sabtrack  y from  x
assign y_sub = (state == X_GT)? 1:0;

assign data_en = (state == END)?1:0;

endmodule
