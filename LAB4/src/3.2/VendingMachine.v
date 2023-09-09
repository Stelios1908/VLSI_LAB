module VendingMachine(
  input clk,rst,c5,c10,NFC,beans,
  input [4:0] water,
  output coffee,error
);


//wire coffee;
//reg [1:0]message;
reg [1:0]state;
reg [1:0]nextstate;
//Morre
localparam [1:0]  S0 = 2'b00, //no water | no beans   
                  S1 = 2'b01, //water ok & beans ok
                  S2 = 2'b10, //credit5
                  S3 = 2'b11; //takecoffee


always @(posedge clk or negedge rst) begin
    if(!rst) begin
         state <= S1; 
        // nextstate <=S1;
    end
    else state <=nextstate;
end

always @(state or c5 or c10 or water or NFC or beans) begin

    case(state) 
      S0: nextstate = (water<2 | !beans)? S0 : S1;
      S1: nextstate = (water<2 | !beans)? S0:
                                   (c5)? S2:
                              (c10|NFC)? S3:  S1;
      S2: nextstate = (c5 | c10 | NFC )? S3:  S2;
      S3: nextstate = (water<2 | !beans)? S0 : S1;
      default: 
          begin
           nextstate = S1;
          end
    endcase
end

assign coffee = (state==2'b11)?1:0;
assign error = (!state==S0)?1:0;
endmodule
 
