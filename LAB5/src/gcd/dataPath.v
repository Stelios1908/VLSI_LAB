module dataPath#(
    parameter size=8
)(
    input rst,
    input [size-1:0]x_i,
    input [size-1:0]y_i,
    input x_sel,y_sel,
    input x_ld,y_ld,
    input x_sub,y_sub,data_en,
    output x_gt_y,x_lt_y,x_eq_y,
    output [size-1:0]data_o

);
wire [size-1:0]mux_x,mux_y;
wire [size-1:0]sub;
reg [size-1:0]reg_x,reg_y,reg_o;


//register  for  x input
always @(posedge x_ld or posedge rst) begin 
   if(rst) reg_x <= {size{1'b0}};
   else reg_x <= mux_x;
end

//register fot y input
always @(posedge y_ld or posedge rst) begin 
   if(rst) reg_y <= {size{1'b0}};
   else reg_y <= mux_y;
end

//register for output
always @(posedge data_en or posedge rst) begin 
   if(rst) reg_o <= {size{1'b0}};
   else reg_o <= reg_x;
end

//muxx and mux y
assign mux_x = (x_sel==1)? x_i:
               (y_sub==1)? sub:reg_x;


assign mux_y = (y_sel==1)? y_i:
               (x_sub==1)? sub:reg_y;

//subtracktor combinational circuit
assign sub   = (x_sub==1)?reg_y-reg_x:
               (y_sub==1)?reg_x-reg_y:0;

//οθτπθτ 
assign x_gt_y  =(reg_x>reg_y)?1:0;
assign x_lt_y  =(reg_x<reg_y)?1:0;
assign x_eq_y  =(reg_x==reg_y)?1:0;
assign data_o = reg_o;



endmodule