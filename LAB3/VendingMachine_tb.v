module VendingMachine_tb();

integer period=4;
integer cnt_coffee=0;
reg clk,rst,c5,c10,NFC,beans;
reg [4:0] water;
wire error,coffee;

integer i;
integer trials=5;
integer errors=0;
integer fullWater=20;

VendingMachine DUT(
                    .clk(clk),
                    .rst(rst),
                    .c5(c5),
                    .c10(c10),
                    .NFC(NFC),
                    .beans(beans),
                    .water(water),
                    .coffee(coffee),
                    .error(error)

) ; 

 always #(period*0.5) clk=~clk; 

 always @(*)begin if(coffee) water = water-1; cnt_coffee=cnt_coffee+1; end

 //every time  one of c5,c10,NFC becames 1 after period*0.30 will becames  0
  always @(posedge clk) begin
        #(period*0.30)
        c5=0;
        c10=0;
        NFC=0;
          
  end

//chech if outputs are wrong compared to the current  state
always@(DUT.state) begin
      #0.1;//must be delayed for a while to work rigth
     case(DUT.state)
         2'b00: begin
                    if(coffee | error)
                        errors=errors+1;
                 end
         2'b01: begin
                    if(coffee | !error) 
                       errors=errors+1;
                 end 
         2'b10: begin
                    if(coffee | !error)
                       errors=errors+1;
                 end
         2'b11:begin
                    if(!coffee | !error)
                        errors=errors+1;
                 end
       endcase
end


//basic section for test
 initial begin 
 $monitor("state = %b | coffee  = %b | ERROR = %b | c5 = %b | c10 =%b | NFC = %b | water  = %d | beans  = %d",DUT.state,coffee,error,c5,c10,NFC,water,beans);
    clk =0;
    rst=0;
    c5=0;
    c10=0;
    NFC=0;
    water=12;
    if(DUT.state!=2'b01)
        errors=errors;//+1;
     
    #(period*0.3);
    beans=1;// an to valo edo tha exo thema me to nextstate
    rst=1;
    #(period*0.7);
    
   
    for(i=0; i<trials; i=i+1) begin 
        //pame gia  kafe me dio c5
        $display("===============================================================================");
        $display("===================== C5 AND C5 ===============================================");
        c5=1;
        #(period*2);
        if(DUT.state!=2'b10 & error & water!=fullWater) 
           errors=errors+1;
           
        c5=1;
        #(period);
        if(DUT.state!=2'b11 & error & water!=fullWater) 
           errors=errors+1;
        #(period*6);
        if(DUT.state!=2'b01 & error & water!=fullWater) 
           errors=errors+1;
    
        //pame gia  kafe me ena c10
        $display("===============================================================================");
        $display("=====================     C10    ==============================================");
        c10=1;
        #(period);
        if(DUT.state!=2'b11 & error & water!=fullWater) 
           errors=errors+1;
        #(period*6);
         if(DUT.state!=2'b01 & error & water!=fullWater) 
           errors=errors+1;
      
        //pame gia  kafe me ena NFC
        $display("===============================================================================");
        $display("=====================   N F C   ===============================================");
        NFC=1;
        #(period);
        if(DUT.state!=2'b11 & error & water!=fullWater) 
           errors=errors+1;
        #(period*6);
        if(DUT.state!=2'b01 & error & water!=fullWater) 
           errors=errors+1;
      
        //pame gia  kafe me c5 kai meta  ena NFC
        $display("===============================================================================");
        $display("===================== C5 AND NFC ==============================================");
        c5=1;
        #(period);
        if(DUT.state!=2'b10 & error & water!=fullWater) 
           errors=errors+1;
        #(period*3);
        NFC=1;
        #(period);
        if(DUT.state!=2'b11 & error & water!=fullWater) 
            errors=errors+1;
        #(period*6);
      
         //pame gia  kafe me c5 kai meta c10
        $display("===============================================================================");
        $display("===================== C5 AND C10 ==============================================");
        c5=1;
        #(period);
        if(DUT.state!=2'b10 & error & water!=fullWater) 
           errors=errors+1;
        #(period*3);
        c10=1;
        #(period);
        if(DUT.state!=2'b11 & error & water!=fullWater) 
           errors=errors+1;
        #(period*6);
        if(DUT.state!=2'b01 & error & water!=fullWater) 
           errors=errors+1;
      
        if(i==3) begin  water=fullWater; end
        if(i==4) begin beans=0;   end
        else     begin beans=1;   end
    end  //end for
    
#10;
$display("===================END SEMULATION========================");
if(errors==0)
 $display(" SUCCESS ERRORS : %0d",errors);
else
  $display("NO SUCCESS ERRORS : %0d",errors);
$display("=========================================================");
$finish;
    
end

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
    
 end
endmodule
